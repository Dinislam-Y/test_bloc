import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/screens/home_page/bloc/user_bloc.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc bloc = BlocProvider.of<UserBloc>(context);

    return SafeArea(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () {
              bloc.add(UsersLoadEvent());
            },
            child: const Icon(Icons.download),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              bloc.add(UsersClearEvent());
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
