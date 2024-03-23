import 'package:equatable/equatable.dart';

class PastHistoryModel extends Equatable {
  final String diseases;
  final String operations;
  final String trauma;

  const PastHistoryModel({
    required this.diseases,
    required this.operations,
    required this.trauma,
  });

  factory PastHistoryModel.fromJson(Map<String, dynamic> json) =>
      PastHistoryModel(
        diseases: json['diseases'],
        operations: json['operations'],
        trauma: json['trauma'],
      );

  Map<String, dynamic> toJson() => {
        'diseases': diseases,
        'operations': operations,
        'trauma': trauma,
      };

  @override
  List<Object?> get props {
    return [
      diseases,
      operations,
      trauma,
    ];
  }
}
