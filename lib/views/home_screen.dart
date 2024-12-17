import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_suggest/models/Category.dart';
import 'package:meal_suggest/models/meal.dart';
import 'package:meal_suggest/providers/category_provider.dart';
import 'package:meal_suggest/providers/meal_provider.dart';
import 'package:meal_suggest/views/add_meal_screen.dart';
import 'package:meal_suggest/views/meal_detail_screen.dart';
import 'package:meal_suggest/views/saved_meal_screen.dart';
import 'package:meal_suggest/views/search_meal_screen.dart';
import 'package:meal_suggest/views/utils/bottom_navbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
    final mealsProvider = Provider.of<MealProvider>(context);
    final categoriesProvider = Provider.of<CategoryProvider>(context);
    final categories = categoriesProvider.categories;
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
        actions: [
          Padding(
              padding: EdgeInsets.all(12),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SavedMealScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.favorite),
              )),
        ],
      ),
      body: SingleChildScrollView(
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
                  fillColor: Colors.white,
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
                "HighLights",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    Category currentCat = categories[index];

                    return Container(
                      width: 300,
                      height: 150,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://picsum.photos/300/150"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.black26,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.orange[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: FaIcon(FontAwesomeIcons.locationDot),
                                  ),
                                ),
                                const Text(
                                  "New Story Found",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
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
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    Category currentCat = categories[index];

                    return _buildCategoryChip(
                        context, currentCat.label, currentCat.icon);
                  },
                ),
              ),
              // const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: totalMeals.length,
                itemBuilder: (context, index) {
                  Meal mealItem = totalMeals[index];
                  return _buildMealCard(context, mealItem);
                  // return Text(mealItem.title);
                },
              ),
              Text("some text")
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      // Subtle background color
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

  Widget _buildCategoryChip(context, String label, IconData icon) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SearchMealScreen()));
      },
      child: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Container(
            margin: EdgeInsets.all(10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xAAFACC98),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: FaIcon(
                icon,
                color: Colors.orange,
              ),
            ),
          )),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: AspectRatio(
                aspectRatio: 9 / 8,
                child: Image.network(
                  '${meal.imageUrl}', // Replace with actual meal image URL
                  height: 80,
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
