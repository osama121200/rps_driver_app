enum TripStatus {
  assigned,
  onWayToPickup,
  loading,
  inTransit,
  customs,
  ferry,
  unloading,
  completed,
}

extension TripStatusName on TripStatus {
  String get name {
    switch (this) {
      case TripStatus.assigned:
        return 'assigned';
      case TripStatus.onWayToPickup:
        return 'on_way_to_pickup';
      case TripStatus.loading:
        return 'loading';
      case TripStatus.inTransit:
        return 'in_transit';
      case TripStatus.customs:
        return 'customs';
      case TripStatus.ferry:
        return 'ferry';
      case TripStatus.unloading:
        return 'unloading';
      case TripStatus.completed:
        return 'completed';
    }
  }
}

