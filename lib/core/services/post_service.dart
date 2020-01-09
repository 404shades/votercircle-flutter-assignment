import 'dart:convert';

import 'package:disqus_system/core/models/CommentsModel.dart';
import 'package:disqus_system/core/models/PostsModel.dart';
import 'package:flutter/services.dart';

class PostService{
  Future<PostsModel> getPostsFromFile() async {
  try {
    String jsonString =
        await rootBundle.loadString('assets/mock_files/mock_post.json');
    return PostsModel.fromJson(jsonDecode(jsonString));
  } catch (e) {
    return null;
  }
}

Future<CommentsModel> getPreviousComments() async{
  try{
    String jsonString =
        await rootBundle.loadString('assets/mock_files/mock_comments.json');
    return CommentsModel.fromJson(jsonDecode(jsonString));
  
  }catch(e){
    return null;
  }
}
}
