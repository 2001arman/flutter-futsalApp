import 'package:demo_futsalapp/models/lapangan_model.dart';
import 'package:equatable/equatable.dart';

class TransaksiModel extends Equatable {
  final LapanganModel lapangan;
  final int nomor;
  final String id;

  TransaksiModel({
    required this.lapangan,
    required this.nomor,
    this.id = '',
  });

  factory TransaksiModel.fromJson(String id, Map<String, dynamic> json) =>
      TransaksiModel(
        lapangan:
            LapanganModel.fromJson(json['lapangan']['id'], json['lapangan']),
        id: id,
        nomor: json['nomor'],
      );

  @override
  List<Object?> get props => [lapangan, nomor];
}
