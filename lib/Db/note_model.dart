import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel with ChangeNotifier {
  @HiveField(0)
  int? noteKey;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? content;
  @HiveField(3)
  DateTime? date;

  NoteModel({
    this.title,
    this.content,
    this.date,
    this.noteKey,
  });
}
