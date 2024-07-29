import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/logic/cubits/filter_cubit.dart';

/// Flutter code sample for [RangeSlider].


class PriceRangeSlider extends StatelessWidget {
  const PriceRangeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, Map<String, dynamic>>(
      builder: (context, state) {
        final RangeValues currentRangeValues = state['PriceRange'] as RangeValues;
        return RangeSlider(
          activeColor: Colours.blueColor,
          values: currentRangeValues,
          overlayColor: const WidgetStatePropertyAll(Colours.white),
          max: 3000,
          divisions: 5,
          inactiveColor: Colours.bgNikeTxtColor,
          labels: RangeLabels(
            currentRangeValues.start.round().toString(),
            currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            context.read<FilterCubit>().updatePriceRange(values);
          },
        );
      },
    );
  }
}
