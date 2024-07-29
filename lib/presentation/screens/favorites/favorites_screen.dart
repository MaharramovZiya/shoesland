import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/logic/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';
import 'package:shoesland/presentation/screens/favorites/widgets/favorites_cart.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

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
                buildFavoriteNavigateTopMenu(context, () {
                  context.read<FavoriteBloc>().add(const DeleteFavouriteEvent());
                }),
                _buildCallingFavourites()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCallingFavourites() {
  return BlocBuilder<FavoriteBloc, FavoriteState>(
    builder: (context, state) {
      if (state is FavoriteUpdated) {
        final favouriteItems = state.productList;
        return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (120 / 195),
          shrinkWrap: true,
          primary: false,
          physics: const ClampingScrollPhysics(),
          children: [
            for (int i = 0; i < favouriteItems.length; i++) FavoritesCart(i: i)
          ],
        );
      }
      return SizedBox(
        height: CustomSize(context).height / 1.5,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(LocalImages.favourite),
              Align(
                alignment: Alignment.center,
                child: GeneralTextWidget(
                  LocalStrings().emptyFav,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                      color: Colours.blackLikeToColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
