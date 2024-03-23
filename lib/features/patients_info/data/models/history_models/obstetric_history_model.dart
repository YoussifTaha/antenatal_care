import 'package:equatable/equatable.dart';

class ObstetricHistoryModel extends Equatable {
  final String fullTermPregnancy;
  final String gravidity;
  final String previousAbortion;
  final String previousLivingChildren;
  final String previousPrematurePregnancy;

  const ObstetricHistoryModel({
    required this.fullTermPregnancy,
    required this.gravidity,
    required this.previousAbortion,
    required this.previousLivingChildren,
    required this.previousPrematurePregnancy,
  });

  factory ObstetricHistoryModel.fromJson(Map<String, dynamic> json) =>
      ObstetricHistoryModel(
        fullTermPregnancy: json['fullTermPregnancy'],
        gravidity: json['gravidity'],
        previousAbortion: json['previousAbortion'],
        previousLivingChildren: json['previousLivingChildren'],
        previousPrematurePregnancy: json['previousPrematurePregnancy'],
      );

  Map<String, dynamic> toJson() => {
        'fullTermPregnancy': fullTermPregnancy,
        'gravidity': gravidity,
        'previousAbortion': previousAbortion,
        'previousLivingChildren': previousLivingChildren,
        'previousPrematurePregnancy': previousPrematurePregnancy,
      };

  @override
  List<Object?> get props {
    return [
      fullTermPregnancy,
      gravidity,
      previousAbortion,
      previousLivingChildren,
      previousPrematurePregnancy,
    ];
  }
}
