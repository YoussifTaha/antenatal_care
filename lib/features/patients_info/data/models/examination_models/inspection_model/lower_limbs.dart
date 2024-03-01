import 'package:equatable/equatable.dart';

class LowerLimbs extends Equatable {
  final String? deformity;
  final String? varicoseVenis;
  final String? oedema;

  const LowerLimbs({this.deformity, this.varicoseVenis, this.oedema});

  factory LowerLimbs.fromJson(Map<String, dynamic> json) => LowerLimbs(
        deformity: json['deformity'] as String?,
        varicoseVenis: json['varicoseVenis'] as String?,
        oedema: json['oedema'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'deformity': deformity,
        'varicoseVenis': varicoseVenis,
        'oedema': oedema,
      };

  @override
  List<Object?> get props => [deformity, varicoseVenis, oedema];
}
