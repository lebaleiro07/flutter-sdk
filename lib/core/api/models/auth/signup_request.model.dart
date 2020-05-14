class SignUpRequest {
  String name;
  String password;
  String email;
  String phone;
  String deviceToken;
  int acceptedTerms;
  int acceptedPolicy;
  bool acceptedMarketing;

  SignUpRequest({
    this.name,
    this.password,
    this.email,
    this.phone,
    this.deviceToken,
    this.acceptedTerms,
    this.acceptedPolicy,
    this.acceptedMarketing
  });

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['device_token'] = this.deviceToken;
    data['accepted_terms'] = this.acceptedTerms;
    data['accepted_policy'] = this.acceptedPolicy;
    data['accepted_marketing'] = this.acceptedMarketing;

    return data;
  }
}