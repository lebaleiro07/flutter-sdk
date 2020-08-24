import '../../../utils/string_util.dart';
import '../base_model.dart';
import '../cursor.dart';

class CentralNotification implements BaseModel<CentralNotification> {
  String id;
  String title;
  String subtitle;
  String body;
  String idProfile;
  String idPost;
  String icon;
  String intent;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  bool unread;
  bool pinned;
  DateTime datetimeDelivered;
  Cursor cursor;

  CentralNotification({
    this.id,
    this.title,
    this.subtitle,
    this.body,
    this.idProfile,
    this.idPost,
    this.icon,
    this.intent,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.unread = false,
    this.pinned = false,
    this.datetimeDelivered,
  });

  CentralNotification.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    body = json['body'];
    idProfile = json['id_profile'];
    idPost = json['id_post'];
    icon = json['icon'];
    intent = json['intent'];
    datetimeCreated = DateTime.parse(json['datetime_created']);
    datetimeUpdated = DateTime.parse(json['datetime_updated']);
    unread = json['unread'] is bool
        ? json['unread']
        : (json['unread'] as String).toBool();
    pinned = json['pinned'] is bool
        ? json['pinned']
        : (json['pinned'] as String).toBool();
    datetimeDelivered = json['datetime_delivered'] == null
        ? null
        : DateTime.parse(json['datetime_delivered']);
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['body'] = this.body;
    data['id_profile'] = this.idProfile;
    data['id_post'] = this.idPost;
    data['icon'] = this.icon;
    data['intent'] = this.intent;
    data['datetime_created'] = this.datetimeCreated.toIso8601String();
    data['datetime_updated'] = this.datetimeUpdated.toIso8601String();
    data['unread'] = this.unread.toString();
    data['pinned'] = this.pinned.toString();
    data['datetime_delivered'] = this.datetimeDelivered == null
        ? null
        : this.datetimeDelivered.toIso8601String();

    return data;
  }
}
