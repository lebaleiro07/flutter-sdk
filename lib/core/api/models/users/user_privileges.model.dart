import 'dart:convert';

class UserPrivileges {
  bool privInternal;
  bool privSensitive;
  bool privMediaCreate;
  bool privMediaDelete;
  bool privUserReadStatistics;
  bool privUserReadContact;
  bool privIndicationReadStatistics;
  bool privLikeReadStatistics;
  bool privPostCoverUpload;
  bool privPostLyricUpload;
  bool privPollCreate;
  bool privQuizCreate;

  UserPrivileges({
    this.privInternal,
    this.privSensitive,
    this.privMediaCreate,
    this.privMediaDelete,
    this.privUserReadStatistics,
    this.privUserReadContact,
    this.privIndicationReadStatistics,
    this.privLikeReadStatistics,
    this.privPostCoverUpload,
    this.privPostLyricUpload,
    this.privPollCreate,
    this.privQuizCreate,
  });

  factory UserPrivileges.fromJson(String str) =>
      UserPrivileges.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserPrivileges.fromMap(Map<String, dynamic> json) =>
      new UserPrivileges(
        privInternal:
            json["PRIV_INTERNAL"] == null ? null : json["PRIV_INTERNAL"],
        privSensitive:
            json["PRIV_SENSITIVE"] == null ? null : json["PRIV_SENSITIVE"],
        privMediaCreate: json["PRIV_MEDIA_CREATE"] == null
            ? null
            : json["PRIV_MEDIA_CREATE"],
        privMediaDelete: json["PRIV_MEDIA_DELETE"] == null
            ? null
            : json["PRIV_MEDIA_DELETE"],
        privUserReadStatistics: json["PRIV_USER_READ_STATISTICS"] == null
            ? null
            : json["PRIV_USER_READ_STATISTICS"],
        privUserReadContact: json["PRIV_USER_READ_CONTACT"] == null
            ? null
            : json["PRIV_USER_READ_CONTACT"],
        privIndicationReadStatistics:
            json["PRIV_INDICATION_READ_STATISTICS"] == null
                ? null
                : json["PRIV_INDICATION_READ_STATISTICS"],
        privLikeReadStatistics: json["PRIV_LIKE_READ_STATISTICS"] == null
            ? null
            : json["PRIV_LIKE_READ_STATISTICS"],
        privPostCoverUpload: json["PRIV_POST_COVER_UPLOAD"] == null
            ? null
            : json["PRIV_POST_COVER_UPLOAD"],
        privPostLyricUpload: json["PRIV_POST_LYRIC_UPLOAD"] == null
            ? null
            : json["PRIV_POST_LYRIC_UPLOAD"],
        privPollCreate:
            json["PRIV_POLL_CREATE"] == null ? null : json["PRIV_POLL_CREATE"],
        privQuizCreate:
            json["PRIV_QUIZ_CREATE"] == null ? null : json["PRIV_QUIZ_CREATE"],
      );

  Map<String, dynamic> toMap() => {
        "PRIV_INTERNAL": privInternal == null ? null : privInternal,
        "PRIV_SENSITIVE": privSensitive == null ? null : privSensitive,
        "PRIV_MEDIA_CREATE": privMediaCreate == null ? null : privMediaCreate,
        "PRIV_MEDIA_DELETE": privMediaDelete == null ? null : privMediaDelete,
        "PRIV_USER_READ_STATISTICS":
            privUserReadStatistics == null ? null : privUserReadStatistics,
        "PRIV_USER_READ_CONTACT":
            privUserReadContact == null ? null : privUserReadContact,
        "PRIV_INDICATION_READ_STATISTICS": privIndicationReadStatistics == null
            ? null
            : privIndicationReadStatistics,
        "PRIV_LIKE_READ_STATISTICS":
            privLikeReadStatistics == null ? null : privLikeReadStatistics,
        "PRIV_POST_COVER_UPLOAD":
            privPostCoverUpload == null ? null : privPostCoverUpload,
        "PRIV_POST_LYRIC_UPLOAD":
            privPostLyricUpload == null ? null : privPostLyricUpload,
        "PRIV_POLL_CREATE": privPollCreate == null ? null : privPollCreate,
        "PRIV_QUIZ_CREATE": privQuizCreate == null ? null : privQuizCreate,
      };
}
