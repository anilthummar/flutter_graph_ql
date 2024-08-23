part of 'vehicle_colors_cubit.dart';

@immutable
sealed class VehicleColorsState {}

final class VehicleColorsInitial extends VehicleColorsState {}

final class VehicleColorsLoading extends VehicleColorsState {}

final  class VehicleColorsLoaded extends VehicleColorsState {
  final List<VehicleColor> vehicleColorList;

  VehicleColorsLoaded(this.vehicleColorList);
}

final  class VehicleColorsError extends VehicleColorsState {
  final String message;

  VehicleColorsError(this.message);
}