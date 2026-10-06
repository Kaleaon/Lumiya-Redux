//! Native packet header unpacking, sequence tracking, duplicate packet filtering,
//! and compressed 3D object update decoding for Second Life datagrams.

use jni::objects::{JByteBuffer, JClass, JFloatArray, JIntArray, JObject};
use jni::sys::{jboolean, jint, JNI_FALSE, JNI_TRUE};
use jni::JNIEnv;
use std::slice;

/// Size of the rolling sequence tracking bitmask window (in bits).
pub const SEQUENCE_WINDOW_BITS: usize = 2048;
const WINDOW_WORDS: usize = SEQUENCE_WINDOW_BITS / 64;

/// Rolling sequence tracking bitmask set for duplicate packet detection.
#[derive(Clone, Debug)]
pub struct PacketWindowTracker {
    last_seq: u32,
    window: [u64; WINDOW_WORDS],
}

impl Default for PacketWindowTracker {
    fn default() -> Self {
        Self::new()
    }
}

impl PacketWindowTracker {
    #[must_use]
    pub const fn new() -> Self {
        Self {
            last_seq: 0,
            window: [0; WINDOW_WORDS],
        }
    }

    /// Checks if a sequence number is a duplicate and records it if new.
    /// Returns `true` if `seq_num` was already seen (duplicate), `false` if new.
    pub fn is_duplicate(&mut self, seq_num: u32) -> bool {
        if seq_num == 0 {
            return false;
        }

        if self.last_seq == 0 {
            self.last_seq = seq_num;
            self.window[0] = 1;
            return false;
        }

        if seq_num > self.last_seq {
            let diff = (seq_num - self.last_seq) as usize;
            if diff >= SEQUENCE_WINDOW_BITS {
                self.window = [0; WINDOW_WORDS];
            } else {
                self.shift_window(diff);
            }
            self.last_seq = seq_num;
            self.set_bit(0);
            false
        } else {
            let diff = (self.last_seq - seq_num) as usize;
            if diff >= SEQUENCE_WINDOW_BITS {
                true // Too old to track, treat as duplicate
            } else if self.get_bit(diff) {
                true // Duplicate!
            } else {
                self.set_bit(diff);
                false
            }
        }
    }

    fn shift_window(&mut self, shift: usize) {
        if shift == 0 {
            return;
        }
        let word_shift = shift / 64;
        let bit_shift = shift % 64;

        if word_shift >= WINDOW_WORDS {
            self.window = [0; WINDOW_WORDS];
            return;
        }

        for i in (word_shift..WINDOW_WORDS).rev() {
            let mut val = self.window[i - word_shift];
            if bit_shift > 0 {
                val <<= bit_shift;
                if i > word_shift {
                    val |= self.window[i - word_shift - 1] >> (64 - bit_shift);
                }
            }
            self.window[i] = val;
        }

        for item in self.window.iter_mut().take(word_shift) {
            *item = 0;
        }
        if bit_shift > 0 && word_shift < WINDOW_WORDS {
            let mask = (1u64 << bit_shift) - 1;
            self.window[word_shift] &= !mask;
        }
    }

    fn get_bit(&self, index: usize) -> bool {
        let word = index / 64;
        let bit = index % 64;
        if word < WINDOW_WORDS {
            (self.window[word] & (1u64 << bit)) != 0
        } else {
            false
        }
    }

    fn set_bit(&mut self, index: usize) {
        let word = index / 64;
        let bit = index % 64;
        if word < WINDOW_WORDS {
            self.window[word] |= 1u64 << bit;
        }
    }

    #[must_use]
    pub const fn last_seq(&self) -> u32 {
        self.last_seq
    }
}

/// Unpacked Second Life packet header metadata.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct UnpackedPacketHeader {
    pub seq_num: u32,
    pub is_reliable: bool,
    pub is_resent: bool,
    pub has_acks: bool,
    pub zero_coded: bool,
    pub body_offset: usize,
    pub body_len: usize,
    pub acks: Vec<u32>,
}

