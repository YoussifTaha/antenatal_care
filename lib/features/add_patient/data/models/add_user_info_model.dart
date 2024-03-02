import 'package:equatable/equatable.dart';

class UserInfoModel extends Equatable {
  final String chiefComplain;
  final String eDD;
  final String weekNumber;

  const UserInfoModel({
    required this.chiefComplain,
    required this.eDD,
    required this.weekNumber,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        chiefComplain: json['chiefComplain'],
        eDD: json['eDD'],
        weekNumber: json['weekNumber'],
      );

  Map<String, dynamic> toJson() => {
        'chiefComplain': chiefComplain,
        'eDD': eDD,
        'weekNumber': weekNumber,
      };

  @override
  List<Object?> get props {
    return [
      chiefComplain,
      eDD,
      weekNumber,
    ];
  }
}
