import 'package:disqus_system/core/viewmodels/AuthenticationViewModel.dart';
import 'package:disqus_system/utils/ArcClipper.dart';
import 'package:disqus_system/utils/SocialIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController;
  TextEditingController passwordController;
  @override
  void initState() {
    // TODO: implement initState
    userNameController = new TextEditingController();
    passwordController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              fit: StackFit.loose,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(bottom: 18),
                    child: ClipPath(
                      clipper: ArcCliper(),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration:
                            BoxDecoration(color: const Color(0xFF495aff)),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 50,
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: Colors.white,
                              controller: userNameController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: "User Name",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passwordController,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  suffixIcon: Icon(
                                    Feather.eye,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  textColor: Colors.white,
                                  child: Text("Forgot Password"),
                                  onPressed: () => null,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Login"),
                  onPressed: () {
                    final isLoggedIn = Provider.of<AuthenticationViewModel>(
                            context,
                            listen: false)
                        .loginUser(
                            userNameController.text, passwordController.text);
                    if (isLoggedIn) {
                      Navigator.pop(context);
                    } else {
                      print("Not a valid user");
                    }
                  },
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height / 1.5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("or login with"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SocialIcons(
                        icon: "assets/images/google.png",
                      ),
                      SocialIcons(
                        icon: "assets/images/fb.png",
                      ),
                      SocialIcons(
                        icon: "assets/images/cell.png",
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account ?"),
                      FlatButton(
                        child: Text("Sign Up"),
                        textColor: const Color(0xFF495aff),
                        onPressed: () => null,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
