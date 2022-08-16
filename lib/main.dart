import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

//https://codingwithdhrumil.com/2021/07/deep-linking-flutter-example.html
//https://mobikul.com/deeplinking-in-flutter/
//https://blog.logrocket.com/understanding-deep-linking-flutter-uni-links/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deep Link',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String link = "";

  @override
  void initState() {
    initialLink().then((value) => this.setState(() {
          if (value != null) {
            link = value;
          } else {
            link = "Test";
          }
          print("ckckckkc ==> ${link}");
        }));
    super.initState();
  }

  Future<String?> initialLink() async {
    try {
      final initialLink = await getInitialLink();
      return initialLink;
    } on PlatformException catch (exception) {
      log(exception.message!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(link == null ? "" : link),
          ],
        ),
      ),
    );
  }
}
