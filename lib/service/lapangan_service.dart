import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_futsalapp/models/lapangan_model.dart';

class LapanganService {
  CollectionReference _lapanganRef =
      FirebaseFirestore.instance.collection('lapangan');

  Future<List<LapanganModel>> fetchLapangan() async {
    try {
      QuerySnapshot hasil = await _lapanganRef.get();

      List<LapanganModel> dataLapangan = hasil.docs.map((e) {
        return LapanganModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return dataLapangan;
    } catch (e) {
      throw e;
    }
  }
}
