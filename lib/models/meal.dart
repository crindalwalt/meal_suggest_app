class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final String excerpt;
  final double approxTime;
  final String difficultyLevel;
  final String servingSize;
  final List<String> ingredients;
  final List<String> steps;
  bool isSaved;
  // constructor
  Meal({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.isSaved,
    required this.imageUrl,
    required this.approxTime,
    required this.difficultyLevel,
    required this.servingSize,
    required this.ingredients,
    required this.steps,
  });
}
