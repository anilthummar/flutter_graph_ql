import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_ql_flutter/query_screens/vehicle_colors_cubit.dart';

import '../graphql_client.dart';


class VehicleColorsScreen extends StatelessWidget {

  const VehicleColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Colors'),
      ),
      body: BlocProvider(
        create: (_) => VehicleColorsCubit(GraphQLService())..fetchVehicleColors(),
        child: BlocBuilder<VehicleColorsCubit, VehicleColorsState>(
          builder: (context, state) {
            if (state is VehicleColorsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VehicleColorsLoaded) {
              return ListView.builder(
                itemCount: state.vehicleColorList.length,
                itemBuilder: (context, index) {
                  final color = state.vehicleColorList[index];
                  return ListTile(
                    title: Text(color.colorName),
                    subtitle: Text(color.colorNameAr),
                    trailing: Container(
                      width: 20,
                      height: 20,
                      color: Color(int.parse("0xFF${color.hexCode.substring(1)}")),
                    ),
                  );
                },
              );
            } else if (state is VehicleColorsError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No colors available'));
          },
        ),
      ),
    );
  }
}
