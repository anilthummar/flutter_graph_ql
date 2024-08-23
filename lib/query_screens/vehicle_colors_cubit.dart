import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';

import '../graphql_client.dart';
import '../model/vehicle_color.dart';

part 'vehicle_colors_state.dart';

class VehicleColorsCubit extends Cubit<VehicleColorsState> {

  final GraphQLService graphQLService;

  VehicleColorsCubit(this.graphQLService) : super(VehicleColorsInitial());


  Future<void> fetchVehicleColors() async {
    emit(VehicleColorsLoading());

    try {
      final QueryResult result = await graphQLService.fetchVehicleColors();

      if (result.hasException) {
        emit(VehicleColorsError(result.exception.toString()));
        return;
      }

      final List colorsData = result.data?['fetchVehicleColors']['data']['ColorsData'];

      List<VehicleColor> vehicleColors = colorsData
          .map<VehicleColor>((json) => VehicleColor.fromJson(json))
          .toList();

      emit(VehicleColorsLoaded(vehicleColors));
    } catch (error) {
      emit(VehicleColorsError(error.toString()));
    }
  }

}
