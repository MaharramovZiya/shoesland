import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/data/models/product_model.dart';

class NotificationProductCubit extends Cubit<NotifProductState> {
  NotificationProductCubit() : super(NotifProductLoaded(_initialProductList));
  
static final List<Product> _initialProductList = productList;

  void clearProducts() {
    emit(NotifProductLoaded([]));
  }
}

@immutable
abstract class NotifProductState {}

final class NotifProductInitial extends NotifProductState {}

final class NotifProductLoaded extends NotifProductState {
  final List<Product> products;
  NotifProductLoaded(this.products);
}
