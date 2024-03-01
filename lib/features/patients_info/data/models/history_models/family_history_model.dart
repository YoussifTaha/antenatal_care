import 'package:equatable/equatable.dart';

class FamilyHistoryModel extends Equatable {
  final String certainDisases;
  final String consanguinityMarriage;
  final String historyOfTwins;

  const FamilyHistoryModel({
    required this.certainDisases,
    required this.consanguinityMarriage,
    required this.historyOfTwins,
  });

  factory FamilyHistoryModel.fromJson(Map<String, dynamic> json) =>
      FamilyHistoryModel(
        certainDisases: json['certainDisases'],
        consanguinityMarriage: json['consanguinityMarriage'],
        historyOfTwins: json['historyOfTwins'],
      );

  Map<String, dynamic> toJson() => {
        'certainDisases': certainDisases,
        'consanguinityMarriage': consanguinityMarriage,
        'historyOfTwins': historyOfTwins,
      };

  @override
  List<Object?> get props {
    return [
      certainDisases,
      consanguinityMarriage,
      historyOfTwins,
    ];
  }
}
