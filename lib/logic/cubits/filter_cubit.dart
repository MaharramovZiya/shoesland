import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<Map<String, bool>> {
  FilterCubit() : super({});

  void toggleSelect(String option) {
    emit({
      ...state,
      option: !(state[option] ?? false),
    });

    
  }
  void resetFilters() {
      emit({});
    }
}
