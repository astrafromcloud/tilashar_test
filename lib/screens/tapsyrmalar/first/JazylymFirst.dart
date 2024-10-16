import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class JazylymFirstPage extends StatefulWidget {
  const JazylymFirstPage({super.key});

  @override
  State<JazylymFirstPage> createState() => _JazylymFirstPageState();
}

class _JazylymFirstPageState extends State<JazylymFirstPage> {
  List<String> letters = [
    'күні?',
    'қай',
    'Бүгін',
    'аптаның',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: const Text(
            'Жазылым',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Сөйлемді аударыңыз:',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cer Round Pro',
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Wrap(
                  children: [
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'қай / күні? / Бүгін / аптаның ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cera Round Pro',
                            fontSize: 28),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: DragTarget<String>(
                    onAccept: (String? data) {
                      if (data != null) {
                        setState(() {
                          acceptedItems.add(data);
                        });
                      }
                    },
                    builder: (BuildContext context, List<String?> candidateData,
                        List<dynamic> rejectedData) {
                      return Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[100],
                          ),
                          child: acceptedItems.isNotEmpty
                              ? Wrap(
                                  spacing: 3,
                                  children: acceptedItems
                                      .map((e) => ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              acceptedItems.remove(e);
                                            });
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) =>
                                                        Colors.lightBlue),
                                          ),
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                                fontFamily: 'Cera Round Pro',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          )))
                                      .toList(),
                                )
                              : const Center(
                                  child: Text('Osynda akel'),
                                ));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Wrap(
                      spacing: 4,
                      alignment: WrapAlignment.center,
                      children: [
                        for (var letter in letters)
                          GestureDetector(
                            onTap: () {
                              if (!acceptedItems.contains(letter)) {
                                _addToTarget(letter);
                                if (acceptedItems.toString() ==
                                    '[Бүгін, аптаның, қай, күні?]') {
                                  btn3(context);
                                }
                              }
                            },
                            child: NewDraggableWidget(
                              dataString: letter,
                              isTapped: acceptedItems.contains(letter),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addToTarget(String letter) {
    setState(() => acceptedItems.add(letter));
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

List<String> acceptedItems = [];

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
