import 'package:flutter/material.dart';

class AddMealForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Meal Name',
            ),
          ),
        ],
      ),
    );
  }
}
