import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'vehicle_cubit.dart';
import 'vehicle_cubit_state.dart';

class UpdateVehicleScreen extends StatelessWidget {

  final TextEditingController _colorController = TextEditingController();

  UpdateVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Vehicle Color'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _colorController,
              decoration: const InputDecoration(
                labelText: 'Custom Color Name',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final colorName = _colorController.text;
                if (colorName.isNotEmpty) {
                  // Trigger the mutation using the Cubit
                  context.read<VehicleCubit>().updateVehicle(colorName);
                }
              },
              child: const Text('Update Vehicle Color'),
            ),
            const SizedBox(height: 20),
            // BlocBuilder listens to Cubit state changes
            BlocProvider(
              create: (context) => VehicleCubit(),
              child: BlocBuilder<VehicleCubit, VehicleState>(
                builder: (context, state) {
                  if (state is VehicleLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is VehicleSuccess) {
                    return Text(
                      'Vehicle updated successfully with color: ${state
                          .customColorName}',
                      style: const TextStyle(color: Colors.green),
                    );
                  } else if (state is VehicleFailure) {
                    return Text(
                      'Failed to update vehicle: ${state.error}',
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
