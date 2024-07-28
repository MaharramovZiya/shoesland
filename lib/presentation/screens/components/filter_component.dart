import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/logic/cubits/filter_cubit.dart';
import 'package:shoesland/presentation/screens/components/range_slider.dart';
class FilterModalBottomSheet extends StatelessWidget {
  const FilterModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    CustomSize size = CustomSize(context);
    List<String> options = [
      'Men',
      'Women',
      'Unisex',
    ];
    List<String> sizes = ['UK 4.4', 'US 5.5', 'UK 6.5', 'EU 11.5', 'BS 13.5'];
    return Container(
      padding: const EdgeInsets.all(10),
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Line
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 6,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colours.bgNikeTxtColor),
            ),
          ),
          // Title and Reset function
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Filters",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  context.read<FilterCubit>().resetFilters();
                },
                child: const Text(
                  "RESET",
                  style: TextStyle(color: Colours.greyColor, fontSize: 13),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Gender select Text
          const Text(
            "Gender",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Gender select function
          BlocBuilder<FilterCubit, Map<String, dynamic>>(
            builder: (context, state) {
              return Wrap(
                spacing: 8,
                children: options.map((option) {
                  return FilterChip(
                      label: Text(
                        option,
                        style: const TextStyle(fontSize: 16),
                      ),
                      selected: state['Gender'][option] ?? false,
                      onSelected: (bool selected) {
                        context.read<FilterCubit>().toggleSelect('Gender', option);
                      },
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                      backgroundColor: Colours.backgroundColor,
                      selectedColor: Colors.blue,
                      labelStyle: TextStyle(
                          color: (state['Gender'][option] ?? false)
                              ? Colors.white
                              : Colours.greyColor));
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 20),

          // Size select Text
          const Text(
            "Size",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Size select function
          BlocBuilder<FilterCubit, Map<String, dynamic>>(
            builder: (context, state) {
              return Wrap(
                spacing: 8,
                children: sizes.map((size) {
                  return FilterChip(
                      label: Text(
                        size,
                        style: const TextStyle(fontSize: 16),
                      ),
                      selected: state['Size'][size] ?? false,
                      onSelected: (bool selected) {
                        context.read<FilterCubit>().toggleSelect('Size', size);
                      },
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                      backgroundColor: Colours.backgroundColor,
                      selectedColor: Colors.blue,
                      labelStyle: TextStyle(
                          color: (state['Size'][size] ?? false)
                              ? Colors.white
                              : Colours.greyColor));
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 20),

          // Price select Text
          const Text(
            "Price",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          // Price range slider
          const PriceRangeSlider(),
        ],
      ),
    );
  }
}