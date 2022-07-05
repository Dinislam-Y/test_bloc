// Flutter imports:
import 'package:flutter/material.dart';
import 'package:weather_forecast/repository/repository.dart';
import 'package:weather_forecast/screens/home_page/bloc/user_bloc.dart';
import 'package:weather_forecast/widgets/button_widget.dart';
import 'package:weather_forecast/widgets/list_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  final UsersRepository _userApiProvider = UsersRepository();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository: _userApiProvider),
      child: Scaffold(
        backgroundColor: Colors.white60,
        body: ListView(
          children: const [
            ButtonWidget(),
            UsersListWidget(),
          ],
        ),
      ),
    );
  }
}
