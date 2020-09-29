class UploadEvent {
  String id;
  String userId;
  DateTime dateCreated;
  String plan;
  bool published;

  UploadEvent({
    this.id,
    this.userId,
    this.dateCreated,
    this.plan,
    this.published
  });

  UploadEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    dateCreated = json['date_created'];
    plan = json['plan'];
    published = json['published'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['date_created'] = this.dateCreated.toIso8601String();
    data['plan'] = this.plan;
    data['published'] = this.published;
    return data;
  }
}
