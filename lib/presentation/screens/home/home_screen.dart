import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/data/models/category_model.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/logic/cubits/select_category.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';
import 'package:shoesland/presentation/screens/details/detail_page.dart';
import 'package:shoesland/presentation/screens/home/widgets/arrival_widget.dart';
import 'package:shoesland/presentation/screens/home/widgets/product_card.dart';
import 'package:shoesland/presentation/screens/home/widgets/search_widget.dart';
import 'package:shoesland/presentation/screens/home/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildUi(context);
  }
}

Widget _buildUi(BuildContext context) {
  return Scaffold(
      body: SafeArea(
    child: Padding(
      padding: AppPadding.pageWithPadding,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildHomeNavigateTopMenu(context),
            const SizedBox(
              height: 20,
            ),
            const SearchWidget(),
            _buildCategoryMenu(),
            _buildProductDesign(context),
          ],
        ),
      ),
    ),
  ));
}

//Category which you can use what you want see that category
Widget _buildCategoryMenu() {
  return BlocProvider(
    create: (context) => SelectCategoryCubit(),
    child: BlocBuilder<SelectCategoryCubit, List<CategoryModel>>(
      builder: (context, categoryList) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              final category = categoryList[index];
              return GestureDetector(
                onTap: () {
                  context
                      .read<SelectCategoryCubit>()
                      .toggleSelectCategory(index);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: category.isSelected
                            ? Colours.blueColor
                            : Colours.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            category.imagePath,
                            fit: BoxFit.contain,
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}

//Home page main
Widget _buildProductDesign(BuildContext context) {
  return Column(
    children: [
      SectionHeader(onSeeAllPressed: () {}, title: LocalStrings().popularShoes),
      _buildPopularSection(context),
      const SizedBox(
        height: 25,
      ),
      SectionHeader(onSeeAllPressed: () {}, title: LocalStrings().newArrivals),
      _buildArrivalSection(context)
    ],
  );
}

//Popular card
Widget _buildPopularSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: productList.take(2).map((product) {
      return ProductCard(
        product: product,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(product: product),
            ),
          );
        },
      );
    }).toList(),
  );
}

//Arrival
Widget _buildArrivalSection(BuildContext context) {
  Product product = productList[2];

  return ArrivalWidget(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(product: product),
        ),
      );
    },
    product: product,
  );
}
