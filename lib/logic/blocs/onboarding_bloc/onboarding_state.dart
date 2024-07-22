part of 'onboarding_bloc.dart';

@immutable
 class OnboardingState extends Equatable {
  final int currentPage;
  const OnboardingState({this.currentPage = 0});

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(currentPage: currentPage ?? this.currentPage);
  }

  @override
  List<Object> get props => [currentPage];
}

final class OnboardingInitial extends OnboardingState {}
