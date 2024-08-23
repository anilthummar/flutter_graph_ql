abstract class VehicleState {}

class VehicleInitial extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleSuccess extends VehicleState {
  final String customColorName;
  VehicleSuccess(this.customColorName);
}

class VehicleFailure extends VehicleState {
  final String error;
  VehicleFailure(this.error);
}
