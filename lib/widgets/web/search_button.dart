import 'package:flutter/material.dart';
import 'package:flutter_google_clone_app/colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      color: searchColor,
      onPressed: () {},
      child: Text(title),
    );
  }
}
