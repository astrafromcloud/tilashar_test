import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

import '../models/hyphenate.dart';
import '../models/requests.dart';
import '../widgets/AudioPlayerWidget.dart';

class BuyngaBoluPage extends StatefulWidget {
  const BuyngaBoluPage({super.key});

  @override
  State<BuyngaBoluPage> createState() => _BuyngaBoluPageState();
}

class _BuyngaBoluPageState extends State<BuyngaBoluPage> {
  String translated = '';
  TextEditingController ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Буынға бөлу',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Қазақша',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                child: TextField(
                  onChanged: (text) async {
                    final translation = hyphenate(text);
                    setState(() {
                      translated = translation;
                      ctrl.text = translated;
                    });
                  },
                  maxLines: 5,
                  style: TextStyle(
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
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Буынға бөлінген',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // SizedBox(
              //   height: 15,
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                child: TextFormField(
                  controller: ctrl,
                  readOnly: true,
                  maxLines: 10,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cera Round Pro'),
                  decoration: InputDecoration(
                    hintText: translated,
                    filled: true,
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
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                // decoration: const BoxDecoration(color: Colors.lightBlueAccent),
                height: MediaQuery.of(context).size.height * 0.08,
                child: Stack(
                  children: [
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(
                    //       // color: Colors.amberAccent,
                    //       borderRadius: BorderRadius.circular(20)),
                    //   child: Center(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           'Бөлінбеген',
                    //           style: TextStyle(fontWeight: FontWeight.bold),
                    //         ),
                    //         Text(
                    //           'Бөлінген',
                    //           style: TextStyle(fontWeight: FontWeight.bold),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Center(
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              String tex = ctrl.text;
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff2218d0),
                                        Color(0xff828eff),
                                        Color(0xFFFFFFFF)
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      stops: [0.1, 0.7, 1.0])),
                              child: SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: FutureBuilder(
                                    future: setAudioPlay(ctrl.text),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator(
                                          color: Colors.white,
                                        );
                                      } else if (snapshot.hasError) {
                                        return const Icon(Icons.volume_up);
                                      } else {
                                        return AudioPlayerWidget(
                                          base64String: snapshot.data!);
                                      }
                                    },
                                  )),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class AudioPlayerWidget extends StatefulWidget {
//   final String base64String;
//
//   const AudioPlayerWidget({Key? key, required this.base64String})
//       : super(key: key);
//
//   @override
//   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
// }
//
// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {


//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon((_isPlaying ? Icons.pause : Icons.volume_up)),
//       onPressed: togglePlayer,
//     );
//   }
// }

