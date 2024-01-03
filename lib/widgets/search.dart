import 'package:flutter/material.dart';
import 'package:flutter_google_clone_app/colors.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            'assets/images/google-logo.png',
            height: size.height * 0.12,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: size.width > 768 ? size.width * 0.4 : size.width * 0.9,
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: searchBorder),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/search-icon.svg',
                  color: searchBorder,
                  width: 1,
                  height: 1,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/mic-icon.svg'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
