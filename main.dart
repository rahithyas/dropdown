import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AllAboutFlutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 32),
          bodyText2: TextStyle(fontSize: 32),
          subtitle1: TextStyle(fontSize: 32),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const DropdownListTutorial(),
    );
  }
}

class DropdownListTutorial extends StatefulWidget {
  const DropdownListTutorial({Key? key}) : super(key: key);

  @override
  _DropdownListTutorialState createState() => _DropdownListTutorialState();
}

class _DropdownListTutorialState extends State<DropdownListTutorial> {
  List<String> items = ["Car", "Bus", "Train", "Aeroplane"];
  String currentItem = "";
  @override
  void initState() {
    currentItem = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown List Tutorial"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                alignment: Alignment.topCenter,
                borderRadius: BorderRadius.circular(8),
                dropdownColor: Colors.blueAccent,
                value: currentItem,
                items: items
                    .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                    alignment: Alignment.center,
                  ),
                )
                    .toList(),
                onChanged: (String? value) => setState(
                      () {
                    if (value != null) currentItem = value;
                  },
                ),
              ),
            ),
            Text(currentItem),
          ],
        ),
      ),
    );
  }
}