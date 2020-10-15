import 'package:flutter/material.dart';
import 'package:healthy_food_recipes/recipe.dart';
import 'constants.dart';
import 'utility.dart';
import 'comment.dart';

class CommentPage extends StatefulWidget {
  CommentPage(this.recipeData);

  final Recipe recipeData;

  @override
  _CommentPageState createState() => _CommentPageState(recipeData);
}

class _CommentPageState extends State<CommentPage> {
  _CommentPageState(this.recipeData);

  var _commentList = List<RecipeComment>();
  Recipe recipeData;

  @override
  void initState() {
    setState(() {
      _fetchComments(recipeData.recipeID);
    });
    super.initState();
  }

  //todo: add comment serialization

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeData.recipeName + ' Comments',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              icon: Icon(Icons.add_comment),
              onPressed: () => {
                    //TODO: create void method to add a new comment and place it here.
                  })
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Column(children: _commentCardList(recipeData.recipeID)),
      ),
    );
  }

  List<Widget> _commentCardList(int recipeID) {
    var _commentCards = List<Widget>();

    for (var comment in _commentList) {
      _commentCards.add(SizedBox(
          width: double.infinity,
          child: Card(
            color: kCardColor,
            margin: const EdgeInsets.all(kDefaultPadding / 4),
            elevation: 2.5,
            child: InkWell(
                onTap: () {
                  //todo: add comment editing functionality
                  print('Tapped ${comment.commentID.toString()} comment card');
                  //_pushRecipePage(_recipes[i]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(children: [
                    Text(
                      comment.commentTitle,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                          decoration: TextDecoration.underline),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: kDefaultPadding/2),
                      child: Text(
                        comment.commentBody,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: kTextColor),
                      ),
                    ),
                  ]),
                )),
          )));
    }

    return _commentCards;
  }

  //async function that fetches all recipe data form .json in assets
  void _fetchComments(int recipeID) async {
    var jsonHelp = JsonHelper('assets/recipe_comments.json');
    var commentJsonList = await jsonHelp.getJsonArray();
    print(commentJsonList.toString() + 'recipes list');

    for (var commentJson in commentJsonList) {
      if (commentJson['recipeID'] == recipeID) {
        _commentList.add(RecipeComment.fromJson(commentJson));
      }
    }

    setState(() {
      print('Force widget rebuild after fetching Json data');
    });
  }
}
