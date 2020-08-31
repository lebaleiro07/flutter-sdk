class PollCreateResponse {
	String profileId;
	String postId;
	String question;
	bool isBinary;
	int votes1;
	int votes2;
	DateTime datetimeExpiration;
	Map meta;
	String option1;
	String option2;
	bool deleted;
	DateTime datetimeCreated;
	DateTime datetimeUpdated;
	String id;

	PollCreateResponse({this.profileId, this.postId, this.question, this.isBinary, this.votes1, this.votes2, this.datetimeExpiration, this.meta, this.option1, this.option2, this.deleted, this.datetimeCreated, this.datetimeUpdated, this.id});

	PollCreateResponse.fromJson(Map<String, dynamic> json) {
		profileId = json['id_profile'];
		postId = json['id_post'];
		question = json['question'];
		isBinary = json['is_binary'];
		votes1 = json['votes1'];
		votes2 = json['votes2'];
		datetimeExpiration = DateTime.parse(json['datetime_expiration']);
		meta = json['meta'];
		option1 = json['option1'];
		option2 = json['option2'];
		deleted = json['deleted'];
		datetimeCreated = DateTime.parse(json['datetime_created']);
		datetimeUpdated = DateTime.parse(json['datetime_updated']);
		id = json['_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id_profile'] = this.profileId;
		data['id_post'] = this.postId;
		data['question'] = this.question;
		data['is_binary'] = this.isBinary;
		data['votes1'] = this.votes1;
		data['votes2'] = this.votes2;
		data['datetime_expiration'] = this.datetimeExpiration;
		if (this.meta != null) {
      data['meta'] = this.meta;
    }
		data['option1'] = this.option1;
		data['option2'] = this.option2;
		data['deleted'] = this.deleted;
		data['datetime_created'] = this.datetimeCreated;
		data['datetime_updated'] = this.datetimeUpdated;
		return data;
	}
}