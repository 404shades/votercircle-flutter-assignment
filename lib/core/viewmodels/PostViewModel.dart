import 'package:disqus_system/core/models/PostsModel.dart';
import 'package:disqus_system/core/services/post_service.dart';
import 'package:disqus_system/locator.dart';
import 'package:flutter/foundation.dart';

enum LoadingState{
  Busy,
  Idle
}
class PostViewModel with ChangeNotifier{
  LoadingState _currentState = LoadingState.Busy;
  LoadingState get currentState => _currentState;
  PostsModel _postsModel;
  List<PostResults> get allPosts => _postsModel?.postResults;

  void setState(LoadingState loadingState){
    _currentState = loadingState;
    notifyListeners();
  }

  void getAllPosts() async{
    setState(LoadingState.Busy);
    _postsModel = await locator<PostService>().getPostsFromFile();
    if(_postsModel!=null){
      setState(LoadingState.Idle);
    }
  }

}