class PollQuestion {
  String idPost;
  String question;
  String option1;
  String option2;
  bool isBinary;

  PollQuestion(
      {this.idPost, this.question, this.option1, this.option2, this.isBinary});

  PollQuestion.fromJson(Map<String, dynamic> json) {
    idPost = json['id_post'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    isBinary = json['is_binary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_post'] = this.idPost;
    data['question'] = this.question;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['is_binary'] = this.isBinary;
    return data;
  }
}
