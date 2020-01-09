import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {
  final String icon;

  const SocialIcons({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
       decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12,width: 1),
          borderRadius: BorderRadius.circular(6),
          
        ),
        child: Image.asset(icon,height: 20,),
    );
  }
}