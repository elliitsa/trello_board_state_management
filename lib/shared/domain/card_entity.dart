import 'package:flutter/cupertino.dart';

@immutable
class CardEntity {
  final int id;
  final String title;
  // TODO do I need description?
  final String description;

  const CardEntity({
    required this.id,
    required this.title,
    required this.description,
  });

  CardEntity copyWith({
    String? title,
    String? description,
  }) {
    return CardEntity(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
