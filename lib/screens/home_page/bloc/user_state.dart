part of 'user_bloc.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<Users> loadedUsers;

  UserLoadedState({
    required this.loadedUsers,
  });
}

class UserErrorState extends UserState {}
