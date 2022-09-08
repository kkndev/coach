import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_copy.freezed.dart';

@freezed
class Company with _$Company {
  factory Company({String? name, required Director director}) = _Company;
}

@freezed
class Director with _$Director {
  factory Director({String? name, Assistant? assistant}) = _Director;
}

@freezed
class Assistant with _$Assistant {
  factory Assistant({String? name, int? age}) = _Assistant;
}

Assistant assistant = Assistant(name: 'assistantName', age: 25);
Director director = Director(name: 'directorName', assistant: assistant);
Company company = Company(director: director);

// Company newCompany = company.copyWith(
//   director: company.director.copyWith(
//     assistant: company.director.assistant?.copyWith(
//       name: 'John Smith',
//     ),
//   ),
// );

Company newCompany = company.copyWith.director.assistant!(name: 'John Smith');
