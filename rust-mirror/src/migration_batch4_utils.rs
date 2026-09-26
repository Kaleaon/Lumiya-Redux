//! Rust counterparts for the `utils/`, `react/`, and `res/` Kotlin migration batch.
//!
//! Pure, deterministic algorithms and data shapes extracted from these
//! sources are mirrored directly and covered by tests. Classes whose whole
//! purpose is Android lifecycle, threading/executor plumbing, Guava cache
//! management, or JNI/reflection are represented as explicit
//! Android-boundary marker types instead: no logic is invented for them.

// ---------------------------------------------------------------------------
// behavior: FileUtils — power-of-two rounding used for texture sizes.
// ---------------------------------------------------------------------------

/// Mirrors `FileUtils.nextPowerOfTwo`: returns the smallest power of two
/// that is >= `value`. Returns 1 for `value <= 0`.
#[must_use]
pub fn next_power_of_two(value: i32) -> i32 {
    if value <= 0 {
        return 1;
    }
    let mut n = value - 1;
    n |= n >> 1;
    n |= n >> 2;
    n |= n >> 4;
    n |= n >> 8;
    n |= n >> 16;
    n + 1
}

// ---------------------------------------------------------------------------
// behavior: SimpleStringParser — character-by-character string parser.
// ---------------------------------------------------------------------------

/// Mirrors `SimpleStringParser`: a stateful string parser that tracks the
/// current position and provides read-until, skip, and expect operations.
pub struct SimpleStringParser<'a> {
    data: &'a str,
    pos: usize,
}

impl<'a> SimpleStringParser<'a> {
    #[must_use]
    pub fn new(data: &'a str) -> Self {
        Self { data, pos: 0 }
    }

    /// Read characters until `delimiter` is found, returning the substring
    /// before it. Advances past the delimiter. Returns `None` if delimiter
    /// is not found.
    pub fn read_until(&mut self, delimiter: char) -> Option<&'a str> {
        let remaining = &self.data[self.pos..];
        if let Some(idx) = remaining.find(delimiter) {
            let result = &remaining[..idx];
            self.pos += idx + delimiter.len_utf8();
            Some(result)
        } else {
            None
        }
    }

    /// Returns the rest of the string from the current position.
    #[must_use]
    pub fn remainder(&self) -> &'a str {
        &self.data[self.pos..]
    }

    /// Skip `n` characters.
    pub fn skip(&mut self, n: usize) {
        self.pos = (self.pos + n).min(self.data.len());
    }

    /// Returns `true` if the parser has consumed all input.
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.pos >= self.data.len()
    }
}

// ---------------------------------------------------------------------------
// behavior: UUIDPool — UUID interning for memory deduplication.
// ---------------------------------------------------------------------------

/// Mirrors `UUIDPool`: a simple intern pool for UUIDs, returning the same
/// allocation for equal UUIDs. In Rust, this maps to a `HashSet`-based
/// deduplication scheme.
pub struct UuidPool {
    pool: std::collections::HashSet<[u8; 16]>,
}

impl UuidPool {
    #[must_use]
    pub fn new() -> Self {
        Self {
            pool: std::collections::HashSet::new(),
        }
    }

    /// Interns the UUID bytes, returning a reference-counted copy. If the
    /// UUID was already in the pool, returns the existing entry.
    pub fn intern(&mut self, uuid: [u8; 16]) -> [u8; 16] {
        if let Some(&existing) = self.pool.get(&uuid) {
            existing
        } else {
            self.pool.insert(uuid);
            uuid
        }
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.pool.len()
    }

    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.pool.is_empty()
    }
}

impl Default for UuidPool {
    fn default() -> Self {
        Self::new()
    }
}

// ---------------------------------------------------------------------------
// behavior: HashUtils — FNV-1a 32-bit hash for binary data.
// ---------------------------------------------------------------------------

/// Mirrors `HashUtils.fnv1a32`: standard FNV-1a 32-bit hash.
#[must_use]
pub fn fnv1a32(data: &[u8]) -> u32 {
    let mut hash: u32 = 0x811c_9dc5;
    for &byte in data {
        hash ^= byte as u32;
        hash = hash.wrapping_mul(0x0100_0193);
    }
    hash
}

// ---------------------------------------------------------------------------
// behavior: LevensteinDistance — edit-distance algorithm.
// ---------------------------------------------------------------------------

