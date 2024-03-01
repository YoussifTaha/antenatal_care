import 'package:equatable/equatable.dart';

import 'abdomen.dart';
import 'breast.dart';
import 'face.dart';
import 'lower_limbs.dart';
import 'neck.dart';

class InspectionModel extends Equatable {
  final Face? face;
  final Neck? neck;
  final Abdomen? abdomen;
  final LowerLimbs? lowerLimbs;
  final Breast? breast;

  const InspectionModel({
    this.face,
    this.neck,
    this.abdomen,
    this.lowerLimbs,
    this.breast,
  });

  factory InspectionModel.fromJson(Map<String, dynamic> json) {
    return InspectionModel(
      face: json['face'] == null
          ? null
          : Face.fromJson(json['face'] as Map<String, dynamic>),
      neck: json['neck'] == null
          ? null
          : Neck.fromJson(json['neck'] as Map<String, dynamic>),
      abdomen: json['abdomen'] == null
          ? null
          : Abdomen.fromJson(json['abdomen'] as Map<String, dynamic>),
      lowerLimbs: json['lowerLimbs'] == null
          ? null
          : LowerLimbs.fromJson(json['lowerLimbs'] as Map<String, dynamic>),
      breast: json['breast'] == null
          ? null
          : Breast.fromJson(json['breast'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'face': face?.toJson(),
        'neck': neck?.toJson(),
        'abdomen': abdomen?.toJson(),
        'lowerLimbs': lowerLimbs?.toJson(),
        'breast': breast?.toJson(),
      };

  @override
  List<Object?> get props => [face, neck, abdomen, lowerLimbs, breast];
}
