import 'package:equatable/equatable.dart';

class MenstrualHistoryModel extends Equatable {
  final String menarche;
  final String frequency;
  final String regularity;
  final String duration;

  const MenstrualHistoryModel({
    required this.menarche,
    required this.frequency,
    required this.regularity,
    required this.duration,
  });

  factory MenstrualHistoryModel.fromJson(Map<String, dynamic> json) =>
      MenstrualHistoryModel(
        menarche: json['menarche'],
        frequency: json['frequency'],
        regularity: json['regularity'],
        duration: json['duration'],
      );

  Map<String, dynamic> toJson() => {
        'menarche': menarche,
        'frequency': frequency,
        'regularity': regularity,
        'duration': duration,
      };

  @override
  List<Object?> get props {
    return [
      menarche,
      frequency,
      regularity,
      duration,
    ];
  }
}