/// Unpacks Second Life UDP packet header fields.
pub fn unpack_packet_header(
    rx_bytes: &[u8],
    tracker: &mut PacketWindowTracker,
) -> Result<Option<UnpackedPacketHeader>, &'static str> {
    if rx_bytes.len() < 6 {
        return Err("Buffer too short for SL packet header");
    }

    let flags = rx_bytes[0];
    let is_reliable = (flags & 0x80) != 0;
    let is_resent = (flags & 0x40) != 0;
    let has_acks = (flags & 0x20) != 0;
    let zero_coded = (flags & 0x10) != 0;

    let seq_num = u32::from_be_bytes([rx_bytes[1], rx_bytes[2], rx_bytes[3], rx_bytes[4]]);
    let extra_offset = rx_bytes[5] as usize;

    let mut body_end = rx_bytes.len();
    let mut acks = Vec::new();

    if has_acks {
        if body_end < 7 {
            return Err("Buffer too short for ACK count");
        }
        let ack_count = rx_bytes[body_end - 1] as usize;
        let acks_bytes_len = ack_count * 4;
        if body_end < 7 + acks_bytes_len {
            return Err("Buffer too short for ACK list");
        }

        body_end -= 1 + acks_bytes_len;
        let mut ack_pos = body_end;
        for _ in 0..ack_count {
            let ack_seq = u32::from_be_bytes([
                rx_bytes[ack_pos],
                rx_bytes[ack_pos + 1],
                rx_bytes[ack_pos + 2],
                rx_bytes[ack_pos + 3],
            ]);
            acks.push(ack_seq);
            ack_pos += 4;
        }
    }

    let mut body_offset = 6 + extra_offset;
    if body_offset > body_end {
        body_offset = body_end;
    }

    if tracker.is_duplicate(seq_num) {
        return Ok(None);
    }

    Ok(Some(UnpackedPacketHeader {
        seq_num,
        is_reliable,
        is_resent,
        has_acks,
        zero_coded,
        body_offset,
        body_len: body_end - body_offset,
        acks,
    }))
}

// ---------------------------------------------------------------------------
//  Dequantization & Compressed Object Decoding
// ---------------------------------------------------------------------------

/// Quantized 16-bit unsigned integer to 32-bit float dequantization matching LLTersePacking.
#[must_use]
pub fn u16_to_float(val: u16, min: f32, max: f32) -> f32 {
    let range = max - min;
    let scale = 1.525_902_2e-5_f32; // 1.0 / 65535.0
    let res = (f32::from(val) * scale * range) + min;
    if res.abs() < range * scale {
        0.0
    } else {
        res
    }
}

/// Quantized 8-bit unsigned integer to 32-bit float dequantization matching LLTersePacking.
#[must_use]
pub fn u8_to_float(val: u8, min: f32, max: f32) -> f32 {
    let range = max - min;
    let scale = 0.003_921_569_f32; // 1.0 / 255.0
    let res = (f32::from(val) * scale * range) + min;
    if res.abs() < range * scale {
        0.0
    } else {
        res
    }
}

/// Decodes 16-bit packed 3D vector.
#[must_use]
pub fn unpack_u16_vector3(
    data: &[u8],
    min_xy: f32,
    max_xy: f32,
    min_z: f32,
    max_z: f32,
) -> Option<[f32; 3]> {
    if data.len() < 6 {
        return None;
    }
    let x_u16 = u16::from_le_bytes([data[0], data[1]]);
    let y_u16 = u16::from_le_bytes([data[2], data[3]]);
    let z_u16 = u16::from_le_bytes([data[4], data[5]]);

    Some([
        u16_to_float(x_u16, min_xy, max_xy),
        u16_to_float(y_u16, min_xy, max_xy),
        u16_to_float(z_u16, min_z, max_z),
    ])
}

/// Decodes 16-bit packed quaternion (rotation).
#[must_use]
pub fn unpack_u16_quaternion(data: &[u8], min: f32, max: f32) -> Option<[f32; 4]> {
    if data.len() < 6 {
        return None;
    }
    let x_u16 = u16::from_le_bytes([data[0], data[1]]);
    let y_u16 = u16::from_le_bytes([data[2], data[3]]);
    let z_u16 = u16::from_le_bytes([data[4], data[5]]);

    let x = u16_to_float(x_u16, min, max);
    let y = u16_to_float(y_u16, min, max);
    let z = u16_to_float(z_u16, min, max);

    let w_sq = 1.0 - (x * x + y * y + z * z);
    let w = if w_sq > 0.0 { w_sq.sqrt() } else { 0.0 };

    Some([x, y, z, w])
}

