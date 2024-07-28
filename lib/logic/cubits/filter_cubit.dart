import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<Map<String, dynamic>> {
  final RangeValues defaultRangeValues = const RangeValues(600, 800);

  FilterCubit()
      : super({
          'Gender': {'Men': false, 'Women': false, 'Unisex': false},
          'Size': {
            'UK 4.4': false,
            'US 5.5': false,
            'UK 6.5': false,
            'EU 11.5': false,
            'BS 13.5': false
          },
          'PriceRange': const RangeValues(600, 800),
        });

  void toggleSelect(String category, String option) {
    final newState = Map<String, dynamic>.from(state);
    newState[category][option] = !(newState[category][option] as bool);
    emit(newState);
  }

  void resetFilters() {
    emit({
      'Gender': {'Men': false, 'Women': false, 'Unisex': false},
      'Size': {
        'UK 4.4': false,
        'US 5.5': false,
        'UK 6.5': false,
        'EU 11.5': false,
        'BS 13.5': false
      },
      'PriceRange': defaultRangeValues,
    });
  }

  void updatePriceRange(RangeValues values) {
    final newState = Map<String, dynamic>.from(state);
    newState['PriceRange'] = values;
    emit(newState);
  }
}
