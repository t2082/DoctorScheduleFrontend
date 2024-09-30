// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String vector;
  bool isSelected;

  CategoryModel({
    required this.vector,
    required this.isSelected,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
        CategoryModel(vector: 'assets/vectors/heart.svg', isSelected: true));
    categories.add(
        CategoryModel(vector: 'assets/vectors/pill.svg', isSelected: false));
    categories.add(
        CategoryModel(vector: 'assets/vectors/dentist.svg', isSelected: false));
    categories.add(
        CategoryModel(vector: 'assets/vectors/pregnant.svg', isSelected: false));

    return categories;
  }
}
