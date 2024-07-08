import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/data/models/category_model.dart';

class SelectCategoryCubit extends Cubit<List<CategoryModel>> {
  SelectCategoryCubit() : super(categoryList);

  void toggleSelectCategory(int index) {
    final updatedList = List<CategoryModel>.from(state);
    for (var i = 0; i < updatedList.length; i++) {
      updatedList[i] = CategoryModel(
        title: updatedList[i].title,
        
        imagePath: updatedList[i].imagePath,
        isSelected: i == index,
      );
    }
    emit(updatedList);
  }
}
