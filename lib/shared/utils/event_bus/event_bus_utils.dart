import 'package:event_bus/event_bus.dart';

class EventBusUtils {
  static final EventBusUtils _instance = EventBusUtils._internal();

  factory EventBusUtils() => _instance;

  late final EventBus _eventBus;

  EventBusUtils._internal() {
    _eventBus = EventBus();
  }

  Stream<T> on<T>() {
    return _eventBus.on<T>();
  }

  void fire(dynamic event) {
    _eventBus.fire(event);
  }

  void destroy() {
    _eventBus.destroy();
  }
}