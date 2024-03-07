part of 'fetch_history_cubit.dart';

sealed class FetchHistoryState extends Equatable {
  const FetchHistoryState();

  @override
  List<Object> get props => [];
}

final class FetchHistoryInitial extends FetchHistoryState {}

final class FetchHistoryLoading extends FetchHistoryState {}

final class FetchDrugHistorySuccsses extends FetchHistoryState {
  final DrugHistoryModel drugHistoryModel;

  FetchDrugHistorySuccsses({required this.drugHistoryModel});
}

final class FetchFamilyHistorySuccsses extends FetchHistoryState {
  final FamilyHistoryModel familyHistoryModel;

  FetchFamilyHistorySuccsses({required this.familyHistoryModel});
}

final class FetchPersonalHistorySuccsses extends FetchHistoryState {
  final PersonalHistoryModel personalHistoryModel;

  FetchPersonalHistorySuccsses({required this.personalHistoryModel});
}

final class FetchMenstrualHistorySuccsses extends FetchHistoryState {
  final MenstrualHistoryModel menstrualHistoryModel;

  FetchMenstrualHistorySuccsses({required this.menstrualHistoryModel});
}

final class FetchObstetricHistorySuccsses extends FetchHistoryState {
  final ObstetricHistoryModel obstetricHistoryModel;

  FetchObstetricHistorySuccsses({required this.obstetricHistoryModel});
}

final class FetchPastHistorySuccsses extends FetchHistoryState {
  final PastHistoryModel pastHistoryModel;

  FetchPastHistorySuccsses({required this.pastHistoryModel});
}

final class FetchPresentHistorySuccsses extends FetchHistoryState {
  final PresentHistoryModel presentHistoryModel;

  FetchPresentHistorySuccsses({required this.presentHistoryModel});
}

final class FetchPsychologicalHistorySuccsses extends FetchHistoryState {
  final PsychologicalHistoryModel psychologicalHistoryModel;

  FetchPsychologicalHistorySuccsses({required this.psychologicalHistoryModel});
}

final class FetchUrinarySystemHistorySuccsses extends FetchHistoryState {
  final UrineSystemHistoryModel urineSystemHistoryModel;

  FetchUrinarySystemHistorySuccsses({required this.urineSystemHistoryModel});
}

final class FetchHistoryError extends FetchHistoryState {
  final String error;

  FetchHistoryError({required this.error});
}
