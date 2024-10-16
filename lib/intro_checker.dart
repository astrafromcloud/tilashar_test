import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tilashar_test/screens/MainPage.dart';

import 'models/User.dart';

class IntroductionHandler extends StatefulWidget {
  @override
  _IntroductionHandlerState createState() => _IntroductionHandlerState();
}

class _IntroductionHandlerState extends State<IntroductionHandler> {
  @override
  void initState() {
    super.initState();
    checkIfFirstTime();
  }

  void checkIfFirstTime() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
      if (isFirstTime) {
        // If it's the first time, show introduction screens
        Navigator.pushReplacementNamed(context, '/introduction');
      } else {
        // If not the first time, navigate to the main screen directly
        Navigator.pushReplacementNamed(context, '/mainPage');
      }
    } catch (e) {
      print("Error during navigation: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Placeholder widget while checking for the first time
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            // image: Lottie.asset('assets/anim/someoneLearning1.json'),
            image: Image.asset('assets/rome.png'),
            body:
            '"Oqimyn" қазақ тілін оқытудың жаңа әдістемесі, қазіргі заманғы технологиялар мен түрлі білім беру ресурстарын пайдалану арқылы коммуникативті дағдыларды дамытуға бағытталған',
            title: '"Oqimyn" бағдарламасына қош келдіңіз!',
          ),
          PageViewModel(
            // image: Center(child: Lottie.asset('assets/anim/someoneLearning.json')),
            image: Image.asset('assets/images/intro/2.jpg'),
            body: 'Біздің көзқарасымыз заманауи технологиялар мен әртүрлі білім беру ресурстарын пайдалана отырып, коммуникация дағдыларын дамытуға бағытталған.',
            // "Here you can write the description of the page, to explain someting...",
            title: "Заманауи",
          ),
          PageViewModel(
            // image: Lottie.asset('assets/anim/someoneLearning.json'),
            image: Image.asset('assets/images/intro/3.jpg'),
            body: 'Оқу үдерісін қызықты әрі тиімді етіп, қазақ тілін бірге меңгерейік!',
            // "Here you can write the description of the page, to explain someting...",
            title: "Қызықты",
          ),
          PageViewModel(
            // image: Lottie.asset('assets/anim/someoneLearning.json'),
            image: Image.asset('assets/images/intro/1.jpg'),
            bodyWidget: Center(
              child: SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.25,
                width: double.infinity,
                child: TextField(
                  onChanged: (text) async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    setState(() {
                      prefs.setString('username', text);
                    });
                  },
                  maxLines: 5,
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cera Round Pro'),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Сөз енгізіңіз:',
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusColor: Colors.transparent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    fillColor: Colors.white,
                  ),
                ),),
            ),
            // "Here you can write the description of the page, to explain someting...",
            title: "Сізді қалай атасақ болады?",
          ),
        ],
        bodyPadding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        onDone: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isFirstTime', false);
          Navigator.pushReplacementNamed(context, '/mainPage', arguments: MainPage());
        },
        scrollPhysics: const ClampingScrollPhysics(),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: getDotsDecorator(),
      ),
    );
  }

  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
