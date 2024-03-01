import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String fullName;
  final String email;
  final String phone;
  final String uId;
  final String userType;
  final int patientId;

  const UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.uId,
    required this.userType,
    required this.patientId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json['fullName'],
        email: json['email'],
        phone: json['phone'],
        uId: json['uId'],
        userType: json['userType'],
        patientId: json['patientId'],
      );

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'uId': uId,
        'userType': userType,
        'patientId': patientId,
      };

  @override
  List<Object?> get props {
    return [
      fullName,
      email,
      phone,
      uId,
      userType,
      patientId,
    ];
  }
}
