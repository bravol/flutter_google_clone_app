import 'package:flutter/material.dart';
import 'package:flutter_google_clone_app/colors.dart';
import 'package:flutter_google_clone_app/widgets/search.dart';
import 'package:flutter_google_clone_app/widgets/translation_buttons.dart';
import 'package:flutter_google_clone_app/widgets/web/search_buttons.dart';
import 'package:flutter_google_clone_app/widgets/web/web_footer.dart';
import 'package:flutter_svg/svg.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Gmail',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Images',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/more-apps.svg',
              color: primaryColor,
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10).copyWith(right: 10),
            child: MaterialButton(
              onPressed: () {},
              color: const Color(0xff1A73EB),
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: size.height * 0.25),
            const Expanded(
              child: Column(
                children: [
                  Search(),
                  SizedBox(height: 20),
                  SearchButtons(),
                  SizedBox(height: 20),
                  TranslationButtons(),
                ],
              ),
            ),
            const WebFooter()
          ],
        ),
      ),
    );
  }
}
