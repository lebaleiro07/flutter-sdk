import 'dart:convert';

import 'package:music_playce_sdk/core/api/models/users/user_privileges.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_quotas.model.dart';

class UserRoles {
  String idRole;
  String name;
  String type;
  UserPrivileges privileges;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  UserQuotas quotas;

  UserRoles({
    this.idRole,
    this.name,
    this.type,
    this.privileges,
    this.deleted,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.quotas,
  });

  factory UserRoles.fromJson(String str) => UserRoles.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserRoles.fromMap(Map<String, dynamic> json) => new UserRoles(
        idRole: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        type: json['type'],
        privileges: json["privileges"] == null
            ? null
            : UserPrivileges.fromMap(json["privileges"]),
        deleted: json["deleted"] == null ? null : json["deleted"],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": idRole == null ? null : idRole,
        "name": name == null ? null : name,
        "privileges": privileges == null ? null : privileges.toMap(),
        "type": type == null ? null : type,
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
      };
}
