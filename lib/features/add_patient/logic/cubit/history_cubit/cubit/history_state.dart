part of 'history_cubit.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {}

final class AddPatientHistoryLoadingState extends HistoryState {}

final class AddPatientHistorySuccsses extends HistoryState {}

final class AddPatientHistoryError extends HistoryState {
  final String error;

  AddPatientHistoryError({required this.error});
}
