import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String description;
  String? begin;
  String? end;
  String? alert;
  final String id;
  bool? isDone;
  bool? isDeleted;
  Task({
    required this.title,
    required this.description,
    this.begin,
    this.end,
    this.alert,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    begin = begin ?? "";
    end = end ?? "";
    alert = alert ?? "";
  }

  Task copyWith({
    String? title,
    String? id,
    String? begin,
    String? end,
    String? alert,
    bool? isDone,
    bool? isDeleted,
    String? description,
  }) {
    return Task(
        title: title ?? this.title,
        id: id ?? this.id,
        begin: begin ?? this.begin,
        end: end ?? this.end,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
        description: description ?? '',
        alert: alert ?? this.alert);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'id': id});
    result.addAll({'begin': begin});
    result.addAll({'end': end});
    result.addAll({'alert': alert});
    result.addAll({'description': description});

    if (isDone != null) {
      result.addAll({'isDone': isDone});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }

    return result;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        title: map['title'] ?? '',
        id: map['id'] ?? '',
        isDone: map['isDone'],
        isDeleted: map['isDeleted'],
        begin: map['begin'],
        end: map['end'],
        alert: map['alert'],
        description: map['description']);
  }

  @override
  List<Object> get props =>
      [title, id, isDone!, isDeleted!, begin!, end!, alert!];
}
