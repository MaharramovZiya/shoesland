import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';
//For page view builder with bloc.
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<PageChangedEvent>(_onPageChanged);
  }

  void _onPageChanged(PageChangedEvent event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentPage: event.page));
  }
}
