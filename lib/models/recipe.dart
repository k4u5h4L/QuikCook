import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  final String name, tag, image;
  final int preparationTime, serving;
  final bool favorite;

  Recipe(this.name, this.tag, this.image, this.preparationTime, this.serving,
      this.favorite);

  static List<Recipe> getList() {
    // CollectionReference recipes =
    //   FirebaseFirestore.instance.collection('recipes');

    // QuerySnapshot querySnapshot = await recipes.get();

    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    // print(allData);

    return [
      Recipe("Matar Paneer", "South", "./assets/images/quikcook/recipe-2.jpg",
          30, 1, true),
      Recipe("Tandoori Chicken", "Non Veg",
          "./assets/images/quikcook/recipe-3.jpg", 30, 1, false),
      Recipe("Aloo Gobi", "Cheese", "./assets/images/quikcook/recipe-4.jpg", 30,
          1, true),
    ];
  }

  static Recipe getOne() {
    return Recipe("Chicken Makhani\nSouth Special", "Non Veg",
        './assets/images/quikcook/recipe-1.jpg', 30, 1, false);
  }
}
