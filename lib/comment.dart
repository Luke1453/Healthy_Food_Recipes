import 'package:flutter/cupertino.dart';

enum CommentState{
  newComment,
  editedComment,
  deleteComment,
  noState
}

class RecipeComment {
  int commentID;
  int recipeID;
  String commentTitle;
  String commentBody;

  CommentState state = CommentState.noState;

  void changeState(CommentState newState){state=newState;}

  RecipeComment(this.recipeID, this.commentID, this.commentTitle, this.commentBody);

  RecipeComment.fromJson(Map<String, dynamic> json) {
    commentID = json['commentID'];
    recipeID = json['recipeID'];
    commentTitle = json['commentTitle'];
    commentBody = json['commentBody'];
  }
}
