import 'package:equatable/equatable.dart';

class IncontinenceModel extends Equatable {
  final String grade;
  final String? description;

  const IncontinenceModel({
    required this.grade,
    this.description,
  });

  factory IncontinenceModel.fromJson(Map<String, dynamic> json) =>
      IncontinenceModel(
        grade: json['grade'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'grade': grade,
        'description': description,
      };

  @override
  List<Object?> get props {
    return [
      grade,
      description,
    ];
  }
}
