import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_final_project/features/auth/auth_service.dart';
import 'package:mobile_final_project/features/auth/data/models/user.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthService authService;

  SignupCubit(this.authService) : super(SignupInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    String? gender,
    double latitude = 0,
    double longitude = 0,
    int level = 1,
  }) async {
    emit(SignupLoading());
    try {
      final user = await authService.signup(
        name: name,
        email: email,
        password: password,
        gender: gender,
        latitude: latitude,
        longitude: longitude,
        level: level,
      );
      emit(SignupSuccess(user));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}