// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

///
///this is task model
///

// ignore: must_be_immutable
class Task extends Equatable {
  final String id;
  final String title;
  bool? isDone;
  bool? isDeleted;
  final String description;
  final DateTime created;

  Task({
    required this.id,
    required this.title,
    this.isDone,
    this.isDeleted,
    required this.description,
    required this.created,
  }) : super() {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? id,
    String? title,
    bool? isDone,
    bool? isDeleted,
    String? description,
    DateTime? created,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      description: description ?? this.description,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'description': description,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      description: map['description'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  @override
  List<Object?> get props =>
      [id, title, description, isDone, isDeleted, created];

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
