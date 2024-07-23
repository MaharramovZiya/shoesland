import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/logic/blocs/bloc/cart_bloc.dart';
import 'package:shoesland/logic/cubits/shoe_counter.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/home/widgets/navigate_top_menu.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageWithPadding,
          child: SingleChildScrollView(child: _buildUI(context)),
        ),
      ),
    );
  }
}

Widget _buildUI(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //top menu
      _buildNavigateTopMenu(),

      //shoes list

      _buildCallingShoes(context)
    ],
  );
}

//Navigate top menu

Widget _buildNavigateTopMenu() {
  return NavigateTopMenu(
      trallingIcon: Icons.favorite_border,
      trallingOnPressed: () {
        Get.toNamed(Routes.favourites);
      },
      leadingIcon: Icons.arrow_back_ios_new_rounded,
      leadingOnPressed: () {
        Get.back();
      },
      title: LocalStrings().myCart);
}

//Calling shoes

Widget _buildCallingShoes(context) {
  final CustomSize size = CustomSize(context);
  return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
      if (state is CartUpdated) {
        final cartItems = state.cartItems;
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartItems[index];
            return Container(
              width: size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Cart image left
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 80,
                        height: size.height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(cartItem.imagePath))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //Shoes description right
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Shoe title
                              GeneralTextWidget(cartItem.name,
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),

                              //Shoe price
                              GeneralTextWidget("\$${cartItem.price}",
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              //Shoe counter
                              BlocBuilder<ShoeCounterCubit, int>(
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<ShoeCounterCubit>()
                                              .decrementShoe();
                                        },
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      LocalImages.minus)),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GeneralTextWidget(
                                          context
                                              .read<ShoeCounterCubit>()
                                              .state
                                              .toString(),
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<ShoeCounterCubit>()
                                              .incrementShoe();
                                        },
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      LocalImages.plus)),
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),

                          //Size and delete
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                cartItem.tag,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_outline_outlined,
                                ),
                                color: Colors.red,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }
      return const Center(
        child: Text("Sebet bos!"),
      );
    },
  );
}
