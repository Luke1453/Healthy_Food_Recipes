import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Healthy Food Recipes',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Healthy Food Recipes'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
    
  }
}