import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_details_state.dart';
import 'user_details_event.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(const UserDetailsState.empty()) {
    on<UpdateName>((event, emit) => emit(state.copyWith(name: event.name)));
    on<UpdateAge>((event, emit) => emit(state.copyWith(age: event.age)));
  }
}
