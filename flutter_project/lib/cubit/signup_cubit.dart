import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());


//sign up method using users api
  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
    String? gender,
    String? level,
  }) async {}
}
