import 'package:weather_forecast/models/user_model.dart';
import 'package:weather_forecast/models/users_address_model.dart';

import 'user_api_provider.dart';

class UsersRepository {
  final UsersProvider _userProvider = UsersProvider();

  Future<List<Users>> getAllUsers() => _userProvider.getUsers();
  Future<List<UsersAddress>> getAllAddress() => _userProvider.getAddress();
}
