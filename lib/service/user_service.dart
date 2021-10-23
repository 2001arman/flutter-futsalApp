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

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        nama: snapshot['nama'],
        email: snapshot['email'],
        hobi: snapshot['hobi'],
        saldo: snapshot['saldo'],
      );
    } catch (e) {
      throw e;
    }
  }
}
