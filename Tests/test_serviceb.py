from nameko.standalone.events import event_dispatcher
from nameko.testing.services import entrypoint_waiter

from ServiceB import ServiceB

def test_event_interface(container_factory, rabbit_config):
    container = container_factory(ServiceB, rabbit_config)
    container.start()

    dispatch = event_dispatcher(rabbit_config)

    # prints "service b received payload" before "exited"
    with entrypoint_waiter(container, 'handle_event'):
        dispatch("service_a", "event_type", "payload")
    print("exited")
