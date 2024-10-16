import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;

import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class TyndalymSecondPage extends StatefulWidget {
  const TyndalymSecondPage({super.key});

  @override
  State<TyndalymSecondPage> createState() => _TyndalymSecondPageState();
}

class _TyndalymSecondPageState extends State<TyndalymSecondPage> {

  List<String> letters = [
    'Автонарықта',
    'жылдамдыққа',
    'автокөліктерге',
    'Бағасы',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'Тыңдалым',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                              child: CircleAvatar(
                                child: Text(
                                  '${index + 1}',
                                  style:
                                  TextStyle(fontFamily: 'Cera Round Pro'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                                child: RicherText(
                                  firstText: suraqtar.keys.elementAt(index),
                                  secondText: suraqtar.values.elementAt(index), index: index,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: suraqtar.length),
              SizedBox(
                height: 50,
              ),
              Wrap(
                spacing: 4,
                alignment: WrapAlignment.center,
                children: [
                  for (var letter in letters)
                    GestureDetector(
                      onTap: () {},
                      child: NewDraggableWidget(
                        dataString: letter,
                        isTapped: test.contains(letter),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RicherText extends StatefulWidget {
  final String firstText;
  final String secondText;
  final int index;

  const RicherText({
    super.key,
    required this.firstText,
    required this.secondText, required this.index,
  });

  @override
  State<RicherText> createState() => _RicherTextState();
}

class _RicherTextState extends State<RicherText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: widget.firstText,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Cera Round Pro',
              color: Colors.black),
        ),
        WidgetSpan(
          alignment: ui.PlaceholderAlignment.middle,
          child: DragTarget(
            builder: (BuildContext context, List<Object?> candidateData,
                List<dynamic> rejectedData) {
              return Container(
                  height: 30,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: test[widget.index] != ''
                      ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          test[widget.index] = '';
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith(
                                (states) => Colors.lightBlue),
                      ),
                      child: Text(
                        test[widget.index],
                        style: TextStyle(
                            fontFamily: 'Cera Round Pro',
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ))
                      : const Center());
            },
            onAccept: (String? data) {
              if (data != null) {
                setState(() {
                  test[widget.index] = data;
                  if (test.toString() == '[Автонарықта, жылдамдыққа, автокөліктерге, Бағасы]') {
                    btn3(context);
                  }
                });
              }
            },
          ),
        ),
        TextSpan(
          text: widget.secondText,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Cera Round Pro',
              color: Colors.black),
        ),
      ]),
    );
  }
}

class NewDraggableWidget extends StatelessWidget {
  final String dataString;
  final bool isTapped;

  const NewDraggableWidget({
    super.key,
    required this.dataString,
    required this.isTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable(
        data: dataString,
        feedback: ElevatedButton(
            onPressed: null,
            child: Text(
              dataString,
              style: TextStyle(
                  fontFamily: 'Cera Round Pro',
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            )),
        childWhenDragging: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => const Color(0xffe3e3e3)),
              backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => const Color(0xffe3e3e3))),
          child: Text(
            dataString,
            style: const TextStyle(color: Color(0xffe3e3e3)),
          ),
        ),
        child: ElevatedButton(
          onPressed: isTapped ? null : null,
          style: ButtonStyle(
            backgroundColor: isTapped
                ? MaterialStateProperty.resolveWith(
                  (states) => Colors.grey.withOpacity(0.5),
            )
                : MaterialStateProperty.resolveWith(
                    (states) => Colors.lightBlue),
          ),
          child: Text(
            dataString,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Cera Round Pro',
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ));
  }
}

Map<String, String> suraqtar = {
  '': ' көліктер саудаланады.',
  'Клиренс ': ' байланысты өзгереді.',
  '«Е» класындағы ': ' сай салмағы 2 тонна.',
  ' ': ' 100 000 \$ долларды құрайды.',
};

final List<String> test = [
  '', '', '', ''
];

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
