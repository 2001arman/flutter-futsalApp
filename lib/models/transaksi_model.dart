import 'package:demo_futsalapp/models/lapangan_model.dart';
import 'package:equatable/equatable.dart';

class TransaksiModel extends Equatable {
  final LapanganModel lapangan;
  final int nomor;

  TransaksiModel({
    required this.lapangan,
    required this.nomor,
  });

  @override
  List<Object?> get props => [lapangan, nomor];
}