/// Decodes 8-bit packed 3D vector.
#[must_use]
pub fn unpack_u8_vector3(
    data: &[u8],
    min_xy: f32,
    max_xy: f32,
    min_z: f32,
    max_z: f32,
) -> Option<[f32; 3]> {
    if data.len() < 3 {
        return None;
    }
    Some([
        u8_to_float(data[0], min_xy, max_xy),
        u8_to_float(data[1], min_xy, max_xy),
        u8_to_float(data[2], min_z, max_z),
    ])
}

/// Decodes 8-bit packed quaternion.
#[must_use]
pub fn unpack_u8_quaternion(data: &[u8], min: f32, max: f32) -> Option<[f32; 4]> {
    if data.len() < 3 {
        return None;
    }
    let x = u8_to_float(data[0], min, max);
    let y = u8_to_float(data[1], min, max);
    let z = u8_to_float(data[2], min, max);

    let w_sq = 1.0 - (x * x + y * y + z * z);
    let w = if w_sq > 0.0 { w_sq.sqrt() } else { 0.0 };

    Some([x, y, z, w])
}

/// Parsed compressed 3D object update struct.
#[derive(Clone, Debug, PartialEq)]
pub struct ParsedCompressedObject {
    pub uuid_msb: u64,
    pub uuid_lsb: u64,
    pub local_id: u32,
    pub p_code: u8,
    pub attachment_id: u8,
    pub position: [f32; 3],
    pub scale: [f32; 3],
    pub velocity: [f32; 3],
    pub rotation: [f32; 4],
    pub owner_msb: u64,
    pub owner_lsb: u64,
    pub parent_id: u32,
    pub update_flags: u32,
}

/// Parses compressed 3D object update bitstream.
pub fn parse_compressed_object_update(data: &[u8]) -> Option<ParsedCompressedObject> {
    if data.len() < 22 {
        return None;
    }

    let uuid_msb = u64::from_be_bytes(data[0..8].try_into().ok()?);
    let uuid_lsb = u64::from_be_bytes(data[8..16].try_into().ok()?);
    let local_id = u32::from_le_bytes(data[16..20].try_into().ok()?);
    let p_code = data[20];
    let state = data[21];
    let attachment_id = (((state & 0xFF) & 240) >> 4) | (((state & 0xFF) & (!240)) << 4);

    let mut pos = 22;
    if data.len() < pos + 36 {
        return None;
    }

    let pos_x = f32::from_le_bytes(data[pos..pos + 4].try_into().ok()?);
    let pos_y = f32::from_le_bytes(data[pos + 4..pos + 8].try_into().ok()?);
    let pos_z = f32::from_le_bytes(data[pos + 8..pos + 12].try_into().ok()?);
    pos += 12;

    let scale_x = f32::from_le_bytes(data[pos..pos + 4].try_into().ok()?);
    let scale_y = f32::from_le_bytes(data[pos + 4..pos + 8].try_into().ok()?);
    let scale_z = f32::from_le_bytes(data[pos + 8..pos + 12].try_into().ok()?);
    pos += 12;

    let rot_x = f32::from_le_bytes(data[pos..pos + 4].try_into().ok()?);
    let rot_y = f32::from_le_bytes(data[pos + 4..pos + 8].try_into().ok()?);
    let rot_z = f32::from_le_bytes(data[pos + 8..pos + 12].try_into().ok()?);
    pos += 12;

    let rot_w_sq = 1.0 - (rot_x * rot_x + rot_y * rot_y + rot_z * rot_z);
    let rot_w = if rot_w_sq > 0.0 { rot_w_sq.sqrt() } else { 0.0 };

    let mut compressed_flags = 0u32;
    if data.len() >= pos + 4 {
        compressed_flags = u32::from_le_bytes(data[pos..pos + 4].try_into().ok()?);
        pos += 4;
    }

    let mut owner_msb = 0u64;
    let mut owner_lsb = 0u64;
    if data.len() >= pos + 16 {
        owner_msb = u64::from_be_bytes(data[pos..pos + 8].try_into().ok()?);
        owner_lsb = u64::from_be_bytes(data[pos + 8..pos + 16].try_into().ok()?);
        pos += 16;
    }

    let mut parent_id = 0u32;
    if (compressed_flags & 32) != 0 && data.len() >= pos + 4 {
        parent_id = u32::from_le_bytes(data[pos..pos + 4].try_into().ok()?);
    }

    Some(ParsedCompressedObject {
        uuid_msb,
        uuid_lsb,
        local_id,
        p_code,
        attachment_id,
        position: [pos_x, pos_y, pos_z],
        scale: [scale_x, scale_y, scale_z],
        velocity: [0.0, 0.0, 0.0],
        rotation: [rot_x, rot_y, rot_z, rot_w],
        owner_msb,
        owner_lsb,
        parent_id,
        update_flags: compressed_flags,
    })
}

