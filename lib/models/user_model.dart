import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id, nama, email, hobi;
  final int saldo;

  UserModel({
    required this.id,
    required this.nama,
    required this.email,
    this.hobi = '',
    this.saldo = 0,
  });

  @override
  List<Object?> get props => [id, nama, email, hobi, saldo];
}
