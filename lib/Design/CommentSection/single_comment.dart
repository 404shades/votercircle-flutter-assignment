import 'package:disqus_system/core/models/CommentsModel.dart';
import 'package:disqus_system/core/viewmodels/CommentsViewModel.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class SingleComment extends StatefulWidget {
  final String comment;
  final String author_name;
  final String author_image;
  final List<Reply> replies;
  final String time;
  final int commentID;

  

  SingleComment(
      {Key key,
      this.commentID,
      this.comment,
      this.author_name,
      this.author_image,
      this.replies, this.time})
      : super(key: key);

  @override
  _SingleCommentState createState() => _SingleCommentState();
}

class _SingleCommentState extends State<SingleComment> {
  Jiffy jiffy3;
  bool isPostLiked = false;
  @override
  void initState() {
    jiffy3 = Jiffy(DateTime.parse(widget.time))
    ..startOf("hour");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.author_image),
            ),
            title: Text(
              widget.author_name,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(widget.comment),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(jiffy3.fromNow()),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isPostLiked = !isPostLiked;
                        });
                      },
                                          child: Container(
                        height: 28,
                        width: 28,
                        child: FlareActor(
                          "assets/like_button.flr",
                          shouldClip: false,
                          
                          animation: isPostLiked?'like':'unlike',
                          
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text("Reply"),
                      onPressed: () {
                        Provider.of<CommentsViewModel>(context,listen: false).replyCommentId = widget.commentID;
                        Provider.of<CommentsViewModel>(context,listen: false).userReply = widget.author_name;
                        Provider.of<CommentsViewModel>(context,listen: false).isReplyingFlag = true;
                      },
                      textColor: Colors.black87,
                    )
                  ],
                )
              ],
            ),
            isThreeLine: true,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.replies.length,
              itemBuilder: (context, index) {
                final jiffy = Jiffy(DateTime.parse(widget.replies[index].replyTime))..startOf("hour");
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(widget.replies[index].authorProfilePicture),
                  ),
                  title: Text(
                    widget.replies[index].commentAuthor,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(widget.replies[index].commentMessage),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(jiffy.fromNow()),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 28,
                            width: 28,
                            child: FlareActor(
                              "assets/like_button.flr",
                              shouldClip: false,
                              animation: 'like',
                              color: Colors.red,
                            ),
                          ),
                    
                        ],
                      )
                    ],
                  ),
                  isThreeLine: true,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
