part of 'transaksi_cubit.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();

  @override
  List<Object> get props => [];
}

class TransaksiInitial extends TransaksiState {}

class TransaksiLoading extends TransaksiState {}

class TransaksiFailed extends TransaksiState {
  final String error;

  TransaksiFailed(this.error);

  @override
  List<Object> get props => [error];
}

class TransaksiSuccess extends TransaksiState {
  final List<TransaksiModel> transaksi;

  TransaksiSuccess(this.transaksi);

  @override
  List<Object> get props => [transaksi];
}
