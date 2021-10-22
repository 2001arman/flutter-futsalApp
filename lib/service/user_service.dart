import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_futsalapp/models/user_model.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'nama': user.nama,
        'email': user.email,
        'hobi': user.hobi,
        'saldo': user.saldo,
      });
    } catch (e) {
      throw e;
    }
  }
}