// ---------------------------------------------------------------------------
//  JNI Exports
// ---------------------------------------------------------------------------

static mut TRACKER: PacketWindowTracker = PacketWindowTracker::new();

/// JNI entry point for `SLCircuit.nativeProcessReceive`.
///
/// Unpacks packet header, updates sequence tracking, filters duplicate packets,
/// and populates outputs.
///
/// Returns 1 if packet is valid and unpacked, 0 if duplicate (filtered), -1 on error.
#[allow(unsafe_code)]
#[allow(static_mut_refs)]
#[allow(unused_variables)]
#[no_mangle]
pub unsafe extern "C" fn Java_com_lumiyaviewer_lumiya_slproto_SLCircuit_nativeProcessReceive(
    env: JNIEnv,
    _class: JClass,
    rx_buffer: JObject,
    length: jint,
    out_meta: JIntArray, // [seq_num, is_reliable, is_resent, zero_coded, has_acks, body_offset, body_len]
    out_acks: JIntArray,
) -> jint {
    if length <= 0 {
        return -1;
    }

    let byte_buf = JByteBuffer::from(rx_buffer);
    let buf_ptr = match env.get_direct_buffer_address(&byte_buf) {
        Ok(ptr) if !ptr.is_null() => ptr,
        _ => return -1,
    };

    let rx_slice = slice::from_raw_parts(buf_ptr, length as usize);

    match unpack_packet_header(rx_slice, &mut TRACKER) {
        Ok(Some(header)) => {
            let meta_slice = [
                header.seq_num as i32,
                if header.is_reliable { 1 } else { 0 },
                if header.is_resent { 1 } else { 0 },
                if header.zero_coded { 1 } else { 0 },
                if header.has_acks { 1 } else { 0 },
                header.body_offset as i32,
                header.body_len as i32,
            ];

            let _ = env.set_int_array_region(&out_meta, 0, &meta_slice);

            if !header.acks.is_empty() {
                let acks_i32: Vec<i32> = header.acks.iter().map(|&a| a as i32).collect();
                let _ = env.set_int_array_region(&out_acks, 0, &acks_i32);
            }

            1
        }
        Ok(None) => 0, // Duplicate packet
        Err(_) => -1,
    }
}

