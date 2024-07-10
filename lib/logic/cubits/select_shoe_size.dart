import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/data/models/shoe_size_model.dart';

class ShoeSizeCubit extends Cubit<List<ShoeSizeModel>> {
  ShoeSizeCubit() : super(shoeSizeList);

  void toggleSelectSize(int index) {
    final updatedList = List<ShoeSizeModel>.from(state);
    for (var i = 0; i < updatedList.length; i++) {
      updatedList[i] =
          ShoeSizeModel(size: updatedList[i].size, isSelected: i == index);
    }
    emit(updatedList);
  }
}
