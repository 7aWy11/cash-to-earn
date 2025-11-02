import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

/// Base state for Auth
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Loading state
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// Authenticated state
class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

/// Unauthenticated state
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

/// Error state
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Registration in progress (for multi-step signup)
class AuthRegistrationInProgress extends AuthState {
  final String? email;
  final String? gender;
  final String? country;
  final int currentStep;

  const AuthRegistrationInProgress({
    this.email,
    this.gender,
    this.country,
    this.currentStep = 0,
  });

  @override
  List<Object?> get props => [email, gender, country, currentStep];

  AuthRegistrationInProgress copyWith({
    String? email,
    String? gender,
    String? country,
    int? currentStep,
  }) {
    return AuthRegistrationInProgress(
      email: email ?? this.email,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      currentStep: currentStep ?? this.currentStep,
    );
  }
}



