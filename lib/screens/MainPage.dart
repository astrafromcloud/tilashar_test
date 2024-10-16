import 'package:circular_pulse/circular_pulse.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/User.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  User userName = User(userName: '');

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = User(userName: prefs.getString('username') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: 'Сәлем,\n',
                                  style: TextStyle(
                                      fontFamily: 'Cera Round Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24)),
                              TextSpan(
                                text: '${userName.userName.toString()}!',
                                  style: TextStyle(
                                      fontFamily: 'Cera Round Pro',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 36))
                            ]),
                      ),

                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.pushNamed(context, '/mainPage/allModulesPage');
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
                            stops: [0.1, 0.98, 1.0])),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Сабақ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontFamily: 'Cera Round Pro',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Text(
                                    'өту',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontFamily: 'Cera Round Pro',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.amberAccent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 30,
                                    width: 100,
                                    child: Center(
                                      child: Text('Бастау >',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CircularPulse(
                            glowColor: Colors.white,
                            endRadius: 100,
                            duration: Duration(milliseconds: 2000),
                            repeat: true,
                            showTwoGlows: true,
                            repeatPauseDuration: Duration(milliseconds: 100),
                            child: Material(
                              elevation: 8.0,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[100],
                                child: Image.asset(
                                  'assets/images/language.png',
                                  height: 200,
                                ),
                                radius: 50,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Қызметтер',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.7,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, pages[index]);
                              },
                              splashColor: Colors.white.withOpacity(0.05),
                              child: Ink(
    // decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //         colors: [
    //           Color(0xffFF5733),
    //           Color(0xffFF5733).withOpacity(0.3),
    //           Color(0xFFFFFFFF)
    //         ],
    //         begin: Alignment.bottomLeft,
    //         end: Alignment.topRight,
    //         stops: [0.1, 0.98, 1.0])
    // ),
                                child: Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(16, 8, 16, 16),
                                      child: images[index],
                                    ),
                                    Text(
                                      names[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Бетке өту',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List colors = [
  Color(0xffFF5733),
  Color(0xff4eff33),
  Color(0xffffd633),
  Color(0xff4e33ff),
];

List images = [
  Image.asset('assets/images/grid1.png'),
  Image.asset('assets/images/grid2.png'),
  Image.asset('assets/images/grid3.png'),
  Image.asset('assets/images/grid4.png'),
];

List pages = [
  '/mainPage/buyngaBoluPage',
  '/mainPage/translatePage',
  '/mainPage/buyngaBoluPage',
  '/mainPage/buyngaBoluPage',
];

List names = [
  "Буынға бөлу",
  "Аударма",
  "Аударма",
  "Аударма",
];
