import 'package:anime/api_helper/queries.dart';
import 'package:anime/Screens/home_screen1.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 200,
              ),
            )
        ),
      ),
      backgroundColor: Color(0xFFEBEBEB),

      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 10,
                  top: 10
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Query(
                        options: QueryOptions(
                            document: headingSeriesQuery
                        ),
                        builder: (QueryResult result,
                            {  refetch,
                              fetchMore
                            }) {
                          if (result.isLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (result.data == null) {
                            return Center(
                              child: Text(
                                  "No article found"
                              ),
                            );
                          }
                          final List<dynamic> mediaList = result
                              .data?['Page']?['media'] ?? [];
                          if (mediaList.isEmpty) {
                            return Center(
                              child: Text(
                                  "No anime found"
                              ),
                            );
                          }

                          if (result.hasException) {
                            return Column(
                              children: [
                                Text('Error: ${result.exception.toString()}'),
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
                                final seasonYear = (media['seasonYear'].toString()) ;
                                final genres = media['genres'].toString() ;
                                final imageUrl = media['coverImage']?['large'] ?? '';
                                return
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(width: 300,height: 200,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular((12.0)
                                                  )
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              elevation: 5,
                                              child: Stack(
                                                children: [
                                                  if (imageUrl.isNotEmpty)
                                                  Container(
                                                    width: 300,
                                                    height: 200,
                                                    child:
                                                      Image.network(
                                                        imageUrl,fit: BoxFit.cover,)
                                                  )
                                                  else
                                                     Text('Error loading the image'),
                                                  Opacity(
                                                    opacity: 0.6,
                                                    child: Container(width: 300,height: 200,
                                                      decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                          colors: [
                                                            Colors.black,
                                                            Colors.transparent,
                                                          ],
                                                          begin: Alignment.bottomCenter,
                                                          end: Alignment.topCenter,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 12,
                                                      right: 12,
                                                      bottom: 12,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            title,
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          const SizedBox(height: 4),
                                                          Text(
                                                            seasonYear,
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 13,

                                                            ),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          Text(
                                                            genres,
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 13,
                                                            ),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                  ),
                                          Positioned(
                                              right: 12,
                                              bottom: 12,
                                              child: Icon(Icons.play_circle_fill,size: 32,
                                                color: Colors.white,
                                              )
                                          )
                                          ],
                                        )
                                  )
                                ),
                              ),

                                      ]
                                    )
                                  );

                              }
                          );
                        }
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, top: 30),
              child: Text("Trending Series",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                  fontSize: 13,
                    color: Color(0xFF424242),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Expanded(
                child: SizedBox(
                width: 150,
                height: 150,
                  child: Query(
                        options: QueryOptions(
                            document: trendingSeriesQuery
                        ),
                        builder: (QueryResult result,
                            {  refetch,
                              fetchMore
                            }) {
                          if (result.isLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (result.data == null) {
                            return Center(
                              child: Text(
                                  "No article found"
                              ),
                            );
                          }
                          final List<dynamic> mediaList = result
                              .data?['Page']?['media'] ?? [];
                          if (mediaList.isEmpty) {
                            return Center(
                              child: Text(
                                  "No anime found"
                              ),
                            );
                          }

                          if (result.hasException) {
                            return Column(
                              children: [
                                Text('Error: ${result.exception.toString()}'),
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
                                    padding: EdgeInsets.only(left: 20),
                                    child: Column(
                                      children: [
                                        Expanded(
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
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: SizedBox(
                                              width:100,
                                              child: Align(
                                                alignment:Alignment.center,
                                                child: Text(title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10,
                                                  color: Color(0xFF424242),
                                                ),
                                                                                          ),
                                              ),
                                            ),
                                        ),

                                      ],
                                    ),
                                  );
                              }
                          );
                        }
                    ),
                  ),
              ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, top: 30),
              child: Text("Popular Series",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Query(
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
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  children: [
                                    Expanded(
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
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: SizedBox(
                                        width:100,
                                        child: Align(
                                          alignment:Alignment.center,
                                          child: Text(title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                              color: Color(0xFF424242),
                                            ),
                                          ),
                                        ),
                                      ),),
                                  ],
                                ),
                              );
                          }
                      );
                    }
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, top: 30),
              child: Text("Latest Series",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Query(
                        options: QueryOptions(
                            document: latestSeriesQuery
                        ),
                        builder: (QueryResult result,
                            {  refetch,
                              fetchMore
                            }) {
                          if (result.isLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (result.data == null) {
                            return Center(
                              child: Text(
                                  "No article found"
                              ),
                            );
                          }
                          final List<dynamic> mediaList = result
                              .data?['Page']?['media'] ?? [];
                          if (mediaList.isEmpty) {
                            return Center(
                              child: Text(
                                  "No anime found"
                              ),
                            );
                          }

                          if (result.hasException) {
                            return Column(
                              children: [
                                Text('Error: ${result.exception.toString()}'),
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
                                final title = media['title']?['romaji'] ?? 'No title';
                                final imageUrl = media['coverImage']?['large'] ?? '';
                                return
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Column(
                                      children: [
                                        Expanded(
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
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: SizedBox(
                                            width:100,
                                            child: Align(
                                              alignment:Alignment.center,
                                              child: Text(title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10,
                                                  color: Color(0xFF424242),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  );
                              }
                          );
                        }
                    ),
                  ),
                ),
              ],
            ),
      ]
        ),
    )
      );
  }
}