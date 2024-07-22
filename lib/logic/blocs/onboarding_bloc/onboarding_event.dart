part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();
  @override
  List<Object> get props => [];
}

class PageChangedEvent extends OnboardingEvent {
  final int page;
  const PageChangedEvent(this.page);

  @override
  List<Object> get props => [page];
}
