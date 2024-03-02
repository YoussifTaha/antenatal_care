import 'package:equatable/equatable.dart';

class InspectionModel extends Equatable {
  final Map<String, String>? face;
  final Map<String, String>? neck;
  final Map<String, String>? abdomen;
  final Map<String, String>? lowerLimbs;
  final Map<String, String>? breast;

  const InspectionModel({
    this.face,
    this.neck,
    this.abdomen,
    this.lowerLimbs,
    this.breast,
  });

  factory InspectionModel.fromJson(Map<String, dynamic> json) {
    return InspectionModel(
      face: (json['face'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
      neck: (json['neck'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
      abdomen: (json['abdomen'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
      lowerLimbs: (json['lowerLimbs'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
      breast: (json['breast'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
    );
  }

  Map<String, dynamic> toJson() => {
        'face': face,
        'neck': neck,
        'abdomen': abdomen,
        'lowerLimbs': lowerLimbs,
        'breast': breast,
      };

  @override
  List<Object?> get props => [face, neck, abdomen, lowerLimbs, breast];
}
