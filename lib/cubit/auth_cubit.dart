import 'package:bloc/bloc.dart';
import 'package:demo_futsalapp/models/user_model.dart';
import 'package:demo_futsalapp/service/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp(
      {required String nama,
      required String email,
      required String password,
      String hobi = ''}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService()
          .signUp(nama: nama, email: email, password: password, hobi: hobi);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
