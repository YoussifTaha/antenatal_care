import 'package:equatable/equatable.dart';

class PsychologicalHistoryModel extends Equatable {
  final String emotions;
  final String anxiety;
  final String stress;

  const PsychologicalHistoryModel({
    required this.emotions,
    required this.anxiety,
    required this.stress,
  });

  factory PsychologicalHistoryModel.fromJson(Map<String, dynamic> json) =>
      PsychologicalHistoryModel(
        emotions: json['emotions'],
        anxiety: json['anxiety'],
        stress: json['stress'],
      );

  Map<String, dynamic> toJson() => {
        'emotions': emotions,
        'anxiety': anxiety,
        'stress': stress,
      };

  @override
  List<Object?> get props {
    return [
      emotions,
      anxiety,
      stress,
    ];
  }
}
