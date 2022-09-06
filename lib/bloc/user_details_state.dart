import 'package:flutter/material.dart' show immutable;

@immutable
class UserDetailsState {
  final String name;
  final int age;

  const UserDetailsState({
    required this.name,
    required this.age,
  });

  const UserDetailsState.empty()
      : name = '',
        age = 0;

  UserDetailsState copyWith({
    String? name,
    int? age,
  }) {
    return UserDetailsState(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
