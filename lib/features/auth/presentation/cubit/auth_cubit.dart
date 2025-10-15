import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user.dart';
import 'auth_state.dart';

/// Cubit for Authentication
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  /// Start registration process
  void startRegistration() {
    emit(const AuthRegistrationInProgress(currentStep: 0));
  }

  /// Save email and move to personalization
  void saveEmail(String email) {
    final currentState = state;
    if (currentState is AuthRegistrationInProgress) {
      emit(currentState.copyWith(email: email, currentStep: 1));
    }
  }

  /// Save gender and move to country selection
  void saveGender(String gender) {
    final currentState = state;
    if (currentState is AuthRegistrationInProgress) {
      emit(currentState.copyWith(gender: gender, currentStep: 2));
    }
  }

  /// Save country and move to username/avatar
  void saveCountry(String country) {
    final currentState = state;
    if (currentState is AuthRegistrationInProgress) {
      emit(currentState.copyWith(country: country, currentStep: 3));
    }
  }

  /// Complete registration
  Future<void> completeRegistration({
    required String username,
    String? avatarUrl,
  }) async {
    emit(const AuthLoading());

    try {
      final currentState = state;
      if (currentState is AuthRegistrationInProgress) {
        // TODO: Call actual API to create user
        await Future.delayed(const Duration(seconds: 2)); // Simulate API call

        // Create user entity
        final user = User(
          id: 'user_123', // From API response
          email: currentState.email ?? '',
          username: username,
          avatarUrl: avatarUrl,
          gender: currentState.gender,
          country: currentState.country,
          createdAt: DateTime.now(),
        );

        emit(AuthAuthenticated(user));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Login with email and password
  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());

    try {
      // TODO: Call actual API to login
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      final user = User(
        id: 'user_123',
        email: email,
        username: 'johndoe',
        createdAt: DateTime.now(),
      );

      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Social login (Google/Facebook)
  Future<void> socialLogin(String provider) async {
    emit(const AuthLoading());

    try {
      // TODO: Implement actual social login
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      final user = User(
        id: 'user_123',
        email: 'user@example.com',
        username: 'johndoe',
        createdAt: DateTime.now(),
      );

      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      // TODO: Clear tokens and user data
      emit(const AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Go back in registration flow
  void goBackInRegistration() {
    final currentState = state;
    if (currentState is AuthRegistrationInProgress &&
        currentState.currentStep > 0) {
      emit(currentState.copyWith(currentStep: currentState.currentStep - 1));
    }
  }
}



