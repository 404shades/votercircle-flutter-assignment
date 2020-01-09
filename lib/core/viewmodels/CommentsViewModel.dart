import 'package:disqus_system/core/models/CommentsModel.dart';
import 'package:disqus_system/core/services/post_service.dart';
import 'package:disqus_system/locator.dart';
import 'package:disqus_system/utils/profile_generator.dart';
import 'package:flutter/material.dart';

class CommentsViewModel with ChangeNotifier {
  CommentsModel _commentsModel;
  List<AllComments> _postComments = [];
  List<AllComments> get allComments => _postComments;
  bool isReplying = false;
  String toUserReply = '';
  int commentID;
  set isReplyingFlag(bool reply) {
    isReplying = reply;
    notifyListeners();
  }

  set replyCommentId(int cID){
    commentID = cID;
  }

  set userReply(String user) {
    toUserReply = user;
    notifyListeners();
  }

  void getPreviousComments(int postID) async {
    isReplyingFlag = false;
    toUserReply = '';
    commentID=null;

    if (_commentsModel != null) {
      _postComments = _commentsModel.allComments
          .where((val) => val.postId == postID)
          .toList();
      notifyListeners();
      return;
    }
    _commentsModel = await locator<PostService>().getPreviousComments();
    if (_commentsModel != null) {
      _postComments = _commentsModel.allComments
          .where((val) => val.postId == postID)
          .toList();
      notifyListeners();
    }
  }

  addNewComment(postID, message) {
    UserProfileModel userProfileModel = locator<ProfileGenerator>().getRandomUser();
    if (isReplying) {
      Reply reply = new Reply(
        commentAuthor:userProfileModel.name,
        commentMessage: message,
        authorProfilePicture: userProfileModel.image,
        replyTime: DateTime.now().toIso8601String(),
        
      );
      _commentsModel.allComments.firstWhere((val)=>val.commentId==commentID).reply.add(reply);
      notifyListeners();
    } else {
      AllComments comment = AllComments(
        commentId: (_commentsModel.allComments.length+1),
          authorProfilePicture: userProfileModel.image,
          commentAuthor: userProfileModel.name,
          commentMessage: message,
          commentTime: DateTime.now().toIso8601String(),
          postId: postID,
          reply: []);
      _commentsModel.allComments.add(comment);
      _postComments.add(comment);
      notifyListeners();
    }
  }

  clearData() {
    _postComments.clear();
  }
}
