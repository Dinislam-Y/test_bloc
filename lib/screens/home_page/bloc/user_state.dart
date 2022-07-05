part of 'user_bloc.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<Users> loadedUsers;
  List<UsersAddress> loadedAddress;

  UserLoadedState({
    required this.loadedUsers,
    required this.loadedAddress,
  });
}

class UserErrorState extends UserState {}
