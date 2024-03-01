import 'package:equatable/equatable.dart';

class PersonalHistoryModel extends Equatable {
  final String parityCount;
  final String maritalStatus;
  final String mariageDuration;
  final String smoking;
  final String alchohol;

  const PersonalHistoryModel({
    required this.parityCount,
    required this.maritalStatus,
    required this.mariageDuration,
    required this.smoking,
    required this.alchohol,
  });

  factory PersonalHistoryModel.fromJson(Map<String, dynamic> json) =>
      PersonalHistoryModel(
        parityCount: json['parityCount'],
        maritalStatus: json['maritalStatus'],
        mariageDuration: json['mariageDuration'],
        smoking: json['smoking'],
        alchohol: json['alchohol'],
      );

  Map<String, dynamic> toJson() => {
        'parityCount': parityCount,
        'maritalStatus': maritalStatus,
        'mariageDuration': mariageDuration,
        'smoking': smoking,
        'alchohol': alchohol,
      };

  @override
  List<Object?> get props {
    return [
      parityCount,
      maritalStatus,
      mariageDuration,
      smoking,
      alchohol,
    ];
  }
}
