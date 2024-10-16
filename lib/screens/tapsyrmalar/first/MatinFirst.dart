import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../models/requests.dart';
import '../../../widgets/AudioPlayerWidget.dart';

class MatinFirstPage extends StatefulWidget {
  const MatinFirstPage({super.key});

  @override
  State<MatinFirstPage> createState() => _MatinFirstPageState();
}

class _MatinFirstPageState extends State<MatinFirstPage> {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  // String selectedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: DraggableHome(
          alwaysShowLeadingAndAction: true,
          headerExpandedHeight: 0.5,
          title: Text('1-модуль'),
          headerWidget: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/matin_first/monday.jpg',
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
                            '1-модуль',
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
                                  ?.copyWith(color: Colors.white),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                border: BoxBorder.lerp(
                                                    const Border(
                                                        left: BorderSide(
                                                            style: BorderStyle
                                                                .solid)),
                                                    Border(),
                                                    0)),
                                            child: SizedBox(
                                              height: double.infinity,
                                              width: 60,
                                              child:
                                                  // Icon(Icons.volume_up)
                                                  FutureBuilder(
                                                future: setAudioPlay(matin.substring(
                                                    editableTextState
                                                        .currentTextEditingValue
                                                        .selection
                                                        .baseOffset,
                                                    editableTextState
                                                        .currentTextEditingValue
                                                        .selection
                                                        .extentOffset)),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return SizedBox(
                                                      height: 20,
                                                      child: Center(
                                                        child: SizedBox(
                                                          width: 20,
                                                          // You can adjust this according to your preference
                                                          height: 20,
                                                          // You can adjust this according to your preference
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                        Color>(
                                                                    Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  } else if (snapshot
                                                      .hasError) {
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
                                            Clipboard.setData(ClipboardData(
                                                text:
                                                    '${matin.substring(editableTextState.currentTextEditingValue.selection.baseOffset, editableTextState.currentTextEditingValue.selection.extentOffset)}'));
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
                                          triggerMode:
                                              TooltipTriggerMode.manual,
                                          child: InkWell(
                                            onTap: () {
                                              Share.share(
                                                  '${matin.substring(editableTextState.currentTextEditingValue.selection.baseOffset, editableTextState.currentTextEditingValue.selection.extentOffset)}');
                                              tooltipkey.currentState
                                                  ?.ensureTooltipVisible();
                                            },
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                  border: BoxBorder.lerp(
                                                      const Border(
                                                          left: BorderSide(
                                                              style: BorderStyle
                                                                  .solid)),
                                                      Border(),
                                                      1)),
                                              child: const SizedBox(
                                                height: double.infinity,
                                                width: 60,
                                                child:
                                                    Icon(Icons.share_outlined),
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
    '«Дүйсенбі» деген сөзді естіген кезде көпшілігіміздің көз алдымызға аптаның бірінші күні жұмысқа асыққан адамдар мен мектепке бара жатқан балалар елестейді. Бұл күнді «Ауыр күн» деп те атайды. Тіпті «Бұл күні қарыз берсең, шығын көп болады, ал жолға шықсаң, сәтсіздікке ұшырайсың» деген сияқты жаман ырымдар да бар.\n\nАптадағы күн атауларының мағынасы\n\nҚазақ тілі қалыптаспай тұрып қыпшақ даласында апта күндері сабат күні (сенбі), йакшанбе (йак – бір, шанбе – сенбі), душанбе (ду – екі, шанбе – сенбі), сешанбе (се – үш, шанбе — сенбі), чоршанбе (чор – төрт, шанбе – сенбі), бешшанбе (беш – бес, шанбе – сенбі), айна (жұма) деп аталған. Ал қазақ тілі қалыптасып болғаннан кейін өзінің төл сөздерінен апта күндеріне атаулар берген. Олар былай аталады: бүгін (бірінші күн), ертең (екінші күн), бүрсікүні (үшінші күн), арғыкүні (төртінші күн), ауыр күн (бесінші күн), соңғы күн (алтыншы күн), азына (жетінші күн). Бүгінде бұл сөздердің кейбірін жиі болмаса да қолданып тұрамыз.\nҚазіргі уақытта апта күндері дүйсенбі, сейсенбі, сәрсенбі, бейсенбі, жұма, сенбі, жексенбі деп аталады. Әр күннің соңындағы «сенбі» сөзі «күн» деген мағынаны білдіреді.\nКөптеген елдердегідей, біз де дүйсенбіні аптаның бірінші күні деп қарастырамыз. Негізінде дүйсенбі араб, грек, иврит және португал тілдерінде «екінші күн» деген мағынаны білдіреді, сол себепті де бұл күн жер бетіндегі барлық елдерде аптаның бірінші күні емес.';
String title = 'Дүйсенбі несімен ерекше?';