/// JNI entry point for `SLObjectInfo.nativeApplyObjectUpdate`.
///
/// Unpacks compressed 3D object update bitfields into native float arrays.
#[allow(unsafe_code)]
#[allow(unused_variables)]
#[no_mangle]
pub unsafe extern "C" fn Java_com_lumiyaviewer_lumiya_slproto_objects_SLObjectInfo_nativeApplyObjectUpdate(
    env: JNIEnv,
    _class: JClass,
    data_buffer: JObject,
    length: jint,
    out_ints: JIntArray,   // [local_id, p_code, attachment_id, parent_id, flags]
    out_floats: JFloatArray, // [pos_x, pos_y, pos_z, scale_x, scale_y, scale_z, rot_x, rot_y, rot_z, rot_w]
) -> jboolean {
    if length <= 0 {
        return JNI_FALSE;
    }

    let byte_buf = JByteBuffer::from(data_buffer);
    let buf_ptr = match env.get_direct_buffer_address(&byte_buf) {
        Ok(ptr) if !ptr.is_null() => ptr,
        _ => return JNI_FALSE,
    };

    let slice = slice::from_raw_parts(buf_ptr, length as usize);

    if let Some(parsed) = parse_compressed_object_update(slice) {
        let ints = [
            parsed.local_id as i32,
            i32::from(parsed.p_code),
            i32::from(parsed.attachment_id),
            parsed.parent_id as i32,
            parsed.update_flags as i32,
        ];
        let floats = [
            parsed.position[0],
            parsed.position[1],
            parsed.position[2],
            parsed.scale[0],
            parsed.scale[1],
            parsed.scale[2],
            parsed.rotation[0],
            parsed.rotation[1],
            parsed.rotation[2],
            parsed.rotation[3],
        ];

        let _ = env.set_int_array_region(&out_ints, 0, &ints);
        let _ = env.set_float_array_region(&out_floats, 0, &floats);

        JNI_TRUE
    } else {
        JNI_FALSE
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_sequence_tracking_and_duplicate_filtering() {
        let mut tracker = PacketWindowTracker::new();

        assert!(!tracker.is_duplicate(100));
        assert!(tracker.is_duplicate(100)); // Duplicate!

        assert!(!tracker.is_duplicate(101));
        assert!(!tracker.is_duplicate(102));
        assert!(tracker.is_duplicate(101)); // Duplicate!

        // Out-of-order within window
        assert!(!tracker.is_duplicate(95));
        assert!(tracker.is_duplicate(95)); // Duplicate!
    }

    #[test]
    fn test_u16_to_float_and_u8_to_float_quantization() {
        assert_eq!(u16_to_float(0, -128.0, 384.0), -128.0);
        assert_eq!(u16_to_float(65535, -128.0, 384.0), 384.0);

        let mid = u16_to_float(32768, -1.0, 1.0);
        assert!((mid - 0.0).abs() < 0.001);

        assert_eq!(u8_to_float(0, -1.0, 1.0), -1.0);
        assert_eq!(u8_to_float(255, -1.0, 1.0), 1.0);
    }

    #[test]
    fn test_u16_vector3_and_quaternion_unpacking() {
        let vec_data = [0u8, 0u8, 255u8, 255u8, 0u8, 128u8]; // x=min, y=max, z=mid
        let vec = unpack_u16_vector3(&vec_data, -128.0, 384.0, -256.0, 4096.0).unwrap();
        assert_eq!(vec[0], -128.0);
        assert_eq!(vec[1], 384.0);
        assert!((vec[2] - 1920.0).abs() < 10.0);

        let quat_data = [0u8, 0u8, 0u8, 0u8, 0u8, 0u8]; // identity quat
        let quat = unpack_u16_quaternion(&quat_data, -1.0, 1.0).unwrap();
        assert_eq!(quat[0], -1.0);
        assert_eq!(quat[1], -1.0);
        assert_eq!(quat[2], -1.0);
    }

    #[test]
    fn test_packet_header_unpacking_with_acks() {
        let mut tracker = PacketWindowTracker::new();

        // Header: flags=0xA0 (Reliable + Has Acks), seq_num=1000, extra=0, body, 1 ACK=500
        let mut packet = vec![0xA0, 0x00, 0x00, 0x03, 0xE8, 0x00];
        packet.extend_from_slice(&[0x11, 0x22, 0x33, 0x44]); // body
        packet.extend_from_slice(&[0x00, 0x00, 0x01, 0xF4]); // ACK seq 500
        packet.push(1); // 1 ACK

        let header = unpack_packet_header(&packet, &mut tracker)
            .unwrap()
            .unwrap();
        assert_eq!(header.seq_num, 1000);
        assert!(header.is_reliable);
        assert!(header.has_acks);
        assert_eq!(header.acks, vec![500]);

        // Duplicate call returns None
        let dup = unpack_packet_header(&packet, &mut tracker).unwrap();
        assert!(dup.is_none());
    }
}