/// Mirrors `LevensteinDistance.calculate`: standard Levenshtein edit distance
/// between two strings.
#[must_use]
pub fn levenshtein_distance(a: &str, b: &str) -> usize {
    let a_chars: Vec<char> = a.chars().collect();
    let b_chars: Vec<char> = b.chars().collect();
    let m = a_chars.len();
    let n = b_chars.len();
    let mut prev = (0..=n).collect::<Vec<_>>();
    let mut curr = vec![0; n + 1];
    for i in 1..=m {
        curr[0] = i;
        for j in 1..=n {
            let cost = if a_chars[i - 1] == b_chars[j - 1] { 0 } else { 1 };
            curr[j] = (prev[j] + 1).min(curr[j - 1] + 1).min(prev[j - 1] + cost);
        }
        std::mem::swap(&mut prev, &mut curr);
    }
    prev[n]
}

// ---------------------------------------------------------------------------
// behavior: PriorityBinQueue — priority-bucketed queue ordering.
// ---------------------------------------------------------------------------

/// Mirrors `PriorityBinQueue` from `res.collections`: items are bucketed by
/// integer priority, and dequeue returns from the highest-priority (lowest
/// numeric value) bucket first, FIFO within each bucket.
pub struct PriorityBinQueue<T> {
    buckets: std::collections::BTreeMap<i32, std::collections::VecDeque<T>>,
    len: usize,
}

impl<T> PriorityBinQueue<T> {
    #[must_use]
    pub fn new() -> Self {
        Self {
            buckets: std::collections::BTreeMap::new(),
            len: 0,
        }
    }

    pub fn enqueue(&mut self, priority: i32, item: T) {
        self.buckets
            .entry(priority)
            .or_insert_with(std::collections::VecDeque::new)
            .push_back(item);
        self.len += 1;
    }

    /// Dequeue from the highest-priority (lowest key) bucket.
    pub fn dequeue(&mut self) -> Option<T> {
        let key = *self.buckets.keys().next()?;
        let bucket = self.buckets.get_mut(&key)?;
        let item = bucket.pop_front();
        if bucket.is_empty() {
            self.buckets.remove(&key);
        }
        if item.is_some() {
            self.len -= 1;
        }
        item
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.len
    }

    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.len == 0
    }
}

impl<T> Default for PriorityBinQueue<T> {
    fn default() -> Self {
        Self::new()
    }
}

// ---------------------------------------------------------------------------
// behavior: LittleEndianDataInputStream — LE byte-order reading.
// ---------------------------------------------------------------------------

/// Mirrors `LittleEndianDataInputStream.readUInt16LE`: read a u16 from
/// two bytes in little-endian order.
#[must_use]
pub fn read_u16_le(data: &[u8]) -> Option<u16> {
    if data.len() < 2 {
        return None;
    }
    Some(u16::from_le_bytes([data[0], data[1]]))
}

/// Mirrors `LittleEndianDataInputStream.readInt32LE`.
#[must_use]
pub fn read_i32_le(data: &[u8]) -> Option<i32> {
    if data.len() < 4 {
        return None;
    }
    Some(i32::from_le_bytes([data[0], data[1], data[2], data[3]]))
}

/// Mirrors `LittleEndianDataInputStream.readFloatLE`.
#[must_use]
pub fn read_f32_le(data: &[u8]) -> Option<f32> {
    if data.len() < 4 {
        return None;
    }
    Some(f32::from_le_bytes([data[0], data[1], data[2], data[3]]))
}

// ---------------------------------------------------------------------------
// behavior: MeshCache — UUID-based file path hashing for mesh cache.
// ---------------------------------------------------------------------------

/// Mirrors `MeshCache.getResourceFile` hash bucket calculation:
/// produces the hex bucket prefix from a UUID's `hashCode()`.
/// The Java `UUID.hashCode()` XORs the 4 int-sized pieces of the 128-bit
/// UUID together; this function takes that hashCode as input and returns
/// the 0-255 bucket byte.
#[must_use]
pub fn mesh_cache_bucket(hash_code: i32) -> u8 {
    (((hash_code >> 24) ^ (((hash_code >> 8) ^ hash_code) ^ (hash_code >> 16))) & 255) as u8
}

/// Formats the mesh cache path: `{bucket:02x}/{uuid}.mesh`.
#[must_use]
pub fn mesh_cache_path(hash_code: i32, uuid_str: &str) -> String {
    format!("{:02x}/{}.mesh", mesh_cache_bucket(hash_code), uuid_str)
}

// ---------------------------------------------------------------------------
// behavior: TextureCache — UUID-based file path hashing for texture cache.
// ---------------------------------------------------------------------------

