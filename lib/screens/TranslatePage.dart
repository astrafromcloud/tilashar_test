import 'package:flutter/material.dart';

import '../models/requests.dart';
import '../widgets/AudioPlayerWidget.dart';

import 'package:simplytranslate/simplytranslate.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  String translated = '';
  TextEditingController ctrl = TextEditingController();
  final gt = SimplyTranslator(EngineType.google);

  bool _isFirstTextVisible = true;

  void _swapTexts() {
    setState(() {
      _isFirstTextVisible = !_isFirstTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Аудару',
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: _isFirstTextVisible
                              ? Text(
                            'Қазақша',
                            key: ValueKey('kazakh_text'),
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                              : Text(
                            'Орысша',
                            key: ValueKey('russian_text'),
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Material(
                          color: Colors.white ,
                          clipBehavior: Clip.none,
                          child: IconButton(
                            onPressed: _swapTexts,
                            icon: Icon(Icons.sync_outlined, color: Colors.lightBlue,),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: _isFirstTextVisible
                              ? Text(
                            'Орысша',
                            key: ValueKey('russian_text'),
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                              : Text(
                            'Қазақша',
                            key: ValueKey('kazakh_text'),
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  _isFirstTextVisible ? 'Қазақша' : 'Орысша',
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
                    String til1 = _isFirstTextVisible ? 'ru' : 'kk';
                    String til2 = !_isFirstTextVisible ? 'kk' : 'ru';
                    final translation = await gt.trSimply(text, til1, til2);
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
                    hintText: _isFirstTextVisible ? 'Сөз енгізіңіз:' : 'Введите слово: ',
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
                  _isFirstTextVisible ? 'Орысша' : 'Қазақша',
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
                      color: Colors.white,
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
                    fillColor: Colors.lightBlue,
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
                                        Colors.lightBlue,
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
                                        return const Icon(Icons.volume_up, color: Colors.white,);
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
