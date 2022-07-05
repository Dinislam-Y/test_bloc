import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/screens/home_page/bloc/user_bloc.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Users is Loaded')));
        }
      }),
      builder: (context, state) {
        if (state is UserEmptyState) {
          return const Center(
            child: Text(
              'Нужно загузить данные',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.loadedUsers.length,
            itemBuilder: (context, index) {
              final _user = state.loadedUsers[index];

              return ListTile(
                title: Column(
                  children: [
                    Text('${_user.name} ${_user.username}'),
                  ],
                ),
                subtitle: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: _user.username.toString(),
                      ),
                      TextSpan(
                        text: 'is a domesticated carnivore ',
                      ),
                      TextSpan(
                        text: 'of the family Canidae.',
                      ),
                    ],
                  ),
                ),
                leading: Column(
                  children: [
                    Text(_user.id.toString()),
                    Icon(Icons.person),
                  ],
                ),
              );
            },
          );
        }
        if (state is UserErrorState) {
          return const Center(
            child: Text(
              'Ошибка при загрузке данных',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