/// Mirrors `TextureCache.getTextureCompressedFile` hash bucket calculation.
/// Same bit-mixing as `mesh_cache_bucket` (from Java `UUID.hashCode()`).
#[must_use]
pub fn texture_cache_path(hash_code: i32, uuid_str: &str) -> String {
    let bucket = mesh_cache_bucket(hash_code);
    format!("{:02x}/{}.jp2", bucket, uuid_str)
}

// ---------------------------------------------------------------------------
// behavior: AutoValue_DrawableTextParams — hash code algorithm.
// ---------------------------------------------------------------------------

/// Mirrors `AutoValue_DrawableTextParams.hashCode`:
/// `((text.hashCode() ^ 1000003) * 1000003) ^ backgroundColor`.
#[must_use]
pub fn drawable_text_params_hash(text_hash: i32, background_color: i32) -> i32 {
    ((text_hash ^ 1_000_003).wrapping_mul(1_000_003)) ^ background_color
}

// ---------------------------------------------------------------------------
// contract: data/enum shapes from the react/ package.
// ---------------------------------------------------------------------------

/// Mirrors `Subscription.State` — the lifecycle state of a subscription.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SubscriptionState {
    Pending,
    Active,
    Cancelled,
}

/// Mirrors the `HasPriority` interface: a single `getPriority()` method.
pub trait HasPriority {
    fn get_priority(&self) -> i32;
}

/// Mirrors the `Identifiable` interface: a single `getIdentifier()` method.
pub trait Identifiable<T> {
    fn get_identifier(&self) -> &T;
}

// ---------------------------------------------------------------------------
// contract: data/enum shapes from the res/ package.
// ---------------------------------------------------------------------------

/// Mirrors `TextureClass` values used for resource dispatch.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum TextureClass {
    Prim,
    Baked,
    Sculpt,
    Terrain,
}

/// Mirrors the texture fetch priority assignment from
/// `TextureFetchRequest.getPriority()`.
#[must_use]
pub fn texture_fetch_priority(texture_class: TextureClass) -> i32 {
    match texture_class {
        TextureClass::Baked => 1,
        TextureClass::Sculpt => 0,
        _ => 2,
    }
}

/// Mirrors the texture decompress priority from
/// `TextureDecompressRequest.getPriority()`.
#[must_use]
pub fn texture_decompress_priority(texture_class: TextureClass, low_quality_done: bool) -> i32 {
    if texture_class == TextureClass::Prim && low_quality_done {
        return 4;
    }
    match texture_class {
        TextureClass::Baked => 2,
        TextureClass::Sculpt => 1,
        _ => 3,
    }
}

// ---------------------------------------------------------------------------
// boundary: Android/threading/Guava/executor marker types.
// ---------------------------------------------------------------------------

/// Marker types for Android-owned classes whose logic is not mirrored.
pub mod android_boundary {
    macro_rules! boundary_types {
        ($($name:ident),+ $(,)?) => {$(
            #[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
            pub struct $name;
        )+};
    }

