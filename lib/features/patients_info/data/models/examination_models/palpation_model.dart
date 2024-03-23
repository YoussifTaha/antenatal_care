import 'package:equatable/equatable.dart';

class PalpationModel extends Equatable {
  final String fundusLevel;
  final String rectusDiastasis;
  final String edemaTest;

  const PalpationModel({
    required this.fundusLevel,
    required this.rectusDiastasis,
    required this.edemaTest,
  });

  factory PalpationModel.fromJson(Map<String, dynamic> json) => PalpationModel(
        fundusLevel: json['fundusLevel'],
        rectusDiastasis: json['rectusDiastasis'],
        edemaTest: json['edemaTest'],
      );

  Map<String, dynamic> toJson() => {
        'fundusLevel': fundusLevel,
        'rectusDiastasis': rectusDiastasis,
        'edemaTest': edemaTest,
      };

  @override
  List<Object?> get props {
    return [
      fundusLevel,
      rectusDiastasis,
      edemaTest,
    ];
  }
}
