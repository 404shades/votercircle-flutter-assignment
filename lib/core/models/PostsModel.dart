class PostsModel {
  List<PostResults> _postResults;

  PostsModel({List<PostResults> postResults}) {
    this._postResults = postResults;
  }

  List<PostResults> get postResults => _postResults;
  set postResults(List<PostResults> postResults) => _postResults = postResults;

  PostsModel.fromJson(Map<String, dynamic> json) {
    if (json['post_results'] != null) {
      _postResults = new List<PostResults>();
      json['post_results'].forEach((v) {
        _postResults.add(new PostResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._postResults != null) {
      data['post_results'] = this._postResults.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostResults {
  int _postId;
  String _backgroundPoster;
  String _frontsidePoster;
  String _title;
  String _quote1;
  String _quote2;
  String _description;

  PostResults(
      {int postId,
      String backgroundPoster,
      String frontsidePoster,
      String title,
      String quote1,
      String quote2,
      String description}) {
    this._postId = postId;
    this._backgroundPoster = backgroundPoster;
    this._frontsidePoster = frontsidePoster;
    this._title = title;
    this._quote1 = quote1;
    this._quote2 = quote2;
    this._description = description;
  }

  int get postId => _postId;
  set postId(int postId) => _postId = postId;
  String get backgroundPoster => _backgroundPoster;
  set backgroundPoster(String backgroundPoster) =>
      _backgroundPoster = backgroundPoster;
  String get frontsidePoster => _frontsidePoster;
  set frontsidePoster(String frontsidePoster) =>
      _frontsidePoster = frontsidePoster;
  String get title => _title;
  set title(String title) => _title = title;
  String get quote1 => _quote1;
  set quote1(String quote1) => _quote1 = quote1;
  String get quote2 => _quote2;
  set quote2(String quote2) => _quote2 = quote2;
  String get description => _description;
  set description(String description) => _description = description;

  PostResults.fromJson(Map<String, dynamic> json) {
    _postId = json['post_id'];
    _backgroundPoster = json['background_poster'];
    _frontsidePoster = json['frontside_poster'];
    _title = json['title'];
    _quote1 = json['quote1'];
    _quote2 = json['quote2'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this._postId;
    data['background_poster'] = this._backgroundPoster;
    data['frontside_poster'] = this._frontsidePoster;
    data['title'] = this._title;
    data['quote1'] = this._quote1;
    data['quote2'] = this._quote2;
    data['description'] = this._description;
    return data;
  }
}

