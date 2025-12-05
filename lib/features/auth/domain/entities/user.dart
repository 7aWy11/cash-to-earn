import 'package:equatable/equatable.dart';

/// User entity
class User extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? username;
  final String? avatarUrl;
  final String? gender;
  final String? country;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.email,
    this.name,
    this.username,
    this.avatarUrl,
    this.gender,
    this.country,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    username,
    avatarUrl,
    gender,
    country,
    createdAt,
  ];

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? username,
    String? avatarUrl,
    String? gender,
    String? country,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
