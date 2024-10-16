import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../models/requests.dart';
import '../../../widgets/AudioPlayerWidget.dart';

class MatinSecondPage extends StatefulWidget {
  const MatinSecondPage({super.key});

  @override
  State<MatinSecondPage> createState() => _MatinSecondPageState();
}

class _MatinSecondPageState extends State<MatinSecondPage> {


  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
        extendBodyBehindAppBar: true,
        body: DraggableHome(
          // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          alwaysShowLeadingAndAction: true,
          leading: null,
          headerExpandedHeight: 0.5,
          title: Text('2-модуль'),
          headerWidget: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/second/tesla.jpg',
                fit: BoxFit.cover,
              ),
              Positioned(
                  bottom: -20,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Chip(
                          label: Text(
                            '2-модуль',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                            width: MediaQuery.of(context).size.width - 40,
                            child: Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(color: Colors.white, fontSize: 34),
                            ))
                      ],
                    ),
                  )),
              // Positioned(
              //   top: 20,
              //   left: 10,
              //   child: Align(
              //     alignment: Alignment.topLeft,
              //     child: IconButton(
              //         onPressed: () {}, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
              //   ),
              // )
            ],
          ),
          body: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Center(
                    //   child: Text(
                    //     title,
                    //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    //   ),
                    // ),
                    SelectionArea(
                      child: SelectableText(
                        matin,
                        style: TextStyle(fontSize: 18),
                        // onSelectionChanged: (textSelection, _) {
                        //   setState(() {
                        //     selectedText = textSelection.textInside(' ');
                        //   });
                        //   print(selectedText);
                        // },
                        contextMenuBuilder: (context, editableTextState) {
                          return AdaptiveTextSelectionToolbar(
                              anchors: editableTextState.contextMenuAnchors,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 181,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                border: BoxBorder.lerp(
                                                    const Border(
                                                        left: BorderSide(
                                                            style:
                                                            BorderStyle.solid)),
                                                    const Border(),
                                                    0)),
                                            child: SizedBox(
                                              height: double.infinity,
                                              width: 60,
                                              child:
                                              // Icon(Icons.volume_up)
                                              FutureBuilder(
                                                future: setAudioPlay(matin.substring(editableTextState.currentTextEditingValue.selection.baseOffset, editableTextState.currentTextEditingValue.selection.extentOffset)),
                                                builder: (context, snapshot) {
                                                  if (snapshot.connectionState ==
                                                      ConnectionState.waiting) {
                                                    return SizedBox(
                                                      height: 20,
                                                      child: Center(
                                                        child: SizedBox(
                                                          width: 20, // You can adjust this according to your preference
                                                          height: 20, // You can adjust this according to your preference
                                                          child: CircularProgressIndicator(
                                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  } else if (snapshot.hasError) {
                                                    return const Icon(
                                                        Icons.volume_up);
                                                  } else {
                                                    return AudioPlayerWidget(
                                                        base64String:
                                                        snapshot.data!);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(text: '${matin.substring(editableTextState.currentTextEditingValue.selection.baseOffset, editableTextState.currentTextEditingValue.selection.extentOffset)}'));
                                            // print(matin.substring(editableTextState.currentTextEditingValue.selection.baseOffset, editableTextState.currentTextEditingValue.selection.extentOffset));

                                          },
                                          child: Ink(
                                            child: const SizedBox(
                                              height: double.infinity,
                                              width: 60,
                                              child: Icon(Icons.copy),
                                            ),
                                          ),
                                        ),
                                        Tooltip(
                                          message: "long press to open dialog",
                                          key: tooltipkey,
                                          triggerMode: TooltipTriggerMode.manual,
                                          child: InkWell(
                                            onTap: () {
                                              Share.share(matin.substring(editableTextState.currentTextEditingValue.selection.baseOffset, editableTextState.currentTextEditingValue.selection.extentOffset));
                                              tooltipkey.currentState?.ensureTooltipVisible();
                                            },
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                  border: BoxBorder.lerp(
                                                      const Border(
                                                          left: BorderSide(
                                                              style:
                                                              BorderStyle.solid)),
                                                      Border(),
                                                      1)),
                                              child: const SizedBox(
                                                height: double.infinity,
                                                width: 60,
                                                child: Icon(Icons.share_outlined),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // child: Center(
                                  //     child: Row(
                                  //   children: [
                                  //     Material(
                                  //         child: InkWell(
                                  //       child: Ink(child: Icon(Icons.play_arrow)),
                                  //       onTap: () {},
                                  //       borderRadius: BorderRadius.circular(30),
                                  //     )),
                                  //     VerticalDivider(),
                                  //     Material(
                                  //         child: InkWell(
                                  //       child: Ink(child: Icon(Icons.copy)),
                                  //       onTap: () {},
                                  //     )),
                                  //     VerticalDivider(),
                                  //     Material(
                                  //         child: InkWell(
                                  //       child: Ink(child: Icon(Icons.share_outlined)),
                                  //       onTap: () {},
                                  //     ))
                                  //   ],
                                  //   mainAxisAlignment: MainAxisAlignment.values[5],
                                  // )),
                                )
                              ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

String matin =
    '2014 жылы Норвегия мемлекетінде Tesla автомаркалы жеңіл көліктері Ford-тан көбірек саудаланылған (2056 дана Tesla, 1825 дана Ford). Tesla автонарықта жалғыз Tesla Model S жеңіл автокөлігін (моделін) саудалады.\nКөлік атауындағы «S» белгісіне көңіл аударайық. Еуропалық жеңіл автокөліктерді жүйелеу жүйесі бойынша қолданыстағы ыңғайлығын ескере және техникалық анықтамалары бойынша A, B, C, D, E, F, S, M, J кластары анықталған. «А» кішігірім, бағасы жағынан арзан жеңіл автокөліктер. «S» + - спорткупе. Автокөлік жасаушылар бұл класта техникалық шешімдердің ең жаңасын, техникалық анықтамалары жоғарғы автокөліктерді ұсынады.\nYoutube –тағы AutoreviewRu арнасында «Авторевю» газетінің бас редакторы Михаил Подорожанский Tesla Model S-ті атақты автомаркамен шыққан S класты Porsche Cayman S автокөлігімен салыстыру жүргізеді. Porsche Cayman S орнынан қозғалғаннан бастап өткен 5,2 секунд ішінде жылдамдығы 100 км/сағ жетеді. Tesla Model S осындай көрсеткіш көрсету үшін бар жоғы 4,4 секунд қажет. Автокөлік көлемі «Е» класты автокөліктерге сай салмағы 2 тонна бола тұра осындай көрсеткіш көрсетеді.\nМені қызықтырғаны, біздің климатқа жарайды ма, жарамайды ма деген сұрақ. Сондықтан қыстағы қозғалысы бағаланған бейнекөріністерді Youtube-тан іздеп көрдім. Электроавтомобиль бола тұра, қыста Tesla Model S ғаламтордағы бейнелерге сенсек, -30ºС аязда толық қуаттандырылған батареялармен 300 шақырымдай қашықтық жүріп өтетін көрінеді. Баяу қозғалғанда клиренс 155 милиметрге дейін көтерілетінін біліп қуандым. Жалпы клиренс жылдамдыққа байланысты 100-155 милиметрге дейін өзгереді. Автомобильді қозғалысқа келтіретін жүру бөлігін және шанақты пневматикалық аспа жалғастырады. Жылдамдық қорабы жоқ, оның орнында редуктор тұр.\nЖалпы мұндай автокөліктің бары қуантады. Бағасы 100 000\$, кез-келгеніміз сатып алмаймыз, бірақ та бұл автокөлік электроавтомобильдердің мүмкіншілігін ап-анық көрсетіп тұр.';
String title = 'Tesla Model S электроавтомобилі';
