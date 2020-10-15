import 'package:flutter/cupertino.dart';

class RecipeComment {
  int commentID;
  int recipeID;
  String commentTitle;
  String commentBody;

  RecipeComment(this.recipeID, this.commentTitle, this.commentBody);

  RecipeComment.fromJson(Map<String, dynamic> json) {
    commentID=json['commentID'];
    recipeID = json['recipeID'];
    commentTitle = json['commentTitle'];
    commentBody = json['commentBody'];
  }
}
