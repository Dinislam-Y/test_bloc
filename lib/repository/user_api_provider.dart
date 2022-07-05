import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/models/user_model.dart';

import '../models/users_address_model.dart';

class UsersProvider {
  final Uri _uri = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<Users>> getUsers() async {
    final response = await http.get(_uri);

    if (response.statusCode == 200) {
      List<dynamic> usersJson = json.decode(response.body);
      return usersJson.map((json) => Users.fromJson(json)).toList();
    } else {
      return throw Exception('Error get users');
    }
  }

  Future<List<UsersAddress>> getAddress() async {
    final responseAddress = await http.get(_uri);
    if (responseAddress.statusCode == 200) {
      return json.decode(responseAddress.body);
    } else {
      return throw Exception('Error get address');
    }
  }
}
