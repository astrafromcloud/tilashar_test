import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:flutter_quiz_matcher/models/model.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class JazylymSecondPage extends StatefulWidget {
  const JazylymSecondPage({super.key});

  @override
  State<JazylymSecondPage> createState() => _JazylymSecondPageState();
}

class _JazylymSecondPageState extends State<JazylymSecondPage> {
  List listQuestions = [
    'Қыстағы',
    'Жылдамдық',
    'Қуаттандырылған',
    'Жеңіл',
    'Техникалық'
  ];

  int userScore = 0;

  List<String> listAnswer = [
    'қозғалыс',
    'қорабы',
    'батареялар',
    'автокөлік',
    'шешімдер'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   title: const Text(
      //     'Жазылым',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
      body:Container(
        color: Colors.lightBlue,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: QuizWidget(listQuestions: listQuestions, listAnswer: listAnswer, userScore: userScore,),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class QuizWidget extends StatelessWidget {
  const QuizWidget({
    super.key,
    required this.listQuestions,
    required this.listAnswer, required this.userScore,
  });

  final int userScore;
  final List listQuestions;
  final List<String> listAnswer;

  @override
  Widget build(BuildContext context) {
    return QuizMatcher(
      questions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listQuestions[0])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listQuestions[1])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listQuestions[2])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listQuestions[3])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listQuestions[4])),
          ),
        ),
      ],
      answers: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listAnswer[0])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listAnswer[1])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listAnswer[2])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listAnswer[3])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD6D6FF),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Center(child: Text(listAnswer[4])),
          ),
        ),
      ],

      defaultLineColor: Colors.lightBlue,
      correctLineColor: Colors.greenAccent,
      incorrectLineColor: Colors.red,
      drawingLineColor: Colors.amberAccent,
      paddingAround: EdgeInsets.all(0), onScoreUpdated: (UserScore userAnswers) {  },
    );
  }
}

Future<void> btn3(BuildContext context) {
  return Dialogs.materialDialog(
    color: Colors.white,
    msg: 'Сен 500 ұпай жеңдің!',
    title: 'Құттықтаймыз!',
    lottieBuilder: Lottie.asset(
      'assets/anim/anim.json',
      fit: BoxFit.contain,
    ),
    dialogWidth: kIsWeb ? 0.3 : null,
    context: context,
    actions: [
      IconsButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        text: 'Жақсы',
        iconData: Icons.done,
        color: Colors.blue,
        textStyle: const TextStyle(color: Colors.white),
        iconColor: Colors.white,
      ),
    ],
  );
}
