part of 'user_bloc.dart';

abstract class UserEvent {}

class UsersLoadEvent extends UserEvent {}

class UsersClearEvent extends UserEvent {}
