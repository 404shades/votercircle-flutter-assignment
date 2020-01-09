import 'package:disqus_system/Design/CommentSection/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SinglePost extends StatelessWidget {
  final String backgroundPicture;
  final String frontSidePicture;
  final String title;
  final String quoteTop;
  final String quoteBottom;
  final int postID;
  final String description;

  const SinglePost({Key key, this.backgroundPicture, this.frontSidePicture, this.title, this.quoteTop, this.quoteBottom, this.description, this.postID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FadeInImage(
            fadeInDuration: Duration(milliseconds: 600),
            placeholder: MemoryImage(kTransparentImage),
            image: AssetImage(backgroundPicture),
            fit: BoxFit.cover,
          ),
          
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20,right: 20),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text("Rohan Malik"),
                            subtitle: Text("Product Engineer"),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/rohan.jpg"),
                            ),
                          ),
                          Text(description,style: TextStyle(
                            color: Colors.black54
                          ),),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 9,
                                  spreadRadius: 2,
                                  offset: Offset(1,2)
                                )
                              ]
                            ),
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(frontSidePicture)
                                )
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                maxRadius: 10,
                                backgroundImage: AssetImage("assets/images/rohan.jpg")
                              ),
                              Spacer(flex: 1,),
                              CircleAvatar(
                                maxRadius: 10,
                                backgroundImage: AssetImage("assets/images/rohan.jpg")
                              ),
                              Spacer(flex: 1,),
                              CircleAvatar(
                                maxRadius: 10,
                                backgroundImage: AssetImage("assets/images/rohan.jpg")
                              ),
                              Spacer(flex: 2,),
                              Text("+120 more",style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                color: Colors.black54
                              ),),
                              Spacer(flex: 5,),
                              FlatButton(
                                child: Text("View all comments"),
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context)=>CommentsPage(
                                      postID: postID,
                                    )
                                  ));
                                },
                                textColor: Colors.black87,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              )
                            ],
                          )
                        ],
                      ),

                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19,
                                    fontStyle: FontStyle.italic),
                                children: [
                                  TextSpan(text: quoteTop),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: quoteBottom)
                                ]),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
  }
}