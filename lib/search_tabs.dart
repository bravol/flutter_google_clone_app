import 'package:flutter/material.dart';
import 'package:flutter_google_clone_app/search_tab.dart';

class SearchTabs extends StatefulWidget {
  const SearchTabs({super.key});

  @override
  State<SearchTabs> createState() => _SearchTabsState();
}

class _SearchTabsState extends State<SearchTabs> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SearchTab(
            icon: Icons.search,
            text: 'ALL',
            isActive: true,
          ),
          SizedBox(width: 10),
          SearchTab(
            icon: Icons.image,
            text: 'Images',
            // isActive: true,
          ),
          SizedBox(width: 10),
          SearchTab(
            icon: Icons.map,
            text: 'Maps',
            // isActive: true,
          ),
          SizedBox(width: 10),
          SearchTab(
            icon: Icons.article,
            text: 'News',
            // isActive: true,
          ),
          SizedBox(width: 20),
          SearchTab(
            icon: Icons.shop,
            text: 'Shopping',
            // isActive: true,
          ),
          SizedBox(width: 20),
          SearchTab(
            icon: Icons.more_vert,
            text: 'More',
            // isActive: true,
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
