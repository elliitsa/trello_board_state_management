import 'package:flutter/cupertino.dart';

import 'card_entity.dart';

@immutable
class BoardColumnEntity {
  final int id;
  final String title;
  final List<CardEntity> cards;

  const BoardColumnEntity({
    required this.id,
    required this.title,
    required this.cards,
  });
}
