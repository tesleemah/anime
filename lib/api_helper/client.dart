import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
final HttpLink aniListurl = HttpLink(
    "https://graphql.anilist.co",
    );
  ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
          link: aniListurl
          , cache: GraphQLCache()
      )
  );





//The graphql_flutter package requires your GraphQLClient to be wrapped in a ValueNotifier because the GraphQLProvider widget (which provides it globally) listens to this notifier.
// 
// So basically:
// 🧠 ValueNotifier makes the client observable — the UI can rebuild when the client updates.