import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';

/// Flutter code sample for [RangeSlider].

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(600, 800);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      activeColor: Colours.blueColor,
      values: _currentRangeValues,
      overlayColor: const WidgetStatePropertyAll(Colours.white),
      max: 3000,
      divisions: 5,
      inactiveColor: Colours.bgNikeTxtColor,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}
