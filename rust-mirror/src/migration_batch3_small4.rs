//! Rust behavior mirrors for the fifth small Kotlin migration batch.

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MuteType {
    ByName,
    Agent,
    Object,
    Group,
    External,
}

impl MuteType {
    #[must_use]
    pub const fn view_order(self) -> i32 {
        match self {
            Self::ByName => 2,
            Self::Agent => 0,
            Self::Object => 1,
            Self::Group => 3,
            Self::External => 4,
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
#[repr(i32)]
pub enum DeRezDestination {
    SaveIntoAgentInventory = 0,
    AcquireToAgentInventory = 1,
    SaveIntoTaskInventory = 2,
    Attachment = 3,
    TakeIntoAgentInventory = 4,
    ForceToGodInventory = 5,
    Trash = 6,
    AttachmentToInventory = 7,
    AttachmentExists = 8,
    ReturnToOwner = 9,
    ReturnToLastOwner = 10,
}

impl DeRezDestination {
    #[must_use]
    pub const fn code(self) -> i32 {
        self as i32
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn mute_view_order_matches_the_jvm_contract() {
        assert_eq!(MuteType::Agent.view_order(), 0);
        assert_eq!(MuteType::Object.view_order(), 1);
        assert_eq!(MuteType::ByName.view_order(), 2);
        assert_eq!(MuteType::Group.view_order(), 3);
        assert_eq!(MuteType::External.view_order(), 4);
    }

    #[test]
    fn derez_wire_codes_match_the_jvm_contract() {
        assert_eq!(DeRezDestination::SaveIntoAgentInventory.code(), 0);
        assert_eq!(DeRezDestination::TakeIntoAgentInventory.code(), 4);
        assert_eq!(DeRezDestination::Trash.code(), 6);
        assert_eq!(DeRezDestination::ReturnToLastOwner.code(), 10);
    }
}
