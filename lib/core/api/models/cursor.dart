import 'dart:convert';

class Cursor {
  String previous;
  String next;
  String route;

  Cursor({
    this.previous,
    this.next,
    this.route,
  });

  factory Cursor.fromJson(String str) => Cursor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cursor.fromMap(Map<String, dynamic> json) => new Cursor(
        previous: json["previous"] == null ? null : json["previous"],
        next: json["next"] == null ? null : json["next"],
        route: json["route"] == null ? null : json["route"],
      );

  Map<String, dynamic> toMap() => {
        "previous": previous == null ? null : previous,
        "next": next == null ? null : next,
        "route": route == null? null : route,
      };
}

class DataWithCursor<T> {
  final List<T> data;
  final Cursor cursor;
  
  const DataWithCursor({
    this.data,
    this.cursor
  });
}