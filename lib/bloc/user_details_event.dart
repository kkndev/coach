abstract class UserDetailsEvent {}

class Init extends UserDetailsEvent {}

class UpdateName extends UserDetailsEvent {
  String name;

  UpdateName(this.name);
}

class UpdateAge extends UserDetailsEvent {
  int age;

  UpdateAge(this.age);
}
