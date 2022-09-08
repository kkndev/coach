import 'package:equatable/equatable.dart';

// Пример работы с библиотекой Equatable
// Позволяет сравнивать объекты не по ссылке
// override the == operator as well as hashCode
class Person extends Equatable {
  const Person(this.name);

  final String name;

  @override
  List<Object> get props => [name];

  @override
  bool get stringify => true;
}

// Можно использовать как миксин
class EquatableDateTime extends DateTime with EquatableMixin {
  EquatableDateTime(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  ]) : super(year, month, day, hour, minute, second, millisecond, microsecond);

  @override
  List<Object> get props {
    return [year, month, day, hour, minute, second, millisecond, microsecond];
  }
}
