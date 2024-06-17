// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class Todos {
    final int? id;
    String? todo;
    bool? completed;
    final int? userId;

    Todos({
        this.id,
        this.todo,
        this.completed,
        this.userId,
    });

    factory Todos.fromRawJson(String str) => Todos.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Todos.fromJson(Map<String, dynamic> json) => Todos(
        id: json["id"] ?? 0,
        todo: json["todo"] ?? "",
        completed: json["completed"] ?? "",
        userId: json["userId"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "todo": todo ?? "",
        "completed": completed ?? "",
        "userId": userId ?? "",
    };
}
