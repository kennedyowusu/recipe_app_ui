class RecipeModel {
  final int id;
  final String name;
  final String image;
  final String category;

  RecipeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
  });

  bool search(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}
