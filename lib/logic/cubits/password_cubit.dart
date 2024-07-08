import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<bool> {
  PasswordCubit() : super(false);

  void togglePasswordVisibility() => emit(!state);
}
