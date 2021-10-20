import 'package:bloc/bloc.dart';

class FieldCubit extends Cubit<int> {
  FieldCubit() : super(0);

  void pilihLapangan(int nomor) {
    emit(nomor);
    print("Nomor lapangan yg dipilih $nomor");
  }
}
