import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'utility.dart';
import 'recipe.dart';

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

  List<Recipe> _recipes = List<Recipe>();

  Future<List<Recipe>> fetchRecipes() async {

    var recipes = List<Recipe>();
    var jsonHelp = JsonHelper('assets/recipe_data.json');
    var recipeJsonList = await jsonHelp.getJsonArray();
    //print(recipeJsonList.toString()+'recipes list');

    for(var recipeJson in recipeJsonList){
      recipes.add(Recipe.fromJson(recipeJson));
    }
    return recipes;
  }

  @override
  void initState() {
    setState(() {
      fetchRecipes().then((value) {
        _recipes = value;
        print(_recipes.toString()+'asasasas');
      });
    });
    super.initState();
  }

  // Widget _buildSuggestions() {
  //   return ListView.builder(
  //       padding: EdgeInsets.all(16.0),
  //       itemBuilder: (context, i) {
  //         if (i.isOdd) return Divider(height: 2.0, color: Colors.yellow,); // adds the divider between word pairs
  //
  //         final index = i ~/ 2; // calculates nr of word pairs
  //         if (index >= _suggestions.length) {
  //           _suggestions.addAll(generateWordPairs().take(10));
  //         }
  //         return _buildRow(_suggestions[index]);
  //       });
  // }

  // Widget _buildRow(WordPair pair) {
  //   final alreadySaved = _saved.contains(pair);
  //
  //   return ListTile(
  //     title: Text(
  //       pair.asPascalCase,
  //       style: _biggerFont,
  //     ),
  //     trailing: Icon(
  //       alreadySaved ? Icons.favorite : Icons.favorite_border,
  //       color: alreadySaved ? Colors.red : null,
  //     ),
  //     onTap: () {
  //       setState(() {
  //         if(alreadySaved) _saved.remove(pair);
  //         else _saved.add(pair);
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Healthy Food Recipes'),
        ),
      body: null,//_buildSuggestions(),
    );
  }
}