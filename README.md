# graph_ql_flutter

A new Flutter project. graph_ql_flutter

https://dev.to/yatendra2001/end-to-end-tutorial-integrating-graphql-with-flutter-526f

## Getting Started

This project is a starting point for a Flutter application.**graph_ql_flutter**

In a GraphQL backend architecture, there are 3 basic components:

**Query** — Used for querying/reading data from the database.
**Mutation** — Used for manipulation of data like Create, Update, Delete.
**Subscriptions**— Used for real-time data updates.


These 3 works as the basic building blocks of any 
**GraphQL server which performs the CRUD Operations (Create, Read, Update, Delete).**



**graphql_flutter: ^5.1.2**


**GraphQL Flutter
Installation
Migration Guide
Usage
GraphQL Provider
Query
Fetch More (Pagination)
Mutations
Optimism
Subscriptions
GraphQL Consumer
Other hooks
Code generation**



GraphQL brings many benefits, both to the client: 
**devices will need fewer requests, and therefore reduce data usage. And to the programmer**: requests are arguable, 
they have the same structure as the request.

**This project combines the benefits of GraphQL with the benefits of Streams in Dart to deliver a high-performance client**.

**The project took inspiration from the Apollo GraphQL client, great work guys!**


**1.Connecting to the Server**
First of all the operations, a connection to the server is the most important part. 
So, for that, we will be wrapping our whole application i.e. 
the MaterialApp widget to a widget called GraphQLProvider which is defined in the graphql_flutter package

``Widget build(BuildContext context) {
final HttpLink link = HttpLink(uri: "http://10.0.2.2:4000/");``

    ValueNotifier<GraphQLClient> client =
        ValueNotifier(GraphQLClient(cache: InMemoryCache(), link: link));

    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          home: HomePage(),
        ));
}`


**2.Data Models and Schema**
**defined a file called schema.graphql in your GraphQL project**
**3.Executing Query operation**
**4.Executing Mutation Operation**

