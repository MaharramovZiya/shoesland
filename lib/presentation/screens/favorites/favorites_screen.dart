import 'package:flutter/material.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageWithPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildFavoriteNavigateTopMenu(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
