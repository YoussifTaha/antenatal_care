import 'package:equatable/equatable.dart';

class UrineSystemHistoryModel extends Equatable {
  final String burning;
  final String retention;
  final String polyuria;
  final String dribbling;
  final String feeling;

  const UrineSystemHistoryModel({
    required this.burning,
    required this.retention,
    required this.polyuria,
    required this.dribbling,
    required this.feeling,
  });

  factory UrineSystemHistoryModel.fromJson(Map<String, dynamic> json) =>
      UrineSystemHistoryModel(
        burning: json['burning'],
        retention: json['retention'],
        polyuria: json['polyuria'],
        dribbling: json['dribbling'],
        feeling: json['feeling'],
      );

  Map<String, dynamic> toJson() => {
        'burning': burning,
        'retention': retention,
        'polyuria': polyuria,
        'dribbling': dribbling,
        'feeling': feeling,
      };

  @override
  List<Object?> get props {
    return [
      burning,
      retention,
      polyuria,
      dribbling,
      feeling,
    ];
  }
}
