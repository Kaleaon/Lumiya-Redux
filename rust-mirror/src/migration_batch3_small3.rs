//! Rust behavior mirrors for the fourth small Kotlin migration batch.

/// Counts occurrences of one character, matching `StringUtils.countOccurrences`.
#[must_use]
pub fn count_occurrences(value: &str, character: char) -> usize {
    value
        .chars()
        .filter(|candidate| *candidate == character)
        .count()
}

/// Stateful MSB-first reader matching the JVM `BitBuffer` bit ordering.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct BitBuffer<'a> {
    bytes: &'a [u8],
    byte_position: usize,
    bit_position: u8,
}

impl<'a> BitBuffer<'a> {
    #[must_use]
    pub const fn new(bytes: &'a [u8]) -> Self {
        Self {
            bytes,
            byte_position: 0,
            bit_position: 0,
        }
    }

    /// Reads at most 32 bits. Each complete eight-bit group occupies the next
    /// more-significant byte of the returned value, as in the recovered JVM code.
    pub fn get_bits(&mut self, count: u8) -> Option<u32> {
        if count > 32 {
            return None;
        }
        let available = self.bytes.len().saturating_sub(self.byte_position) * 8
            - usize::from(self.bit_position);
        if usize::from(count) > available {
            return None;
        }

        let mut output = [0_u8; 4];
        for output_bit in 0..count {
            let output_byte = usize::from(output_bit / 8);
            output[output_byte] <<= 1;
            if self.bytes[self.byte_position] & (0x80 >> self.bit_position) != 0 {
                output[output_byte] |= 1;
            }
            self.bit_position += 1;
            if self.bit_position == 8 {
                self.bit_position = 0;
                self.byte_position += 1;
            }
        }
        Some(u32::from_le_bytes(output))
    }

    #[must_use]
    pub fn is_eof(&self) -> bool {
        self.byte_position >= self.bytes.len()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn bit_reader_preserves_jvm_group_order() {
        let mut reader = BitBuffer::new(&[0xb2, 0x69]);
        assert_eq!(reader.get_bits(3), Some(0b101));
        assert_eq!(reader.get_bits(5), Some(0b1_0010));
        assert_eq!(reader.get_bits(8), Some(0x69));
        assert!(reader.is_eof());
    }

    #[test]
    fn bit_reader_returns_none_without_advancing_when_input_is_short() {
        let mut reader = BitBuffer::new(&[0xff]);
        assert_eq!(reader.get_bits(9), None);
        assert_eq!(reader.get_bits(8), Some(0xff));
    }

    #[test]
    fn occurrence_count_supports_unicode_characters() {
        assert_eq!(count_occurrences("Lumiya migration", 'i'), 3);
        assert_eq!(count_occurrences("rust 🦀 rust 🦀", '🦀'), 2);
    }
}
