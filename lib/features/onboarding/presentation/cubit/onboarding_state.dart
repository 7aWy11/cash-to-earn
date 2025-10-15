import 'package:equatable/equatable.dart';

/// Base state for Onboarding
abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

/// Onboarding in progress
class OnboardingInProgress extends OnboardingState {
  final int currentPage;

  const OnboardingInProgress(this.currentPage);

  @override
  List<Object?> get props => [currentPage];
}

/// Onboarding completed
class OnboardingCompleted extends OnboardingState {
  const OnboardingCompleted();
}

/// Onboarding skipped
class OnboardingSkipped extends OnboardingState {
  const OnboardingSkipped();
}
