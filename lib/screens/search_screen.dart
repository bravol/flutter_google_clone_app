import 'package:flutter/material.dart';
import 'package:flutter_google_clone_app/colors.dart';
import 'package:flutter_google_clone_app/search_header.dart';
import 'package:flutter_google_clone_app/search_tabs.dart';
import 'package:flutter_google_clone_app/services/api_service.dart';
import 'package:flutter_google_clone_app/widgets/search_footer.dart';
import 'package:flutter_google_clone_app/widgets/search_result_component.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen(
      {super.key, required this.start, required this.searchQuery});
  final String start;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Title(
        // for the title of the website
        color: Colors.blue, // This is required
        title: searchQuery,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // for the header part of the website showing search text field
                const SearchHeader(),
                // for showing ALL, IMAGES, MAPS etc tabs
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SearchTabs(),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 0,
                ),
                // showing search results
                FutureBuilder<Map<String, dynamic>>(
                  future: ApiServices()
                      .fetchData(queryTerm: searchQuery, start: start),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // showing the time it took to fetch results
                          Container(
                            padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150, top: 12),
                            child: Text(
                              "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF70757a),
                              ),
                            ),
                          ),
                          // displaying the results
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?['items'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: size.width <= 768 ? 10 : 150,
                                    top: 10),
                                child: SearchResultComponent(
                                  linkToGo: snapshot.data?['items'][index]
                                      ['link'],
                                  link: snapshot.data?['items'][index]
                                      ['formattedUrl'],
                                  text: snapshot.data?['items'][index]['title'],
                                  description: snapshot.data?['items'][index]
                                      ['snippet'],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          // pagination
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    child: const Text(
                                      "< Prev",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: blueColor,
                                      ),
                                    ),
                                    // if start is 0, we are on the first page
                                    onPressed: start != "0"
                                        ? () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchScreen(
                                                  searchQuery: searchQuery,
                                                  start: (int.parse(start) - 10)
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          }
                                        : () {}),
                                const SizedBox(width: 30),
                                TextButton(
                                  child: const Text(
                                    "Next >",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: blueColor,
                                    ),
                                  ),
                                  // if start is 0, we are on the first page
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                          searchQuery: searchQuery,
                                          start: (int.parse(start) + 10)
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          const SearchFooter(),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//AIzaSyChrpP7LRMP-H_JNusdcczB8AL9cbkV4Uw