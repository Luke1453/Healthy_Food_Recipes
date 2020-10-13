class Recipe {

  int recipeID;
  String recipeName;
  String recipeDesc;
  String recipeImage;

  Recipe(this.recipeID, this.recipeName, this.recipeDesc, this.recipeImage);

  Recipe.fromJson(Map<String, dynamic> json){
    recipeID = json['recipeID'];
    recipeName = json['recipeName'];
    recipeDesc = json['recipeDesc'];
    recipeImage = json['recipeImage'];
  }
}