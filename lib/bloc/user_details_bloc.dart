import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'user_details_event.dart';
import 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(const UserDetailsState.empty()) {
    on<Init>((event, emit) {
      var box = Hive.box('UserDetails');

      emit(
        state.copyWith(
          name: box.get('name', defaultValue: ''),
          age: box.get('age', defaultValue: 0),
        ),
      );
    });
    on<UpdateName>((event, emit) {
      var box = Hive.box('UserDetails');
      box.put('name', event.name);

      emit(state.copyWith(name: event.name));
    });
    on<UpdateAge>((event, emit) {
      var box = Hive.box('UserDetails');
      box.put('age', event.age);
      emit(state.copyWith(age: event.age));
    });
  }
}
