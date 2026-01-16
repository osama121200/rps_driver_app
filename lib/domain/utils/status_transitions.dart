import '../enums/trip_status.dart';

class StatusTransitions {
  static final Map<TripStatus, List<TripStatus>> allowed = {
    TripStatus.assigned: const [TripStatus.onWayToPickup],
    TripStatus.onWayToPickup: const [TripStatus.loading],
    TripStatus.loading: const [TripStatus.inTransit],
    TripStatus.inTransit: const [TripStatus.customs, TripStatus.ferry, TripStatus.unloading, TripStatus.completed],
    TripStatus.customs: const [TripStatus.inTransit, TripStatus.ferry, TripStatus.unloading],
    TripStatus.ferry: const [TripStatus.inTransit, TripStatus.unloading],
    TripStatus.unloading: const [TripStatus.completed],
    TripStatus.completed: const [],
  };

  static bool isAllowed(TripStatus from, TripStatus to) {
    return allowed[from]?.contains(to) ?? false;
  }
}

