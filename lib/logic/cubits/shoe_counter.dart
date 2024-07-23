import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeCounterCubit extends Cubit<int> {
  ShoeCounterCubit() : super(0);
  void incrementShoe() {
    emit(state + 1);
  }

  void decrementShoe() {
    emit(state - 1);
  }
}
