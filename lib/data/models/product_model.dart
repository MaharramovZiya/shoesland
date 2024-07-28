import 'dart:math';

import 'package:shoesland/core/constants/local_images.dart';

class Product {
  final String id;
  final String tag;
  final String name;
  final double price;
  final String description;
  final String imagePath;
  final String categoryTag;
  final String productAds;

  Product({
    required this.categoryTag,
    required this.description,
    required this.tag,
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.productAds,
    
  });
}

final random = Random();

List<String> randomNames = [
  "Nike Pegasus",
  "Nike Vapormax",
  "Nike Infinity",
  "Nike Air Pro",
  "Nike Free RN",
  "Nike Quest",
  "Nike ZoomX",
  "Nike Jordan",
  "Nike Downshifter",
];

List<String> randomDescriptions = [
  "Experience ultimate comfort with this innovative design...",
  "Perfect for both casual and athletic wear, providing excellent support...",
  "Engineered for performance, offering unparalleled durability...",
  "Lightweight and breathable, ideal for any activity...",
  "Combining style and functionality for everyday use...",
  "Crafted with premium materials for maximum performance...",
  "Designed for speed and agility, a top choice for athletes...",
  "Exceptional cushioning and support for long-lasting comfort..."
];

List<String> randomTags = ["NEW ARRIVAL", "HOT PICK", "TOP RATED", "EXCLUSIVE"];

List<Product> productList = [
  Product(
    id: '1',
    tag: "BEST SELLER",
    name: randomNames[random.nextInt(randomNames.length)],
    price: (random.nextDouble() * 1000).roundToDouble(),
    imagePath: LocalImages.shoes_img0,
    categoryTag: "Nike",
    productAds: "We Have New\nProducts With Offers",
    description: randomDescriptions[random.nextInt(randomDescriptions.length)],
  ),
  Product(
    id: '2',
    tag: "BEST SELLER",
    name: randomNames[random.nextInt(randomNames.length)],
    price: (random.nextDouble() * 1000).roundToDouble(),
    imagePath: LocalImages.shoes_img1,
    categoryTag: "Nike",
    productAds: "We Have New\nProducts With Offers",

    description: randomDescriptions[random.nextInt(randomDescriptions.length)],
  ),
  Product(
    id: '3',
    tag: "BEST CHOICE",
    name: randomNames[random.nextInt(randomNames.length)],
    price: (random.nextDouble() * 1000).roundToDouble(),
    imagePath: LocalImages.shoes_img2,
    categoryTag: "Nike",
    productAds: "We Have New\nProducts With Offers",

    description: randomDescriptions[random.nextInt(randomDescriptions.length)],
  ),
  Product(
    id: '4',
    tag: randomTags[random.nextInt(randomTags.length)],
    name: randomNames[random.nextInt(randomNames.length)],
    price: (random.nextDouble() * 1000).roundToDouble(),
    imagePath: LocalImages.shoes_img3,
    categoryTag: "Nike",
    productAds: "We Have New\nProducts With Offers",

    description: randomDescriptions[random.nextInt(randomDescriptions.length)],
  ),
  Product(
    id: '5',
    tag: randomTags[random.nextInt(randomTags.length)],
    name: randomNames[random.nextInt(randomNames.length)],
    price: (random.nextDouble() * 1000).roundToDouble(),
    imagePath: LocalImages.shoes_img4,
    categoryTag: "Nike",
    productAds: "We Have New\nProducts With Offers",

    description: randomDescriptions[random.nextInt(randomDescriptions.length)],
  ),
  Product(
    id: '6',
    tag: randomTags[random.nextInt(randomTags.length)],
    name: randomNames[random.nextInt(randomNames.length)],
    price: (random.nextDouble() * 1000).roundToDouble(),
    imagePath: LocalImages.shoes_img5,
    categoryTag: "Nike",
    productAds: "We Have New\nProducts With Offers",

    description: randomDescriptions[random.nextInt(randomDescriptions.length)],
  ),
  Product(
    id: '7',
    tag: randomTags[random.nextInt(randomTags.length)],
    name: randomNames[random.nextInt(randomNames.length)],
    price: (random.nextDouble() * 1000).roundToDouble(),
    imagePath: LocalImages.shoes_img6,
    categoryTag: "Nike",
    productAds: "We Have New\nProducts With Offers",

    description: randomDescriptions[random.nextInt(randomDescriptions.length)],
  ),
  Product(
    id: '8',
    tag: randomTags[random.nextInt(randomTags.length)],
    name: randomNames[random.nextInt(randomNames.length)],
    price: (random.nextDouble() * 1000).roundToDouble(),
    imagePath: LocalImages.shoes_img7,
    categoryTag: "Nike",
    productAds: "We Have New\nProducts With Offers",

    description: randomDescriptions[random.nextInt(randomDescriptions.length)],
  ),
];
