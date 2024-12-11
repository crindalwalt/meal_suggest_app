import 'package:flutter/material.dart';
import 'package:meal_suggest/models/meal.dart';

class MealProvider extends ChangeNotifier {
  final List<Meal> _meals = [
    Meal(
      id: 'm1',
      title: 'Spaghetti Carbonara',
      imageUrl: 'https://images.pexels.com/photos/12918198/pexels-photo-12918198.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      excerpt: 'A classic Italian pasta dish.',
      approxTime: 30.0,
      difficultyLevel: 'Medium',
      servingSize: '2',
      ingredients: [
        'Spaghetti',
        'Eggs',
        'Pancetta',
        'Parmesan',
        'Black Pepper'
      ],
      steps: [
        'Cook spaghetti in salted water.',
        'Fry pancetta in a pan.',
        'Mix eggs and Parmesan in a bowl.',
        'Combine pasta with pancetta and egg mixture.',
        'Serve with black pepper on top.',
      ],
    ),
    Meal(
      id: 'm2',
      title: 'Chicken Curry',
      imageUrl: 'https://images.pexels.com/photos/29685076/pexels-photo-29685076/free-photo-of-spicy-indian-chicken-curry-in-brass-pan.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      excerpt: 'A flavorful Indian-inspired curry.',
      approxTime: 40.0,
      difficultyLevel: 'Medium',
      servingSize: '4',
      ingredients: ['Chicken', 'Onions', 'Tomatoes', 'Garlic', 'Spices'],
      steps: [
        'Marinate chicken with spices.',
        'Sauté onions and garlic.',
        'Add tomatoes and cook until soft.',
        'Add chicken and cook thoroughly.',
        'Simmer and serve with rice.',
      ],
    ),
    Meal(
      id: 'm3',
      title: 'Vegetable Stir-Fry',
      imageUrl: 'https://images.pexels.com/photos/15322739/pexels-photo-15322739/free-photo-of-frying-vegetables-on-pan.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      excerpt: 'Quick and healthy veggie dish.',
      approxTime: 20.0,
      difficultyLevel: 'Easy',
      servingSize: '2',
      ingredients: [
        'Mixed vegetables',
        'Soy sauce',
        'Ginger',
        'Garlic',
        'Sesame oil'
      ],
      steps: [
        'Heat oil in a pan.',
        'Add garlic and ginger, sauté.',
        'Add vegetables and stir-fry.',
        'Add soy sauce and cook for 2 minutes.',
        'Serve hot.',
      ],
    ),
    Meal(
      id: 'm4',
      title: 'Beef Stroganoff',
      imageUrl: 'https://images.pexels.com/photos/28503619/pexels-photo-28503619/free-photo-of-delicious-beef-stroganoff-with-vegetables.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      excerpt: 'Rich and creamy beef dish.',
      approxTime: 45.0,
      difficultyLevel: 'Hard',
      servingSize: '4',
      ingredients: ['Beef', 'Mushrooms', 'Onions', 'Sour cream', 'Pasta'],
      steps: [
        'Cook beef strips in a pan.',
        'Sauté onions and mushrooms.',
        'Add beef back to the pan.',
        'Mix in sour cream and simmer.',
        'Serve over cooked pasta.',
      ],
    ),
    Meal(
      id: 'm5',
      title: 'Grilled Salmon',
      imageUrl: 'https://images.pexels.com/photos/725991/pexels-photo-725991.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      excerpt: 'A healthy and delicious salmon recipe.',
      approxTime: 25.0,
      difficultyLevel: 'Easy',
      servingSize: '2',
      ingredients: [
        'Salmon fillets',
        'Olive oil',
        'Lemon',
        'Garlic',
        'Parsley'
      ],
      steps: [
        'Preheat the grill.',
        'Brush salmon fillets with olive oil.',
        'Season with garlic, lemon, and parsley.',
        'Grill for 10-12 minutes.',
        'Serve with a side of vegetables.',
      ],
    ),
    Meal(
      id: 'm6',
      title: 'Margherita Pizza',
      imageUrl: 'https://images.pexels.com/photos/19602378/pexels-photo-19602378/free-photo-of-hands-holding-pizzas.jpeg?auto=compress&cs=tinysrgb&w=400',
      excerpt: 'Classic Italian pizza with fresh ingredients.',
      approxTime: 35.0,
      difficultyLevel: 'Medium',
      servingSize: '4',
      ingredients: [
        'Pizza dough',
        'Tomato sauce',
        'Mozzarella cheese',
        'Basil leaves',
        'Olive oil'
      ],
      steps: [
        'Preheat the oven to 220°C (430°F).',
        'Spread tomato sauce on pizza dough.',
        'Add mozzarella cheese and basil leaves.',
        'Bake for 15-20 minutes.',
        'Drizzle with olive oil before serving.',
      ],
    ),
    Meal(
      id: 'm7',
      title: 'Chicken Caesar Salad',
      imageUrl: 'https://images.pexels.com/photos/5639371/pexels-photo-5639371.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      excerpt: 'A classic salad with grilled chicken.',
      approxTime: 20.0,
      difficultyLevel: 'Easy',
      servingSize: '2',
      ingredients: [
        'Chicken breast',
        'Romaine lettuce',
        'Caesar dressing',
        'Parmesan',
        'Croutons'
      ],
      steps: [
        'Grill chicken until cooked through.',
        'Chop Romaine lettuce and place in a bowl.',
        'Add sliced chicken, Parmesan, and croutons.',
        'Drizzle with Caesar dressing.',
        'Toss and serve.',
      ],
    ),
    Meal(
      id: 'm8',
      title: 'Vegetarian Tacos',
      imageUrl: 'https://images.pexels.com/photos/5639371/pexels-photo-5639371.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      excerpt: 'Tacos filled with fresh veggies and beans.',
      approxTime: 15.0,
      difficultyLevel: 'Easy',
      servingSize: '3',
      ingredients: [
        'Taco shells',
        'Black beans',
        'Corn',
        'Lettuce',
        'Tomato',
        'Cheese'
      ],
      steps: [
        'Warm taco shells in a pan.',
        'Prepare the filling with beans, corn, and veggies.',
        'Fill each taco shell with the mixture.',
        'Top with cheese and lettuce.',
        'Serve with salsa or guacamole.',
      ],
    ),
    Meal(
      id: 'm9',
      title: 'Pancakes',
      imageUrl: 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      excerpt: 'Fluffy pancakes perfect for breakfast.',
      approxTime: 20.0,
      difficultyLevel: 'Easy',
      servingSize: '4',
      ingredients: [
        'Flour',
        'Milk',
        'Eggs',
        'Sugar',
        'Butter',
        'Baking powder'
      ],
      steps: [
        'Mix flour, sugar, and baking powder in a bowl.',
        'Whisk in milk, eggs, and melted butter.',
        'Heat a pan and pour batter to form pancakes.',
        'Cook until bubbles form, then flip.',
        'Serve with syrup or fresh fruits.',
      ],
    ),

    // Add more meals here
  ];
  List<Meal> get meals => _meals;
}
