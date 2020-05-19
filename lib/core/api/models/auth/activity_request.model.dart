class ActivityRequest {
  String activityId;

  ActivityRequest({this.activityId});

  ActivityRequest.fromJson(Map<String, dynamic> json) {
    activityId = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.activityId;
    return data;
  }
}