import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Healthy Food Recipes',
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      home: HomePage(),
    );

  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Healthy Food Recipes'),
    ),
    body: null,
    );
  }
}