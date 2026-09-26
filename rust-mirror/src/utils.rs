//! Counterparts to `com.lumiyaviewer.lumiya.utils` contracts.

/// Exposes the stable identifier used by list and cache infrastructure.
pub trait Identifiable {
    /// Identifier type chosen by the implementing model.
    type Id;

    /// Returns this value's stable identifier.
    fn id(&self) -> &Self::Id;
}

/// Predicate used to include or exclude values.
pub trait AbstractFilter<T> {
    /// Returns whether `value` passes this filter.
    fn pass_filter(&self, value: &T) -> bool;
}

impl<T, F> AbstractFilter<T> for F
where
    F: Fn(&T) -> bool,
{
    fn pass_filter(&self, value: &T) -> bool {
        self(value)
    }
}

/// Supplies either the normal or alternate view of a list.
pub trait HasList<V> {
    /// Returns the requested list view.
    fn list(&self, alternate: bool) -> &[V];
}

#[cfg(test)]
mod tests {
    use super::{AbstractFilter, HasList, Identifiable};

    struct Item {
        id: u64,
    }

    impl Identifiable for Item {
        type Id = u64;

        fn id(&self) -> &Self::Id {
            &self.id
        }
    }

    struct Lists {
        normal: Vec<u8>,
        alternate: Vec<u8>,
    }

    impl HasList<u8> for Lists {
        fn list(&self, alternate: bool) -> &[u8] {
            if alternate {
                &self.alternate
            } else {
                &self.normal
            }
        }
    }

    #[test]
    fn utility_contracts_preserve_expected_behavior() {
        let item = Item { id: 42 };
        assert_eq!(*item.id(), 42);

        let even = |value: &u8| value.is_multiple_of(2);
        assert!(even.pass_filter(&4));
        assert!(!even.pass_filter(&3));

        let lists = Lists {
            normal: vec![1, 2],
            alternate: vec![3],
        };
        assert_eq!(lists.list(false), [1, 2]);
        assert_eq!(lists.list(true), [3]);
    }
}
