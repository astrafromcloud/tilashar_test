import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class OqylymFirstPage extends StatefulWidget {
  const OqylymFirstPage({super.key});

  @override
  State<OqylymFirstPage> createState() => _OqylymFirstPageState();
}

class _OqylymFirstPageState extends State<OqylymFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'Оқылым',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 20, 5, 50),
        child: Center(
          child: Stack(
            children: [
              CardSwiper(
                cardBuilder: (BuildContext context,
                    int index,
                    int horizontalOffsetPercentage,
                    int verticalOffsetPercentage) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(
                              0.0,
                              5.0,
                            ),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: double.infinity,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Image.asset(imagesDB[index]),
                              height: 150,
                              width: 150,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(sozderDB[index],
                                  style: TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cera Round Pro')),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(sozderOqyluDB[index],
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Cera Round Pro')),
                            SizedBox(
                              height: 60,
                            ),
                            Center(
                              child: ClipOval(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
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
                                          child: Icon(Icons.mic, color: Colors.white,)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                cardsCount: 9,
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> sozderDB = [
  'Дүйсенбі',
  'Екінші күн',
  'Жұма',
  'Апта күндері',
  'Сейсенбі',
  'Бүрсікүні',
  'Жексенбі',
  'Демалыс',
  'Ертең'
];

List<String> sozderOqyluDB = [
  'Дүйсенбі',
  'Екінші күн',
  'Жұма',
  'Апта күндері',
  'Сейсенбі',
  'Бүрсікүні',
  'Жексенбі',
  'Демалыс',
  'Ертең'
];

List imagesDB = [
  'assets/images/oqylym_first/dumbbell.png',
  'assets/images/oqylym_first/guitar.png',
  'assets/images/oqylym_first/online-training.png',
  'assets/images/oqylym_first/play-with-pet.png',
  'assets/images/oqylym_first/read.png',
  'assets/images/oqylym_first/reading.png',
  'assets/images/oqylym_first/video-calling.png',
  'assets/images/oqylym_first/watering-plants.png',
  'assets/images/oqylym_first/dumbbell.png',
];
