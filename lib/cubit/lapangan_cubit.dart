import 'package:bloc/bloc.dart';
import 'package:demo_futsalapp/models/lapangan_model.dart';
import 'package:demo_futsalapp/service/lapangan_service.dart';
import 'package:equatable/equatable.dart';

part 'lapangan_state.dart';

class LapanganCubit extends Cubit<LapanganState> {
  LapanganCubit() : super(LapanganInitial());

  void fetchLapangan() async {
    try {
      emit(LapanganLoading());
      List<LapanganModel> dataLapangan =
          await LapanganService().fetchLapangan();
      emit(LapanganSuccess(dataLapangan));
    } catch (e) {
      emit(LapanganFailed(e.toString()));
    }
  }
}
