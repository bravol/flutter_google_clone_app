import 'package:flutter/material.dart';
import 'package:flutter_google_clone_app/widgets/web/search_button.dart';

class SearchButtons extends StatefulWidget {
  const SearchButtons({super.key});

  @override
  State<SearchButtons> createState() => _SearchButtonsState();
}

class _SearchButtonsState extends State<SearchButtons> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SearchButton(title: 'Google Search'),
            SizedBox(width: 10),
            SearchButton(title: 'I\'m feeling lucky'),
          ],
        )
      ],
    );
  }
}
