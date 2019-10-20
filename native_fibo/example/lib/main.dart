import 'package:flutter/material.dart';
import 'package:native_fibo/native_fibo.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native C++ fibo example'),
        ),
        body: Center(
          child: Text(() {
            var tmp = '';
            for (var i = 0; i < 10; i++) tmp += native_fibo(i).toString() + " ";
            return tmp;
          }()),
        ),
      ),
    );
  }
}
