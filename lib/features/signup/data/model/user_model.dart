import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String fullName;
  final String email;
  final String phone;
  final String uId;
  final String userType;
  final String? chiefComplain;
  final String? age;
  final String? occupation;
  final String? eDD;
  final String? weekNumber;

  const UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.uId,
    required this.userType,
    this.chiefComplain,
    this.age,
    this.occupation,
    this.eDD,
    this.weekNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json['fullName'],
        email: json['email'],
        phone: json['phone'],
        uId: json['uId'],
        userType: json['userType'],
        chiefComplain: json['chiefComplain'] as String?,
        age: json['age'] as String?,
        occupation: json['occupation'] as String?,
        eDD: json['eDD'] as String?,
        weekNumber: json['weekNumber'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'uId': uId,
        'userType': userType,
        'chiefComplain': chiefComplain,
        'age': age,
        'occupation': occupation,
        'eDD': eDD,
        'weekNumber': weekNumber,
      };

  @override
  List<Object?> get props {
    return [
      fullName,
      email,
      phone,
      uId,
      userType,
      chiefComplain,
      age,
      occupation,
      eDD,
      weekNumber,
    ];
  }
}
