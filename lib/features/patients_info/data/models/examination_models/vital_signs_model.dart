import 'package:equatable/equatable.dart';

class VitalSignsModel extends Equatable {
  final String bloodPressure;
  final String heartRate;
  final String pulseRate;
  final String respiratoryRate;

  const VitalSignsModel({
    required this.bloodPressure,
    required this.heartRate,
    required this.pulseRate,
    required this.respiratoryRate,
  });

  factory VitalSignsModel.fromJson(Map<String, dynamic> json) =>
      VitalSignsModel(
        bloodPressure: json['bloodPressure'],
        heartRate: json['heartRate'],
        pulseRate: json['pulseRate'],
        respiratoryRate: json['respiratoryRate'],
      );

  Map<String, dynamic> toJson() => {
        'bloodPressure': bloodPressure,
        'heartRate': heartRate,
        'pulseRate': pulseRate,
        'respiratoryRate': respiratoryRate,
      };

  @override
  List<Object?> get props {
    return [
      bloodPressure,
      heartRate,
      pulseRate,
      respiratoryRate,
    ];
  }
}
