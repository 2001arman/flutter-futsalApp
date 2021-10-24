import 'package:equatable/equatable.dart';

class LapanganModel extends Equatable {
  final String id;
  final String nama;
  final String jenis;
  final String imageUrl;
  final String deskripsi;
  final double rating;
  final int harga;

  LapanganModel({
    required this.id,
    this.nama = '',
    this.jenis = '',
    this.imageUrl = '',
    this.deskripsi = '',
    this.rating = 0.0,
    this.harga = 0,
  });

  factory LapanganModel.fromJson(String id, Map<String, dynamic> json) =>
      LapanganModel(
        id: id,
        nama: json['nama'],
        imageUrl: json['imageUrl'],
        jenis: json['jenis'],
        deskripsi: json['deskripsi'],
        rating: json['rating'],
        harga: json['harga'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'imageUrl': imageUrl,
        'jenis': jenis,
        'deskripsi': deskripsi,
        'rating': rating,
        'harga': harga,
      };

  @override
  List<Object?> get props => [id, nama, imageUrl, jenis, rating, harga];
}
