import 'package:equatable/equatable.dart';

class Face extends Equatable {
  final String? expression;
  final String? color;
  final String? eyeLidsEdema;
  final String? lipsEdema;
  final String? cheeksEdema;

  const Face({
    this.expression,
    this.color,
    this.eyeLidsEdema,
    this.lipsEdema,
    this.cheeksEdema,
  });

  factory Face.fromJson(Map<String, dynamic> json) => Face(
        expression: json['expression'] as String?,
        color: json['color'] as String?,
        eyeLidsEdema: json['eyeLidsEdema'] as String?,
        lipsEdema: json['lipsEdema'] as String?,
        cheeksEdema: json['cheeksEdema'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'expression': expression,
        'color': color,
        'eyeLidsEdema': eyeLidsEdema,
        'lipsEdema': lipsEdema,
        'cheeksEdema': cheeksEdema,
      };

  @override
  List<Object?> get props {
    return [
      expression,
      color,
      eyeLidsEdema,
      lipsEdema,
      cheeksEdema,
    ];
  }
}
