import 'package:flutter/cupertino.dart';

class Category {
  final IconData icon;
  final String label;
  final String id;

  // constructor
  Category({
    required this.id,
    required this.label,
    required this.icon,
  });
}