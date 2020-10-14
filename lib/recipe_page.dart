import 'package:flutter/material.dart';
import 'package:healthy_food_recipes/recipe.dart';
import 'constants.dart';

class RecipePage extends StatelessWidget {
  RecipePage(this.recipeData);

  final Recipe recipeData;
  BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    buildContext=context;
    Size pageSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(recipeData.recipeName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(icon: Icon(Icons.add_comment), onPressed: _pushRecipeCommentPage)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: pageSize.height * 0.35,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Image.asset(
                    recipeData.recipeImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                child: Text(
                  recipeData.recipeDesc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                child: Text(
                  'Ingredients',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  child: Text(
                    recipeData.recipeIngredients,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                child: Text(
                  'Directions',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  child: Column(
                      children: _directionsWidgetList(
                          recipeData.recipeInstructions))),
            ],
          ),
        ));
  }

  List<Widget> _directionsWidgetList(Map<String, dynamic> recipeInstructions) {
    final instructions = recipeInstructions;
    var _directionsWidgets = List<Widget>();
    for (var entry in instructions.entries) {
      _directionsWidgets.add(Column(
        children: [
          Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Text(
              entry.key + ':',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Text(
              entry.value,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          )
        ],
      ));
    }
    return _directionsWidgets;
  }

  //TODO: look up nested routes because this doesn't work
  // void _pushRecipeCommentPage() {
  //   Navigator.push(context,MaterialPageRoute<void>(
  //     builder: (BuildContext context) {
  //       return RecipePage(recipe);
  //     },
  //   ),)
  //
  //
  //   Navigator.of(context).push(
  //     MaterialPageRoute<void>(
  //       builder: (BuildContext context) {
  //         return RecipePage(recipe);
  //       },
  //     ),
  //   );
  // }

}
