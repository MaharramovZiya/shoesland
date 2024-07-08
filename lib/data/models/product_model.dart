import 'package:shoesland/core/constants/local_images.dart';

class Product {
  final String id;
  final String tag;
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Product({
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
      description:
          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....'),
  Product(
      id: '2',
      tag: "BEST SELLER",
      name: "Nike Air Max",
      price: 849.69,
      imagePath: LocalImages.shoes_img1,
      description:
          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....'),
  Product(
      id: '3',
      tag: "BEST CHOICE",
      name: "Nike Air Jordan",
      price: 849.69,
      imagePath: LocalImages.shoes_img2,
      description:
          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....'),
];
