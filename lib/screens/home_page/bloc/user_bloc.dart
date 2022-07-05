import 'package:bloc/bloc.dart';
import 'package:weather_forecast/models/user_model.dart';
import 'package:weather_forecast/models/users_address_model.dart';
import 'package:weather_forecast/repository/repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UsersLoadEvent>(
      (event, emit) async {
        emit(UserLoadingState());

        try {
          final List<Users> loadedUserList = await userRepository.getAllUsers();
          final List<UsersAddress> loadedAddressList =
              await userRepository.getAllAddress();
          emit(UserLoadedState(
            loadedUsers: loadedUserList,
            loadedAddress: loadedAddressList,
          ));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );
    on<UsersClearEvent>(
      (event, emit) async {
        emit(UserEmptyState());
      },
    );
  }
}
