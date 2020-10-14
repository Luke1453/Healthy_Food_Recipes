import 'package:flutter/material.dart';
import 'package:healthy_food_recipes/recipe.dart';

class RecipePage extends StatelessWidget {
  RecipePage(this.recipeData);
  final Recipe recipeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeData.recipeName,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: null,
    );
  }
}
