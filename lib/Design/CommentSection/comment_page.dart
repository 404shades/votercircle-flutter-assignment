import 'dart:io';

import 'package:disqus_system/Design/CommentSection/comments_list.dart';
import 'package:disqus_system/core/viewmodels/CommentsViewModel.dart';
import 'package:disqus_system/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class CommentsPage extends StatefulWidget {
  final int postID;

  const CommentsPage({Key key, this.postID}) : super(key: key);
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final FocusNode messageFocusNode = FocusNode();
  TextEditingController editingController;
  CommentsViewModel commentsViewModel;

  @override
  void initState() {
    // TODO: implement initState
    editingController = new TextEditingController();
    commentsViewModel = Provider.of<CommentsViewModel>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
     Provider.of<CommentsViewModel>(context,listen: false).getPreviousComments(widget.postID);
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(gradient: blueSexyGradient),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45))),
                    child: Column(
                      children: <Widget>[
                       CustomChatBar(),
                        Expanded(child: CommentsList()),
                        if(Provider.of<CommentsViewModel>(context).isReplying)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45))
                          ),
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Replying to ${Provider.of<CommentsViewModel>(context).toUserReply}",style: TextStyle(
                                color: Colors.black54
                              ),),
                              IconButton(
                                color: Colors.black54,
                                onPressed: (){
                                  Provider.of<CommentsViewModel>(context,listen: false).userReply = '';
                                  Provider.of<CommentsViewModel>(context,listen: false).isReplyingFlag = false;
                                  
                                },
                                icon: Icon(Icons.close),
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 24, top: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        MaterialCommunityIcons.emoticon_happy_outline,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          focusNode: messageFocusNode,
                          controller: editingController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a Comment",
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Feather.send),
                        onPressed: () {
                          messageFocusNode.unfocus();
                          if(editingController.text.isNotEmpty){
                            Provider.of<CommentsViewModel>(context,listen: false).addNewComment(widget.postID, editingController.text);
                            editingController.clear();
                          }
                        },
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() { 
    commentsViewModel.clearData();
    super.dispose();
  }
}


class CustomChatBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
      title: Text("Post Comments",style: TextStyle(color: Colors.black),),
    );
  }
}