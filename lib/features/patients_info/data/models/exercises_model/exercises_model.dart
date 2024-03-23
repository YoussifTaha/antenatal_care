import 'package:equatable/equatable.dart';

class ExercisesModel extends Equatable {
  final String? name;
  final String? thumbnail;
  final String? videoUrl;
  final String? description;

  const ExercisesModel({
    this.name,
    this.thumbnail,
    this.videoUrl,
    this.description,
  });

  factory ExercisesModel.fromJson(Map<String, dynamic> json) => ExercisesModel(
        name: json['name'] as String?,
        thumbnail: json['thumbnail'] as String?,
        videoUrl: json['videoUrl'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'thumbnail': thumbnail,
        'videoUrl': videoUrl,
        'description': description,
      };

  @override
  List<Object?> get props {
    return [
      name,
      thumbnail,
      videoUrl,
      description,
    ];
  }
}
