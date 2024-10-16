// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
// import 'package:flutter_quiz_matcher/models/model.dart';
//
// class QuizTestPage extends StatefulWidget {
//   const QuizTestPage({super.key});
//
//   @override
//   State<QuizTestPage> createState() => _QuizTestPageState();
// }
//
// List listImagesLocations = [
//   Icons.add,
//   Icons.remove,
//   CupertinoIcons.divide,
//   CupertinoIcons.multiply
// ];
// List<String> listAnswer = ['bell', 'book', 'home', 'google'];
//
// class _QuizTestPageState extends State<QuizTestPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.greenAccent,
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.amberAccent,
//           padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
//           child: QuizMatcher(
//             questions: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFFD6D6FF),
//                       borderRadius: BorderRadius.circular(15)),
//                   height: 100,
//                   width: 100,
//                   child: Center(child: Icon(listImagesLocations[0])),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFFD6D6FF),
//                       borderRadius: BorderRadius.circular(15)),
//                   height: 100,
//                   width: 100,
//                   child: Center(child: Icon(listImagesLocations[1])),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFFD6D6FF),
//                       borderRadius: BorderRadius.circular(15)),
//                   height: 100,
//                   width: 100,
//                   child: Center(child: Icon(listImagesLocations[2])),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFFD6D6FF),
//                       borderRadius: BorderRadius.circular(15)),
//                   height: 100,
//                   width: 100,
//                   child: Center(child: Icon(listImagesLocations[3])),
//                 ),
//               ),
//             ],
//             answers: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFFD6D6FF),
//                       borderRadius: BorderRadius.circular(15)),
//                   height: 100,
//                   width: 100,
//                   child: Center(child: Text(listAnswer[0])),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFFD6D6FF),
//                       borderRadius: BorderRadius.circular(15)),
//                   height: 100,
//                   width: 100,
//                   child: Center(child: Text(listAnswer[1])),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFFD6D6FF),
//                       borderRadius: BorderRadius.circular(15)),
//                   height: 100,
//                   width: 100,
//                   child: Center(child: Text(listAnswer[2])),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFFD6D6FF),
//                       borderRadius: BorderRadius.circular(15)),
//                   height: 100,
//                   width: 100,
//                   child: Center(child: Text(listAnswer[3])),
//                 ),
//               ),
//
//             ],
//             onScoreUpdated: (UserScore userAnswers) {
//               print(userAnswers.questionAnswer);
//             },
//             defaultLineColor: Colors.lightBlue,
//             correctLineColor: Colors.greenAccent,
//             incorrectLineColor: Colors.red,
//             drawingLineColor: Colors.amberAccent,
//             paddingAround: EdgeInsets.all(0),
//           ),
//         ),
//       ),
//     );
//   }
// }
