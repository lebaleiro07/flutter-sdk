import 'dart:convert';

class UserQuotas {
  int dailyUploads;
  int monthlyUploads;
  int weeklyUploads;
  int dashArtistList;
  int dashPoolList;
  int dashQuizList;
  int dashSongwriterList;
  int monthlyPolls;
  int monthlyQuizzes;

  UserQuotas({
    this.dailyUploads,
    this.monthlyUploads,
    this.weeklyUploads,
    this.dashArtistList,
    this.dashPoolList,
    this.dashQuizList,
    this.dashSongwriterList,
    this.monthlyPolls,
    this.monthlyQuizzes,
  });

  factory UserQuotas.fromJson(String str) =>
      UserQuotas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserQuotas.fromMap(Map<String, dynamic> json) => new UserQuotas(
        dailyUploads:
            json["DAILY_UPLOADS"] == null ? null : json["DAILY_UPLOADS"],
        monthlyUploads:
            json["MONTHLY_UPLOADS"] == null ? null : json["MONTHLY_UPLOADS"],
        weeklyUploads:
            json["WEEKLY_UPLOADS"] == null ? null : json["WEEKLY_UPLOADS"],
        dashArtistList:
            json["DASH_ARTIST_LIST"] == null ? null : json["DASH_ARTIST_LIST"],
        dashPoolList:
            json["DASH_POLL_LIST"] == null ? null : json["DASH_POLL_LIST"],
        dashQuizList:
            json["DASH_QUIZ_LIST"] == null ? null : json["DASH_QUIZ_LIST"],
        dashSongwriterList: json["DASH_SONGWRITER_LIST"] == null
            ? null
            : json["DASH_SONGWRITER_LIST"],
        monthlyPolls:
            json["MONTHLY_POLLS"] == null ? null : json["MONTHLY_POLLS"],
        monthlyQuizzes:
            json["MONTHLY_QUIZZES"] == null ? null : json["MONTHLY_QUIZZES"],
      );

  Map<String, dynamic> toMap() => {
        "DAILY_UPLOADS": dailyUploads == null ? null : dailyUploads,
        "MONTHLY_UPLOADS": monthlyUploads == null ? null : monthlyUploads,
        "WEEKLY_UPLOADS": weeklyUploads == null ? null : weeklyUploads,
        "DASH_ARTIST_LIST": dashArtistList == null ? null : dashArtistList,
        "DASH_POLL_LIST": dashPoolList == null ? null : dashPoolList,
        "DASH_QUIZ_LIST": dashQuizList == null ? null : dashQuizList,
        "DASH_SONGWRITER_LIST":
            dashSongwriterList == null ? null : dashSongwriterList,
        "MONTHLY_POLLS": monthlyPolls == null ? null : monthlyPolls,
        "MONTHLY_QUIZZES": monthlyQuizzes == null ? null : monthlyQuizzes,
      };
}
