class CommentsModel {
  List<AllComments> _allComments;

  CommentsModel({List<AllComments> allComments}) {
    this._allComments = allComments;
  }

  List<AllComments> get allComments => _allComments;
  set allComments(List<AllComments> allComments) => _allComments = allComments;

  CommentsModel.fromJson(Map<String, dynamic> json) {
    if (json['all_comments'] != null) {
      _allComments = new List<AllComments>();
      json['all_comments'].forEach((v) {
        _allComments.add(new AllComments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._allComments != null) {
      data['all_comments'] = this._allComments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllComments {
  String _commentMessage;
  int _postId;
  int _commentId;
  String _commentAuthor;
  String _authorProfilePicture;
  String _commentTime;
  List<Reply> _reply;

  AllComments(
      {String commentMessage,
      int postId,
      int commentId,
      String commentAuthor,
      String authorProfilePicture,
      String commentTime,
      List<Reply> reply}) {
    this._commentMessage = commentMessage;
    this._postId = postId;
    this._commentId = commentId;
    this._commentAuthor = commentAuthor;
    this._authorProfilePicture = authorProfilePicture;
    this._commentTime = commentTime;
    this._reply = reply;
  }

  String get commentMessage => _commentMessage;
  set commentMessage(String commentMessage) => _commentMessage = commentMessage;
  int get postId => _postId;
  set postId(int postId) => _postId = postId;
  int get commentId => _commentId;
  set commentId(int commentId) => _commentId = commentId;
  String get commentAuthor => _commentAuthor;
  set commentAuthor(String commentAuthor) => _commentAuthor = commentAuthor;
  String get authorProfilePicture => _authorProfilePicture;
  set authorProfilePicture(String authorProfilePicture) =>
      _authorProfilePicture = authorProfilePicture;
  String get commentTime => _commentTime;
  set commentTime(String commentTime) => _commentTime = commentTime;
  List<Reply> get reply => _reply;
  set reply(List<Reply> reply) => _reply = reply;

  AllComments.fromJson(Map<String, dynamic> json) {
    _commentMessage = json['comment_message'];
    _postId = json['post_id'];
    _commentId = json['comment_id'];
    _commentAuthor = json['comment_author'];
    _authorProfilePicture = json['author_profile_picture'];
    _commentTime = json['comment_time'];
    if (json['reply'] != null) {
      _reply = new List<Reply>();
      json['reply'].forEach((v) {
        _reply.add(new Reply.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_message'] = this._commentMessage;
    data['post_id'] = this._postId;
    data['comment_id'] = this._commentId;
    data['comment_author'] = this._commentAuthor;
    data['author_profile_picture'] = this._authorProfilePicture;
    data['comment_time'] = this._commentTime;
    if (this._reply != null) {
      data['reply'] = this._reply.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reply {
  String _commentMessage;
  String _commentAuthor;
  String _replyTime;
  String _authorProfilePicture;

  Reply(
      {String commentMessage,
      String commentAuthor,
      String replyTime,
      String authorProfilePicture}) {
    this._commentMessage = commentMessage;
    this._commentAuthor = commentAuthor;
    this._replyTime = replyTime;
    this._authorProfilePicture = authorProfilePicture;
  }

  String get commentMessage => _commentMessage;
  set commentMessage(String commentMessage) => _commentMessage = commentMessage;
  String get commentAuthor => _commentAuthor;
  set commentAuthor(String commentAuthor) => _commentAuthor = commentAuthor;
  String get replyTime => _replyTime;
  set replyTime(String replyTime) => _replyTime = replyTime;
  String get authorProfilePicture => _authorProfilePicture;
  set authorProfilePicture(String authorProfilePicture) =>
      _authorProfilePicture = authorProfilePicture;

  Reply.fromJson(Map<String, dynamic> json) {
    _commentMessage = json['comment_message'];
    _commentAuthor = json['comment_author'];
    _replyTime = json['reply_time'];
    _authorProfilePicture = json['author_profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_message'] = this._commentMessage;
    data['comment_author'] = this._commentAuthor;
    data['reply_time'] = this._replyTime;
    data['author_profile_picture'] = this._authorProfilePicture;
    return data;
  }
}
