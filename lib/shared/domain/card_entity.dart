import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CardEntity extends Equatable {
  final int id;
  final String title;
  // TODO do I need description?
  final String description;

  const CardEntity({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [id, title, description];
}
