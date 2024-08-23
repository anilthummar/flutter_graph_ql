import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_ql_flutter/query_screens/query_vehicle_colors_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_client.dart';
import 'mutation_screens/update_vehicle_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the GraphQL Client
  final GraphQLService graphQLService = GraphQLService();

  runApp(MyApp(graphQLService: graphQLService));

}

class MyApp extends StatelessWidget {

  final GraphQLService graphQLService;
  const MyApp({Key? key, required this.graphQLService}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphQLService.initializeClient(),
      child:  CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GraphQL Flutter',
          home: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VehicleColorsScreen(),
                  ),
                );
              },
              child: const Text("Query (get vehicle colors)"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  UpdateVehicleScreen( ),
                  ),
                );
              },
              child: const Text("Mutation"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Subscription"),
            ),
          ],
        ),
      ),
    );
  }
}
