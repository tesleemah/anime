import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:anime/api_helper/queries.dart';

class popularSeries extends StatefulWidget {
  const popularSeries({super.key});

  @override
  State<popularSeries> createState() => _popularSeriesState();
}

class _popularSeriesState extends State<popularSeries> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Query(
              options: QueryOptions(
                  document: popularSeriesQuery
              ),builder: (QueryResult popularresult,{ refetch,fetchMore}) {
            if (popularresult.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (popularresult.data == null) {
              return Center(
                child: Text("No article found"),
              );
            }
            final List<dynamic> mediaList = popularresult.data?['Page']?['media'] ?? [];
            if (mediaList.isEmpty) {
              return Center(
                child: Text("No anime found"),
              );
            }
            if (popularresult.hasException) {
              return Column(children:
              [
                Text('Error: ${popularresult.exception.toString()}'),
                ElevatedButton(onPressed: (refetch),
                    child: Text('Try Again Later'))
              ],
              );
            }
            return ListView.builder(
                itemCount: mediaList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final media = mediaList[index] as Map<String, dynamic>;
                  final title = media['title']?['english'] ?? 'No title';
                  final imageUrl = media['coverImage']?['large'] ?? '';
                  return
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0)
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((12.0)
                            )
                        ),
                        clipBehavior: Clip.antiAlias,
                        elevation: 5,
                        child: imageUrl.isNotEmpty ? Image.network(
                          imageUrl,fit: BoxFit.cover,) : null,
                      ),
                    );
                }
            );
          }
          ),
        ],
      ),
    );
  }
}
