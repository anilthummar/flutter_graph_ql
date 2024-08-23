import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_ql_flutter/mutation_screens/vehicle_cubit_state.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VehicleCubit extends Cubit<VehicleState> {

  VehicleCubit() : super(VehicleInitial());

  Future<void> updateVehicle(String customColorName) async {
    emit(VehicleLoading());

    const String mutation = r'''
      mutation($customColorName: String) {
        updateUserVehicle(customColorName: $customColorName) {
          data {
            custom_color
            vehicle_color {
              color_name
            }
          }
        }
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: {
        'customColorName': customColorName,
      },
    );

    try {
      // GraphQLClient client;
      // final result = await client.mutate(options);
      // if (result.hasException) {
      //   emit(VehicleFailure(result.exception.toString()));
      // } else {
        // Success, handle the response as needed
        emit(VehicleSuccess(customColorName));
      // }
    } catch (e) {
      emit(VehicleFailure(e.toString()));
    }
  }
}
