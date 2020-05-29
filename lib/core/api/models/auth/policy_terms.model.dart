class PolicyTerms {
  int acceptedTerms;
  int acceptedPolicy;

  PolicyTerms({this.acceptedTerms, this.acceptedPolicy});

  PolicyTerms.fromJson(Map<String, dynamic> json) {
    acceptedTerms = json['accepted_terms'];
    acceptedPolicy = json['accepted_policy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accepted_terms'] = this.acceptedTerms.toString();
    data['accepted_policy'] = this.acceptedPolicy.toString();
    return data;
  }
}
