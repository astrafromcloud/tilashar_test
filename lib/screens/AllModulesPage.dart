import 'package:flutter/material.dart';

class AllModulesPage extends StatefulWidget {
  final int itemCount; // Number of items to randomly generate

  const AllModulesPage({Key? key, required this.itemCount}) : super(key: key);

  @override
  State<AllModulesPage> createState() => _AllModulesPageState();
}


class _AllModulesPageState extends State<AllModulesPage> {
  final Map<int, bool> _isOpened = {}; // Map to track open/closed states
  final List<String> oqylymdar = [
    '/mainPage/allModulesPage/oqylymFirst',
    '/mainPage/allModulesPage/oqylymSecond',
    '/mainPage/allModulesPage/oqylymFirst',
    '/mainPage/allModulesPage/oqylymFirst',
    '/mainPage/allModulesPage/oqylymFirst',
    '/mainPage/allModulesPage/oqylymFirst',
  ];

  final List<String> jazylymdar = [
    '/mainPage/allModulesPage/jazylymFirst',
    '/mainPage/allModulesPage/jazylymSecond',
    '/mainPage/allModulesPage/jazylymThird',
    '/mainPage/allModulesPage/jazylymFourth',
    '/mainPage/allModulesPage/jazylymFifth',
    '/mainPage/allModulesPage/jazylymSixth',
  ];

  final List<String> tyndalymdar = [
    '/mainPage/allModulesPage/tyndalymFirst',
    '/mainPage/allModulesPage/tyndalymSecond',
    '/mainPage/allModulesPage/tyndalymThird',
    '/mainPage/allModulesPage/tyndalymFourth',
    '/mainPage/allModulesPage/tyndalymFifth',
    '/mainPage/allModulesPage/tyndalymSixth',
  ];

  final List<String> matinder = [
    '/mainPage/allModulesPage/matinFirst',
    '/mainPage/allModulesPage/matinSecond',
    '/mainPage/allModulesPage/matinFirst',
    '/mainPage/allModulesPage/matinFirst',
    '/mainPage/allModulesPage/matinSecond',
    '/mainPage/allModulesPage/matinFirst',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize _isOpened map with all items closed
    _isOpened.addAll({for (var i = 0; i < modules.length; i++) i: false});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Модульдер',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: modules.length,
        itemBuilder: (context, index) {
          final isOpen = _isOpened[index] ?? false; // Check for potential null key

          return AnimatedContainer(
            padding: const EdgeInsets.all(8),
            // decoration: BoxDecoration(color: Colors.lightBlueAccent),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: isOpen ? 200.0 : 80.0,
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(modules[index], style: const TextStyle(fontFamily: 'Cera Round Pro', fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.lightBlue,),
                    onTap: () {
                      setState(() {
                        _isOpened[index] = !_isOpened[index]!; // Toggle state
                      });
                    },
                  ),
                  if (isOpen)
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, matinder[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red, // Change color for Listening button
                              ),
                              child: Text('Мәтін'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, oqylymdar[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, // Change color for Reading button
                                ),
                                child: Text('Оқылым'),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, tyndalymdar[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Change color for Speaking button
                                ),
                                child: Text('Тыңдалым'),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, jazylymdar[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange, // Change color for Listening button
                                ),
                                child: Text('Жазылым'),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 0,); },
      ),
    );
  }
}

List<String> modules = [
  "1-модуль",
  "2-модуль",
  "3-модуль",
  "4-модуль",
  "5-модуль",
  "6-модуль",
  "7-модуль",
  "8-модуль",
  "9-модуль",
  "10-модуль",
  "11-модуль",
  "12-модуль",
  "13-модуль",
  "14-модуль",
  "15-модуль"
];

