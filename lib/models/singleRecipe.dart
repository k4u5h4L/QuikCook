import 'package:quikcook/models/full_recipe.dart';

class SingleRecipe {
  late String calories,
      carbs,
      category,
      cuisine,
      desc,
      imgSrc,
      name,
      preparation,
      protein;

  late List<String> ingredients;

  SingleRecipe(
      {calories = "25",
      carbs = "35",
      category = "Tea",
      cuisine = "Continental",
      desc = "Description not provided",
      imgSrc = "./assets/logo.png",
      ingredients = const ["No info available"],
      required name,
      preparation = "No info available",
      protein = "6.8"}) {
    this.calories = calories;
    this.carbs = carbs;
    this.category = category;
    this.cuisine = cuisine;
    this.desc = desc;
    this.imgSrc = imgSrc;
    this.ingredients = ingredients;
    this.name = name;
    this.preparation = preparation;
    this.protein = protein;
  }
}
