import 'package:equatable/equatable.dart';

class Neck extends Equatable {
  final String? thyroid;
  final String? pulsatingVeins;

  const Neck({this.thyroid, this.pulsatingVeins});

  factory Neck.fromJson(Map<String, dynamic> json) => Neck(
        thyroid: json['thyroid'] as String?,
        pulsatingVeins: json['pulsatingVeins'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'thyroid': thyroid,
        'pulsatingVeins': pulsatingVeins,
      };

  @override
  List<Object?> get props => [thyroid, pulsatingVeins];
}
