import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final String apiUrl = 'https://banzeenyapi.demo.brainvire.dev/gql';

  ValueNotifier<GraphQLClient> initializeClient() {
    final HttpLink httpLink = HttpLink(apiUrl);

    final GraphQLClient client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );

    return ValueNotifier(client);
  }

  Future<QueryResult> fetchVehicleColors() async {
    String query = '''
      query {
        fetchVehicleColors {
          data {
            ColorsData {
              color_name
              is_selected
              uuid
              color_name_ar
              hex_code
            }
          }
        }
      }
    ''';

    final GraphQLClient client = GraphQLClient(
      link: HttpLink(apiUrl),
      cache: GraphQLCache(),
    );

    final QueryResult result = await client.query(
      QueryOptions(document: gql(query)),
    );

    return result;
  }
}



// query{
// fetchVehicleColors {
// data {
// ColorsData {
// color_name
// is_selected
// uuid
// color_name_ar
// hex_code
// }
// }
// meta {
// errors {
// error
// errorField
// }
// errorType
// message
// messageCode
// status
// statusCode
// type
//
// }
// }
// }