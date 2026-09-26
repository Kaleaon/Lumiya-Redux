//! Platform-neutral lifecycle and observer contracts.

/// Starts deferred work.
pub trait Startable {
    fn start(&mut self);
}

/// Requests an unconditional refresh.
pub trait RefreshableOne {
    fn request_refresh(&mut self);
}

/// Ends an unkeyed subscription.
pub trait UnsubscribableOne {
    fn unsubscribe(&mut self);
}

/// Requests an update identified by `K`.
pub trait Refreshable<K> {
    fn request_update(&mut self, key: K);
}

/// Observes the arrival of a new request.
pub trait RequestListener {
    fn on_new_request(&mut self);
}

/// Observes a list mutation.
pub trait OnListUpdated {
    fn on_list_updated(&mut self);
}

/// Receives the result of a completed request.
pub trait RequestCompleteListener<T> {
    fn on_request_complete(&mut self, result: T);
}

/// Releases or otherwise handles a value removed from an owner.
pub trait DisposeHandler<T> {
    fn on_dispose(&mut self, value: T);
}

#[cfg(test)]
mod tests {
    use super::{DisposeHandler, OnListUpdated, Refreshable, RequestCompleteListener};

    #[derive(Default)]
    struct Recorder {
        updates: Vec<u32>,
        completed: Vec<String>,
        disposed: Vec<String>,
        list_updates: usize,
    }

    impl Refreshable<u32> for Recorder {
        fn request_update(&mut self, key: u32) {
            self.updates.push(key);
        }
    }

    impl RequestCompleteListener<String> for Recorder {
        fn on_request_complete(&mut self, result: String) {
            self.completed.push(result);
        }
    }

    impl DisposeHandler<String> for Recorder {
        fn on_dispose(&mut self, value: String) {
            self.disposed.push(value);
        }
    }

    impl OnListUpdated for Recorder {
        fn on_list_updated(&mut self) {
            self.list_updates += 1;
        }
    }

    #[test]
    fn callbacks_deliver_owned_values_once() {
        let mut recorder = Recorder::default();
        recorder.request_update(7);
        recorder.on_request_complete("ready".to_owned());
        recorder.on_dispose("stale".to_owned());
        recorder.on_list_updated();

        assert_eq!(recorder.updates, [7]);
        assert_eq!(recorder.completed, ["ready"]);
        assert_eq!(recorder.disposed, ["stale"]);
        assert_eq!(recorder.list_updates, 1);
    }
}
