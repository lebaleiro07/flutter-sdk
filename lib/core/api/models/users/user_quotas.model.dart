class UserQuotas {
  int dailyUploads;
  int monthlyUploads;
  int weeklyUploads;
  int dashArtistList;
  int dashSongwriterList;
  int dashQuizList;
  int dashPoolList;
  int monthlyPolls;
  int monthlyQuizzes;

  UserQuotas({
    this.dailyUploads,
    this.monthlyUploads,
    this.weeklyUploads,
    this.dashArtistList,
    this.dashSongwriterList,
    this.dashQuizList,
    this.dashPoolList,
    this.monthlyPolls,
    this.monthlyQuizzes,
  });

  Map<String, dynamic> toJson() {
    return {
      "DAILY_UPLOADS": dailyUploads,
      "MONTHLY_UPLOADS": monthlyUploads,
      "WEEKLY_UPLOADS": weeklyUploads,
      "DASH_ARTIST_LIST": dashArtistList,
      "DASH_POLL_LIST": dashPoolList,
      "DASH_QUIZ_LIST": dashQuizList,
      "DASH_SONGWRITER_LIST": dashSongwriterList,
      "MONTHLY_POLLS": monthlyPolls,
      "MONTHLY_QUIZZES": monthlyQuizzes,
    };
  }

  factory UserQuotas.fromJson(dynamic data) {
    return UserQuotas(
      dailyUploads: data['DAILY_UPLOADS'],
      monthlyUploads: data['MONTHLY_UPLOADS'],
      weeklyUploads: data['WEEKLY_UPLOADS'],
      dashArtistList: data['DASH_ARTIST_LIST'],
      dashSongwriterList: data['DASH_POLL_LIST'],
      dashQuizList: data['DASH_QUIZ_LIST'],
      dashPoolList: data['DASH_SONGWRITER_LIST'],
      monthlyPolls: data['MONTHLY_POLLS'],
      monthlyQuizzes: data['MONTHLY_QUIZZES'],
    );
  }
}
