import 'package:disqus_system/Design/LoginSection/LoginScreen.dart';
import 'package:disqus_system/Design/NewPostSection/New_Post_Screen.dart';
import 'package:disqus_system/Design/PostSection/Single_Post.dart';
import 'package:disqus_system/core/viewmodels/AuthenticationViewModel.dart';
import 'package:disqus_system/core/viewmodels/PostViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AllPostsSection extends StatefulWidget {
  @override
  _AllPostsSectionState createState() => _AllPostsSectionState();
}

class _AllPostsSectionState extends State<AllPostsSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostViewModel>(context,listen: false).getAllPosts();
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(Provider.of<AuthenticationViewModel>(context,listen: false).isUserLoggedIn){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>NewPostScreen()
            ));
          }else{
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>LoginScreen()
            ));
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black54,
        tooltip: "Create new post",
        autofocus: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)
        ),
        
      ),
      body: Consumer<PostViewModel>(
        builder: (context, model, child){
          if(model.currentState==LoadingState.Busy){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return PageView.builder(
              itemCount: model.allPosts.length,
              itemBuilder: (context,index){
                return SinglePost(
                  backgroundPicture: model.allPosts[index].backgroundPoster,
                  frontSidePicture: model.allPosts[index].frontsidePoster,
                  description: model.allPosts[index].description,
                  quoteBottom: model.allPosts[index].quote2,
                  quoteTop: model.allPosts[index].quote1,
                  title: model.allPosts[index].title,
                  postID: model.allPosts[index].postId,
                );
              },
            );
          }
        },
      )
    );
  }
}


