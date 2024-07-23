import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/data/models/shoe_size_model.dart';
import 'package:shoesland/logic/cubits/select_shoe_size.dart';
import 'package:shoesland/presentation/screens/details/detail_page.dart';

//In the detail page check box
class CheckBoxFormField extends FormField<bool> {
  CheckBoxFormField({super.key, required String title})
      : super(
            initialValue: false,
            validator: (bool? value) => value ?? false ? null : '',
            builder: (FormFieldState<bool> state) {
              return Row(children: [
                if (state.hasError)
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                Expanded(
                  child: CheckboxListTile(
                      title: Text(title),
                      value: state.value ?? false,
                      onChanged: state.didChange),
                ),
              ]);
            });
}

class ShoeSelectSizeWidget extends FormField<bool> {
  ShoeSelectSizeWidget({super.key, })
      : super(
          initialValue: false,
          validator: (bool? value) => value ?? false ? null : '',
          builder: (FormFieldState<bool> state) {
            return Column(
              children: [
                if (state.hasError)
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                BlocProvider(
                  create: (context) => ShoeSizeCubit(),
                  child: BlocBuilder<ShoeSizeCubit, List<ShoeSizeModel>>(
                    builder: (context, shoeList) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        bool isAnySelected = shoeList.any((shoe) => shoe.isSelected);
                        if (state.value != isAnySelected) {
                          state.didChange(isAnySelected);
                        }
                      });
                      return SizedBox(
                        height: 70,
                        // width: 70,
                        child: ListView.builder(
                          itemCount: shoeList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final shoeSizeIndex = shoeList[index];
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<ShoeSizeCubit>()
                                    .toggleSelectSize(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        shoeSizeIndex.isSelected
                                            ? BoxShadow(
                                                color: const Color(0xFF5B9EE1)
                                                    .withOpacity(0.5),
                                                spreadRadius: 3,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              )
                                            : const BoxShadow(),
                                      ],
                                      color: shoeSizeIndex.isSelected
                                          ? Colours.blueColor
                                          : Colours.white,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Center(
                                      child: Text(
                                    shoeSizeIndex.size,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: shoeSizeIndex.isSelected
                                            ? Colors.white
                                            : Colors.black),
                                  )),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        );
}

mixin CustomDetailMixin on State<DetailScreen> {
  GlobalKey<FormState> customKey = GlobalKey<FormState>();

  final ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(false);

  void onChange() {
    valueNotifier.value = customKey.currentState?.validate() ?? false;
  }
}
