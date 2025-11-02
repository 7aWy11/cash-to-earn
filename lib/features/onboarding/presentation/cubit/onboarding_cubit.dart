import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_state.dart';

/// Cubit for Onboarding
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingInitial());

  /// Update current page
  void updatePage(int page) {
    emit(OnboardingInProgress(page));
  }

  /// Complete onboarding
  Future<void> complete() async {
    // TODO: Save onboarding completion status to local storage
    emit(const OnboardingCompleted());
  }

  /// Skip onboarding
  Future<void> skip() async {
    // TODO: Save onboarding completion status to local storage
    emit(const OnboardingSkipped());
  }
}
