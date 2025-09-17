class ExerciseModel {
  final String name;
  final String description;
  final List<String> bodyParts;
  final List<String> equipment;
  final List<String> steps;
  final List<String> warnings;
  final String? photo;

  ExerciseModel({
    this.name = '',
    this.description = '',
    this.bodyParts = const [],
    this.equipment = const [],
    this.steps = const [],
    this.warnings = const [],
    this.photo,
  });

  ExerciseModel copyWith({
    String? name,
    String? description,
    List<String>? bodyParts,
    List<String>? equipment,
    List<String>? steps,
    List<String>? warnings,
    String? photo,
  }) {
    return ExerciseModel(
      name: name ?? this.name,
      description: description ?? this.description,
      bodyParts: bodyParts ?? this.bodyParts,
      equipment: equipment ?? this.equipment,
      steps: steps ?? this.steps,
      warnings: warnings ?? this.warnings,
      photo: photo ?? this.photo,
    );
  }
}
