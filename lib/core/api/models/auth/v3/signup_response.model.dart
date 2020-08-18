class SignUpResponse {
  String id;
  String userId;
  String name;
  String email;
  String username;
  String phone;
  String datetimeCreated;
  String datetimeUpdated;

  SignUpResponse(
      {this.id,
      this.userId,
      this.name,
      this.email,
      this.username,
      this.phone,
      this.datetimeCreated,
      this.datetimeUpdated});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['id_user'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    datetimeCreated = json['datetime_created'];
    datetimeUpdated = json['datetime_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['id_user'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['datetime_created'] = this.datetimeCreated;
    data['datetime_updated'] = this.datetimeUpdated;
    return data;
  }
}
