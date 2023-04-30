

class ListCard {
  List<Dish> dishes;
  List<PopularDish> popularDishes;

  ListCard({
    required this.dishes,
    required this.popularDishes,
  });

  factory ListCard.fromJson(Map<String, dynamic> json) => ListCard(
    dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
    popularDishes: List<PopularDish>.from(json["popularDishes"].map((x) => PopularDish.fromJson(x))),
  );

}

class Dish {
  String name;
  double rating;
  String description;
  List<String> equipments;
  String image;
  int id;

  Dish({
    required this.name,
    required this.rating,
    required this.description,
    required this.equipments,
    required this.image,
    required this.id,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
    name: json["name"],
    rating: json["rating"]?.toDouble(),
    description: json["description"],
    equipments: List<String>.from(json["equipments"].map((x) => x)),
    image: json["image"],
    id: json["id"],
  );
}

class PopularDish {
  String name;
  String image;
  int id;

  PopularDish({
    required this.name,
    required this.image,
    required this.id,
  });

  factory PopularDish.fromJson(Map<String, dynamic> json) => PopularDish(
    name: json["name"],
    image: json["image"],
    id: json["id"],
  );

}
