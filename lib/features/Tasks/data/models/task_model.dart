import 'package:equatable/equatable.dart';

/// Task Model for task details
class TaskModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final double reward;
  final String status;
  final List<String> instructions;
  final String? installLink;
  final DateTime? createdAt;
  final DateTime? deadline;

  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.reward,
    required this.status,
    required this.instructions,
    this.installLink,
    this.createdAt,
    this.deadline,
  });

  // Factory constructor to create TaskModel from JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      reward: (json['reward'] as num).toDouble(),
      status: json['status'] as String,
      instructions: (json['instructions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      installLink: json['install_link'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      deadline: json['deadline'] != null
          ? DateTime.parse(json['deadline'] as String)
          : null,
    );
  }

  // Convert TaskModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'reward': reward,
      'status': status,
      'instructions': instructions,
      'install_link': installLink,
      'created_at': createdAt?.toIso8601String(),
      'deadline': deadline?.toIso8601String(),
    };
  }

  // Copy with method for immutability
  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    double? reward,
    String? status,
    List<String>? instructions,
    String? installLink,
    DateTime? createdAt,
    DateTime? deadline,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      reward: reward ?? this.reward,
      status: status ?? this.status,
      instructions: instructions ?? this.instructions,
      installLink: installLink ?? this.installLink,
      createdAt: createdAt ?? this.createdAt,
      deadline: deadline ?? this.deadline,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    reward,
    status,
    instructions,
    installLink,
    createdAt,
    deadline,
  ];
}
