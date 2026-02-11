import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import 'card_entity.dart';

@immutable
class BoardColumnEntity extends Equatable {
  BoardColumnEntity({
    required this.id,
    required this.title,
    required List<CardEntity>? cards,
  }) : cards = List<CardEntity>.unmodifiable(cards ?? const []);

  final String id;
  final String? title;
  final List<CardEntity>? cards;

  @override
  List<Object?> get props => [id, title, cards];

  BoardColumnEntity copyWith({
    String? id,
    String? title,
    List<CardEntity>? cards,
  }) {
    return BoardColumnEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      cards: cards ?? this.cards,
    );
  }
}