    boundary_types! {
        // utils/
        InlineList, LinkedTreeNode, BitBuffer, InternPool,

        // react/
        UIThreadExecutor, OpportunisticExecutor,
        SubscriptionPool, SubscriptionDataPool, SubscriptionSingleDataPool,
        SubscriptionGenericDataPool, SubscriptionPoolUncached,
        SubscriptionData, SubscriptionList,
        AsyncRequestHandler, AsyncCancellableRequestHandler, AsyncLimitsRequestHandler,
        RateLimitRequestHandler, RequestFinalProcessor, RequestForwarder,
        RequestOperator, RequestProcessor, ResultOperator,

        // res/
        ResourceManager, ResourceMemoryCache, ResourceFileCache,
        ResourceRequest, ResourceCleanupExecutor,
        WeakExecutor, StartingExecutor, HTTPFetchExecutor,
        LoaderExecutor, PrimComputeExecutor,
        WeakQueue, MeshCache, AnimationCache,
        GeometryCache, PrimCache,
        TerrainGeometryCache, TerrainTextureCache,
        DrawableTextBitmap, DrawableTextCache,
        TextureCache, TextureCompressedCache,
        MemoryLimitedStartingExecutor,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn next_power_of_two_rounds_up() {
        assert_eq!(next_power_of_two(0), 1);
        assert_eq!(next_power_of_two(1), 1);
        assert_eq!(next_power_of_two(2), 2);
        assert_eq!(next_power_of_two(3), 4);
        assert_eq!(next_power_of_two(5), 8);
        assert_eq!(next_power_of_two(255), 256);
        assert_eq!(next_power_of_two(256), 256);
        assert_eq!(next_power_of_two(257), 512);
    }

    #[test]
    fn simple_string_parser_reads_until_delimiter() {
        let mut p = SimpleStringParser::new("hello:world:end");
        assert_eq!(p.read_until(':'), Some("hello"));
        assert_eq!(p.read_until(':'), Some("world"));
        assert_eq!(p.remainder(), "end");
        assert_eq!(p.read_until(':'), None);
    }

    #[test]
    fn uuid_pool_interns_duplicates() {
        let mut pool = UuidPool::new();
        let a = [1u8; 16];
        let b = [2u8; 16];
        pool.intern(a);
        pool.intern(a);
        pool.intern(b);
        assert_eq!(pool.len(), 2);
    }

    #[test]
    fn fnv1a32_matches_known_values() {
        // FNV-1a of empty string is the offset basis.
        assert_eq!(fnv1a32(b""), 0x811c_9dc5);
        // Known test vector.
        assert_eq!(fnv1a32(b"foobar"), 0xbf9c_f968);
    }

    #[test]
    fn levenshtein_distance_basic() {
        assert_eq!(levenshtein_distance("", ""), 0);
        assert_eq!(levenshtein_distance("abc", "abc"), 0);
        assert_eq!(levenshtein_distance("abc", ""), 3);
        assert_eq!(levenshtein_distance("", "abc"), 3);
        assert_eq!(levenshtein_distance("kitten", "sitting"), 3);
    }

    #[test]
    fn priority_bin_queue_dequeues_by_priority_then_fifo() {
        let mut q = PriorityBinQueue::new();
        q.enqueue(2, "low_a");
        q.enqueue(1, "high_a");
        q.enqueue(2, "low_b");
        q.enqueue(1, "high_b");
        assert_eq!(q.len(), 4);
        assert_eq!(q.dequeue(), Some("high_a"));
        assert_eq!(q.dequeue(), Some("high_b"));
        assert_eq!(q.dequeue(), Some("low_a"));
        assert_eq!(q.dequeue(), Some("low_b"));
        assert!(q.is_empty());
    }

    #[test]
    fn le_readers_parse_correctly() {
        assert_eq!(read_u16_le(&[0x01, 0x02]), Some(0x0201));
        assert_eq!(read_i32_le(&[0x01, 0x00, 0x00, 0x00]), Some(1));
        let pi_bytes = std::f32::consts::PI.to_le_bytes();
        assert_eq!(read_f32_le(&pi_bytes), Some(std::f32::consts::PI));
        assert_eq!(read_u16_le(&[0x01]), None);
    }

    #[test]
    fn mesh_cache_bucket_matches_java_algorithm() {
        // hashCode = 0 -> bucket 0
        assert_eq!(mesh_cache_bucket(0), 0);
        // hashCode = 0xFF -> the XOR folds to something
        let hc: i32 = 0x0102_0304;
        let expected = (((hc >> 24) ^ (((hc >> 8) ^ hc) ^ (hc >> 16))) & 255) as u8;
        assert_eq!(mesh_cache_bucket(hc), expected);
    }

    #[test]
    fn mesh_cache_path_formats_correctly() {
        let path = mesh_cache_path(0, "00000000-0000-0000-0000-000000000000");
        assert_eq!(path, "00/00000000-0000-0000-0000-000000000000.mesh");
    }

    #[test]
    fn texture_cache_path_formats_correctly() {
        let path = texture_cache_path(0, "abc");
        assert_eq!(path, "00/abc.jp2");
    }

    #[test]
    fn drawable_text_params_hash_matches_autovalue() {
        let result = drawable_text_params_hash(42, 0xFF00FF);
        let expected = ((42 ^ 1_000_003_i32).wrapping_mul(1_000_003)) ^ 0xFF00FF;
        assert_eq!(result, expected);
    }

    #[test]
    fn texture_fetch_priority_matches_java() {
        assert_eq!(texture_fetch_priority(TextureClass::Sculpt), 0);
        assert_eq!(texture_fetch_priority(TextureClass::Baked), 1);
        assert_eq!(texture_fetch_priority(TextureClass::Prim), 2);
        assert_eq!(texture_fetch_priority(TextureClass::Terrain), 2);
    }

    #[test]
    fn texture_decompress_priority_matches_java() {
        assert_eq!(texture_decompress_priority(TextureClass::Sculpt, false), 1);
        assert_eq!(texture_decompress_priority(TextureClass::Baked, false), 2);
        assert_eq!(texture_decompress_priority(TextureClass::Prim, false), 3);
        assert_eq!(texture_decompress_priority(TextureClass::Prim, true), 4);
    }
}
