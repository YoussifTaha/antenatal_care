import 'package:equatable/equatable.dart';

class PresentHistoryModel extends Equatable {
  final String onsetOfComplain;
  final String course;
  final String duration;
  final String dateOfAdmission;

  const PresentHistoryModel({
    required this.onsetOfComplain,
    required this.course,
    required this.duration,
    required this.dateOfAdmission,
  });

  factory PresentHistoryModel.fromJson(Map<String, dynamic> json) =>
      PresentHistoryModel(
        onsetOfComplain: json['onsetOfComplain'],
        course: json['course'],
        duration: json['duration'],
        dateOfAdmission: json['dateOfAdmission'],
      );

  Map<String, dynamic> toJson() => {
        'onsetOfComplain': onsetOfComplain,
        'course': course,
        'duration': duration,
        'dateOfAdmission': dateOfAdmission,
      };

  @override
  List<Object?> get props {
    return [
      onsetOfComplain,
      course,
      duration,
      dateOfAdmission,
    ];
  }
}
