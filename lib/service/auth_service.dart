import 'package:demo_futsalapp/models/user_model.dart';
import 'package:demo_futsalapp/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp(
      {required String nama,
      required String email,
      required String password,
      String hobi = ''}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          nama: nama,
          email: email,
          hobi: hobi,
          saldo: 500000);

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }
}
