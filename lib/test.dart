// import 'package:flutter/material.dart';
//
// class QuizMatcher extends StatefulWidget {
//   final List<Question> questions;
//   final List<Answer> answers;
//   final ValueChanged<int>? onScoreUpdated;
//
//   const QuizMatcher({
//     Key? key,
//     required this.questions,
//     required this.answers,
//     this.onScoreUpdated,
//   }) : super(key: key);
//
//   @override
//   _QuizMatcherState createState() => _QuizMatcherState();
// }
//
// class _QuizMatcherState extends State<QuizMatcher> {
//   late List<bool> userAnswers;
//
//   @override
//   void initState() {
//     super.initState();
//     userAnswers = List.filled(widget.questions.length, false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: widget.questions.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: widget.questions[index],
//             trailing: GestureDetector(
//               child: Icon(Icons.drag_handle),
//               onPanUpdate: (details) {
//                 // Implement your drag logic here
//               },
//             ),
//             onTap: () {
//               setState(() {
//                 if (userAnswers[index]) {
//                   widget.onScoreUpdated?.call(-1);
//                 } else {
//                   userAnswers[index] = true;
//                   widget.onScoreUpdated?.call(1);
//                 }
//               });
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class Question extends StatelessWidget {
//   final String text;
//
//   const Question({Key? key, required this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(text);
//   }
// }
//
// class Answer extends StatelessWidget {
//   final String text;
//
//   const Answer({Key? key, required this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(text);
//   }
// }
