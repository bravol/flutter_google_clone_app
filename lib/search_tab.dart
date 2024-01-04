import 'package:flutter/material.dart';
import 'package:flutter_google_clone_app/colors.dart';

class SearchTab extends StatelessWidget {
  const SearchTab(
      {super.key,
      required this.icon,
      this.isActive = false,
      required this.text});

  final IconData icon;
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isActive ? blueColor : Colors.grey,
            ),
            const SizedBox(width: 3),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: isActive ? blueColor : Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        isActive
            ? Container(
                height: 3,
                width: 40,
                color: blueColor,
              )
            : Container()
      ],
    );
  }
}
