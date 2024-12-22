import 'package:flutter/material.dart';


class MealSaveForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mealNameController = TextEditingController();
  final TextEditingController _mealDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add New Meal",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _mealNameController,
            decoration: InputDecoration(
              labelText: "Meal Name",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a meal name";
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _mealDescriptionController,
            decoration: InputDecoration(
              labelText: "Meal Description",
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Perform save operation
                Navigator.pop(context); // Close the bottom sheet
              }
            },
            child: Text("Save Meal"),
          ),
        ],
      ),
    );
  }
}
