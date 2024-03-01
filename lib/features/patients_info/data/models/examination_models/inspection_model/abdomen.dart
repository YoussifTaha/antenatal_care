import 'package:equatable/equatable.dart';

class Abdomen extends Equatable {
  final String? lineaNigra;
  final String? stretchMarks;
  final String? scar;

  const Abdomen({this.lineaNigra, this.stretchMarks, this.scar});

  factory Abdomen.fromJson(Map<String, dynamic> json) => Abdomen(
        lineaNigra: json['lineaNigra'] as String?,
        stretchMarks: json['stretchMarks'] as String?,
        scar: json['scar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'lineaNigra': lineaNigra,
        'stretchMarks': stretchMarks,
        'scar': scar,
      };

  @override
  List<Object?> get props => [lineaNigra, stretchMarks, scar];
}
