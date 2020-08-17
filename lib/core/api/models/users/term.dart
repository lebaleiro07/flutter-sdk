class Term {
  String id;
  String name;
  String description;
  String body;
  int version;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;

  Term(
      {this.id,
      this.name,
      this.description,
      this.body,
      this.version,
      this.datetimeCreated,
      this.datetimeUpdated});

  Term.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    body = json['body'];
    version = json['version'];
    datetimeCreated = DateTime.parse(json['datetime_created']);
    datetimeUpdated = DateTime.parse(json['datetime_updated']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['body'] = this.body;
    data['version'] = this.version;
    data['datetime_created'] = this.datetimeCreated;
    data['datetime_updated'] = this.datetimeUpdated;
    return data;
  }
}
