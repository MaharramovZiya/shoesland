import 'package:shoesland/core/constants/local_images.dart';

class CategoryModel {
  final String title;
    bool isSelected;
  final String imagePath;

  CategoryModel({
    this.isSelected = false,
    required this.title, required this.imagePath});
}

List<CategoryModel> categoryList = [
  CategoryModel(title: "Puma", imagePath: LocalImages.l_0),
  CategoryModel(title: "Converse", imagePath: LocalImages.l_1),
  CategoryModel(title: "Under Armour", imagePath: LocalImages.l_5),
  CategoryModel(title: "Nike", imagePath: LocalImages.l_3),
  CategoryModel(title: "ASICS", imagePath: LocalImages.l_4),
];
