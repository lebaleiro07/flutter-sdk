import '../../../utils/string_util.dart';

class SignUpRequest {
  String name;
  String password;
  String email;
  String phone;
  String deviceToken;
  int acceptedTerms;
  int acceptedPolicy;
  bool acceptedMarketing;

  SignUpRequest(
      {this.name,
      this.password,
      this.email,
      this.phone,
      this.deviceToken,
      this.acceptedTerms,
      this.acceptedPolicy,
      this.acceptedMarketing});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    deviceToken = json['device_token'];
    acceptedTerms = json['accepted_terms'];
    acceptedPolicy = json['accepted_policy'];
    acceptedMarketing = json['accepted_marketing'];
  }

  dynamic toJson() {
    final Map<String, dynamic> data = {};

    data['name'] = this.name;
    data['password'] = this.password.hash();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['device_token'] = this.deviceToken;
    data['accepted_terms'] = this.acceptedTerms.toString();
    data['accepted_policy'] = this.acceptedPolicy.toString();
    data['accepted_marketing'] = this.acceptedMarketing.toString();

    return data;
  }
}
