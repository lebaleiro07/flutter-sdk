import '../../../../utils/string_util.dart';

class SignUpRequest {
  String name;
  String username;
  String email;
  String password;
  String phone;
  bool acceptedTerms;
  bool acceptedPolicy;

  SignUpRequest(
      {this.name,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.acceptedTerms = true,
      this.acceptedPolicy = true});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? json['name'] : null;
    username = json['username'] != null ? json['username'] : null;
    email = json['email'] != null ? json['email'] : null;
    password = json['password'] != null ? json['password'] : null;
    phone = json['phone'] != null ? json['phone'] : null;
    acceptedTerms = json['acceptedTerms'] is bool ? json['acceptedTerms'] : (json['acceptedTerms'] as String).toBool();
    acceptedPolicy = json['acceptedPolicy'] is bool ? json['acceptedPolicy'] : (json['acceptedPolicy'] as String).toBool();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['accepted_terms'] = this.acceptedTerms;
    data['accepted_policy'] = this.acceptedPolicy;
    return data;
  }
}
