class PollCreationEvent {
  String userId;
  String postId;
  String question;
  String option1;
  String option2;
  String binary;

  PollCreationEvent({
    this.userId,
    this.question,
    this.option1,
    this.option2,
    this.postId,
    this.binary
  });

  PollCreationEvent.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    postId = json['id_post'];
    binary = json['is_binary'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['question'] = question != null ? this.question : null;
    data['option1'] = option1 != null ? this.option1 : null;
    data['option2'] = option2 != null ? this.option2 : null;
    data['id_post'] = postId != null ? this.postId : null;
    data['is_binary'] = binary != null ? this.binary : null;
    return data;
  }
}
