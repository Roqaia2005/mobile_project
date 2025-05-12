import 'package:bloc/bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // login method using users api
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {}
}
