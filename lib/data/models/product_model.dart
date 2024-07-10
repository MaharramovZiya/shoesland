import 'package:shoesland/core/constants/local_images.dart';

class Product {
  final String id;
  final String tag;
  final String name;
  final double price;
  final String description;
  final String imagePath;
  final String categoryTag;

  Product({
    required this.categoryTag,
    required this.description,
    required this.tag,
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

List<Product> productList = [
  Product(
      id: '1',
      tag: "BEST SELLER",
      name: "Nike Jordan",
      price: 849.69,
      imagePath: LocalImages.shoes_img0,
      categoryTag: "Nike",
      description:
          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....'),
  Product(
      id: '2',
      tag: "BEST SELLER",
      name: "Nike Air Max",
      price: 849.69,
      imagePath: LocalImages.shoes_img1,
      categoryTag: "Nike",
      description:
          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....'),
  Product(
      id: '3',
      tag: "BEST CHOICE",
      name: "Nike Air Jordan",
      price: 849.69,
      imagePath: LocalImages.shoes_img2,
      categoryTag: "Nike",
      description:
          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....'),
  Product(
      id: '4',
      tag: "BEST CHOICE",
      name: "Nike A",
      price: 849.69,
      imagePath: LocalImages.shoes_img6,
      categoryTag: "Puma",
      description:
          'Puma Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....'),
];
