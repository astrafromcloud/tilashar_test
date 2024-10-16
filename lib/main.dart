import 'package:flutter/material.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:tilashar_test/screens/AllModulesPage.dart';
import 'package:tilashar_test/screens/BuyngaBoluPage.dart';
import 'package:tilashar_test/screens/MainPage.dart';
import 'package:tilashar_test/screens/TranslatePage.dart';
import 'package:tilashar_test/screens/quizTestPage.dart';
import 'package:tilashar_test/screens/tapsyrmalar/first/JazylymFirst.dart';
import 'package:tilashar_test/screens/tapsyrmalar/first/MatinFirst.dart';
import 'package:tilashar_test/screens/tapsyrmalar/first/OqylymFirst.dart';
import 'package:tilashar_test/screens/tapsyrmalar/first/TyndalymFirst.dart';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tilashar_test/screens/tapsyrmalar/second/JazylymSecond.dart';
import 'package:tilashar_test/screens/tapsyrmalar/second/MatinSecond.dart';
import 'package:tilashar_test/screens/tapsyrmalar/second/OqylymSecond.dart';
import 'package:tilashar_test/screens/tapsyrmalar/second/TyndalymSecond.dart';
import 'package:tilashar_test/test.dart';

import 'intro_checker.dart';

void main() {
  runApp(const MainPageController());
}

class MainPageController extends StatefulWidget {
  const MainPageController({super.key});

  @override
  State<MainPageController> createState() => _MainPageState();
}

class _MainPageState extends State<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => IntroductionHandler(),
        '/introduction': (context) => IntroScreen(),
        '/mainPage': (context) => const MainPage(),
        '/mainPage/translatePage': (context) => const TranslatePage(),
        '/mainPage/buyngaBoluPage': (context) => const BuyngaBoluPage(),
        '/mainPage/allModulesPage': (context) =>
        const AllModulesPage(
          itemCount: 15,
        ),
        '/mainPage/allModulesPage/jazylymFirst': (context) =>
        const JazylymFirstPage(),
        '/mainPage/allModulesPage/oqylymFirst': (context) =>
        const OqylymFirstPage(),
        '/mainPage/allModulesPage/tyndalymFirst': (context) =>
        const TyndalymFirstPage(),
        '/mainPage/allModulesPage/matinFirst': (context) =>
        const MatinFirstPage(),

        '/mainPage/allModulesPage/matinSecond': (context) =>
        const MatinSecondPage(),
        '/mainPage/allModulesPage/oqylymSecond': (context) =>
        const OqylymSecondPage(),
        '/mainPage/allModulesPage/tyndalymSecond': (context) =>
        const TyndalymSecondPage(),
        // '/mainPage/allModulesPage/jazylymSecond': (context) => const JazylymSecondPage(),
      },
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff01A0C2)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
