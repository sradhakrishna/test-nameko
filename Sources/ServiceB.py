from nameko.events import event_handler

class ServiceB:
    """ Event listening service."""
    name = "service_b"

    @event_handler("service_a", "event_type")
    def handle_event(self, payload):
        print("service b received", payload)
