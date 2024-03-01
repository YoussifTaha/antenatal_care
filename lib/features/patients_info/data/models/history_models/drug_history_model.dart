import 'package:equatable/equatable.dart';

class DrugHistoryModel extends Equatable {
  final String antiemetics;
  final String antacids;
  final String antihistamines;
  final String analgesics;
  final String antimicrobials;
  final String diuretics;
  final String antidepressants;
  final String tranquilizers;

  const DrugHistoryModel({
    required this.antiemetics,
    required this.antacids,
    required this.antihistamines,
    required this.analgesics,
    required this.antimicrobials,
    required this.diuretics,
    required this.antidepressants,
    required this.tranquilizers,
  });

  factory DrugHistoryModel.fromJson(Map<String, dynamic> json) =>
      DrugHistoryModel(
        antiemetics: json['antiemetics'],
        antacids: json['antacids'],
        antihistamines: json['antihistamines'],
        analgesics: json['analgesics'],
        antimicrobials: json['antimicrobials'],
        diuretics: json['diuretics'],
        antidepressants: json['antidepressants'],
        tranquilizers: json['tranquilizers'],
      );

  Map<String, dynamic> toJson() => {
        'antiemetics': antiemetics,
        'antacids': antacids,
        'antihistamines': antihistamines,
        'analgesics': analgesics,
        'antimicrobials': antimicrobials,
        'diuretics': diuretics,
        'antidepressants': antidepressants,
        'tranquilizers': tranquilizers,
      };

  @override
  List<Object?> get props {
    return [
      antiemetics,
      antacids,
      antihistamines,
      analgesics,
      antimicrobials,
      diuretics,
      antidepressants,
      tranquilizers,
    ];
  }
}
