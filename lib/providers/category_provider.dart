import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_suggest/models/Category.dart';

class CategoryProvider extends ChangeNotifier {
  final List<Category> _categories = [
    Category(
      id: "1",
      label: "Burgers",
      icon: FontAwesomeIcons.burger,
    ),
    Category(
      id: "2",
      label: "Pizza",
      icon: FontAwesomeIcons.pizzaSlice,
    ),
    Category(
      id: "3",
      label: "Salads",
      icon: FontAwesomeIcons.carrot,
    ),
    Category(
      id: "4",
      label: "Pasta",
      icon: FontAwesomeIcons.bowlRice,
    ),
    Category(
      id: "5",
      label: "Desserts",
      icon: FontAwesomeIcons.iceCream,
    ),
    Category(
      id: "6",
      label: "Seafood",
      icon: FontAwesomeIcons.fish,
    ),
    Category(
      id: "7",
      label: "Drinks",
      icon: FontAwesomeIcons.wineGlass,
    ),
    Category(
      id: "8",
      label: "Snacks",
      icon: FontAwesomeIcons.bowlFood,
    ),
    Category(
      id: "9",
      label: "Soups",
      icon: FontAwesomeIcons.mugHot,
    ),
    Category(
      id: "10",
      label: "Vegetarian",
      icon: FontAwesomeIcons.leaf,
    ),
  ];

  List<Category> get categories => _categories;
}
