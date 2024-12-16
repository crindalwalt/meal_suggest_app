import 'package:flutter/material.dart';
import 'package:meal_suggest/models/meal.dart';
import 'package:meal_suggest/providers/meal_provider.dart';
import 'package:meal_suggest/views/add_meal_screen.dart';
import 'package:meal_suggest/views/meal_detail_screen.dart';
import 'package:meal_suggest/views/search_meal_screen.dart';
import 'package:meal_suggest/views/utils/bottom_navbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
    final mealsProvider = Provider.of<MealProvider>(context);
    final List<Meal> totalMeals = mealsProvider.meals;
    return Scaffold(
      key: _key,
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        leading: IconButton(
            onPressed: () {
              _key.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Meal Suggest"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 80), // Space below the transparent AppBar
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: "Search meals...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryChip(context, "Breakfast"),
                      _buildCategoryChip(context, "Lunch"),
                      _buildCategoryChip(context, "Dinner"),
                      _buildCategoryChip(context, "Snacks"),
                      _buildCategoryChip(context, "Desserts"),
                    ],
                  ),
                ),
                // const SizedBox(height: 10),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 8 / 9,
                  ),
                  itemCount: totalMeals.length,
                  itemBuilder: (context, index) {
                    Meal mealItem = totalMeals[index];
                    return _buildMealCard(context, mealItem);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200], // Subtle background color
      bottomNavigationBar: BottomNavbar(),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: IconButton(
              onPressed: () {
                _key.currentState?.closeDrawer();
              },
              icon: Icon(Icons.delete)),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(context, String label) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SearchMealScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        ),
      ),
    );
  }

  Widget _buildMealCard(context, Meal meal) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MealDetailScreen(
                  meal: meal,
                )));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: AspectRatio(
                aspectRatio: 3/2,
                child: Image.network(
                  '${meal.imageUrl}', // Replace with actual meal image URL
                  // height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${meal.title}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "${meal.excerpt}",
                style: TextStyle(color: Colors.grey, fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
