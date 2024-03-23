import 'package:equatable/equatable.dart';

class Breast extends Equatable {
  final String? size;
  final String? skinTemp;
  final String? primaryAreola;
  final String? secondryAreola;

  const Breast({
    this.size,
    this.skinTemp,
    this.primaryAreola,
    this.secondryAreola,
  });

  factory Breast.fromJson(Map<String, dynamic> json) => Breast(
        size: json['size'] as String?,
        skinTemp: json['skinTemp'] as String?,
        primaryAreola: json['primaryAreola'] as String?,
        secondryAreola: json['secondryAreola'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'size': size,
        'skinTemp': skinTemp,
        'primaryAreola': primaryAreola,
        'secondryAreola': secondryAreola,
      };

  @override
  List<Object?> get props {
    return [
      size,
      skinTemp,
      primaryAreola,
      secondryAreola,
    ];
  }
}
