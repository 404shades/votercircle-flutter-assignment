import 'package:disqus_system/Design/CommentSection/single_comment.dart';
import 'package:disqus_system/core/viewmodels/CommentsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CommentsViewModel>(
      builder: (context, model,child) {
        return Scrollbar(
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 10),
            itemCount: model.allComments.length,
            itemBuilder: (context,index){
              return SingleComment(
                comment: model.allComments[index].commentMessage,
                author_image: model.allComments[index].authorProfilePicture,
                author_name: model.allComments[index].commentAuthor,
                replies: model.allComments[index].reply,
                time: model.allComments[index].commentTime,
                commentID: model.allComments[index].commentId,
              );
            },
          ),
        );
      }
    );
  }
}