class ActivityResponse {
  String activityId;

  ActivityResponse({this.activityId});

  ActivityResponse.fromJson(Map<String, dynamic> json) {
    activityId = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.activityId;
    return data;
  }
}
