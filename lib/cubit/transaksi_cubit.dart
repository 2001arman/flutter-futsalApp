import 'package:bloc/bloc.dart';
import 'package:demo_futsalapp/models/transaksi_model.dart';
import 'package:demo_futsalapp/service/transaksi_service.dart';
import 'package:equatable/equatable.dart';

part 'transaksi_state.dart';

class TransaksiCubit extends Cubit<TransaksiState> {
  TransaksiCubit() : super(TransaksiInitial());

  void buatTransaksi(TransaksiModel transaksi) async {
    try {
      emit(TransaksiLoading());
      await TransaksiService().buatTransaksi(transaksi);
      emit(TransaksiSuccess([]));
    } catch (e) {
      emit(TransaksiFailed(e.toString()));
    }
  }

  void fetchTransaksi() async {
    try {
      emit(TransaksiLoading());
      List<TransaksiModel> transaksi =
          await TransaksiService().fetchTransaksi();
      print(transaksi);
      emit(TransaksiSuccess(transaksi));
    } catch (e) {
      emit(TransaksiFailed(e.toString()));
      print(e.toString());
    }
  }
}
