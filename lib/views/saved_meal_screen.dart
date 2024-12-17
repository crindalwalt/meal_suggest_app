import 'package:flutter/material.dart';
import 'package:meal_suggest/models/meal.dart';
import 'package:meal_suggest/providers/meal_provider.dart';
import 'package:meal_suggest/views/utils/bottom_navbar.dart';
import 'package:provider/provider.dart';

class SavedMealScreen extends StatefulWidget {
  @override
  State<SavedMealScreen> createState() => _SavedMealScreenState();
}

class _SavedMealScreenState extends State<SavedMealScreen> {
  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealProvider>(context);
    final savedMeal = mealProvider.savedMeal;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Saved Meals",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${savedMeal.length} Meals Saved",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: savedMeal.length,
                  itemBuilder: (context, index) {
                    final meal = savedMeal[index];
                    return _buildMealCard(context, meal);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavbar());
  }

  Widget _buildMealCard(BuildContext context, Meal meal) {
    final mealProvider = Provider.of<MealProvider>(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              meal.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  meal.excerpt,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to meal detail page
                      mealProvider.toggleSavedStatus(meal.id);
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: Text(
                      "Remove",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
