import 'package:flutter/material.dart';
import 'package:healthy_food_recipes/recipe.dart';

class CommentPage extends StatefulWidget {
  CommentPage(this.recipeData);

  final Recipe recipeData;

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  @override
  Widget build(BuildContext context) {

    var recipeData = widget.recipeData;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipeData.recipeName + ' Comments',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: Text(recipeData.toString())),
          ],
        ),
      ),
    );

  }
}
