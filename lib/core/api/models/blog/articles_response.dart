class ArticlesResponse {
  String id;
  String title;
  String idUser;
  DateTime publishDate;
  int readTime;
  String category;
  int feedback;
  int likesQuantity;
  int commentsQuantity;
  int readQuantity;
  List<String> content;
  List<String> tags;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;

  ArticlesResponse(
      {this.id,
      this.title,
      this.idUser,
      this.publishDate,
      this.readTime,
      this.category,
      this.feedback,
      this.likesQuantity,
      this.commentsQuantity,
      this.readQuantity,
      this.content,
      this.tags,
      this.deleted,
      this.datetimeCreated,
      this.datetimeUpdated});

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "idUser": idUser,
      "publishDate": publishDate,
      "readTime": readTime,
      "category": category,
      "feedback": feedback,
      "likesQuantity": likesQuantity,
      "commentsQuantity": commentsQuantity,
      "readQuantity": readQuantity,
      "content": content,
      "tags": tags,
      "deleted": deleted,
      "datetimeCreated": datetimeCreated,
      "datetimeUpdated": datetimeUpdated
    };
  }

  factory ArticlesResponse.fromJSON(dynamic data) {
    return ArticlesResponse(
      id: data['_id'],
      title: data['title'],
      idUser: data['id_user'],
      publishDate: data['publish_date'],
      readTime: data['read_time'],
      category: data['category'],
      feedback: data['feedback'],
      likesQuantity: data['likes_quantity'],
      commentsQuantity: data['comments_quantity'],
      readQuantity: data['read_quantity'],
      content: data['content'],
      tags: data['tags'],
      deleted: data['deleted'],
      datetimeCreated: data['datetime_created'],
      datetimeUpdated: data['datetime_updated'],
    );
  }
}
