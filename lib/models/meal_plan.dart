class MealPlan {
  final String type, image, title, time;

  MealPlan(this.type, this.image, this.title, this.time);

  static List<MealPlan> getList() {
    return [
      MealPlan("Breakfast", "./assets/images/quikcook/meal-1.jpg",
          "Poached Egg", "Breakfast Time : 07:30"),
      MealPlan("Lunch", "./assets/images/quikcook/meal-2.jpg", "Burger",
          "Lunch Time : 01:10"),
      MealPlan("Snacks", "./assets/images/quikcook/meal-3.jpg", "lemonade",
          "Snack Time : 05:15"),
      MealPlan("Dinner", "./assets/images/quikcook/meal-4.jpg", "Pop Corn",
          "Dinner Time : 08:30"),
    ];
  }
}
