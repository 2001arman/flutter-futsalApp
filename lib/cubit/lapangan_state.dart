part of 'lapangan_cubit.dart';

abstract class LapanganState extends Equatable {
  const LapanganState();

  @override
  List<Object> get props => [];
}

class LapanganInitial extends LapanganState {}

class LapanganLoading extends LapanganState {}

class LapanganSuccess extends LapanganState {
  final List<LapanganModel> dataLapangan;
  LapanganSuccess(this.dataLapangan);

  @override
  List<Object> get props => [dataLapangan];
}

class LapanganFailed extends LapanganState {
  final String error;
  LapanganFailed(this.error);

  @override
  List<Object> get props => [error];
}
