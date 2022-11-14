import 'package:flutter/material.dart';
import 'package:my_app_intern/page/home_page.dart';
import 'package:my_app_intern/components/constants.dart';
import 'package:my_app_intern/page/room_page.dart';

class Noti_Page extends StatefulWidget {
  const Noti_Page({Key? key}) : super(key: key);

  @override
  State<Noti_Page> createState() => _Noti_PageState();
}

class _Noti_PageState extends State<Noti_Page> {
  @override
  Widget appbar(size) {
    Size abHeight = size * 0.25, abWidth = size;
    return Container(
        height: abHeight.height,
        width: abWidth.width,
        decoration: const BoxDecoration(
            color: kNotiColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 3,
                  spreadRadius: -5,
                  offset: Offset(0, 5))
            ]),
        child: Padding(
          padding: EdgeInsets.only(
              top: abHeight.height * 0.2,
              bottom: abHeight.height * 0.025,
              right: abWidth.width * 0.025,
              left: abWidth.width * 0.025),
          child: Container(
            //color: Colors.black, //just chenk area
            padding: EdgeInsets.only(top: abHeight.height * 0.1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //App Icon and name
                    Row(
                      children: [
                        FlatButton(
                          onPressed: () {
                            print("back");
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: abHeight.height * 0.4,
                            width: abWidth.width * 0.1,
                            alignment: Alignment.bottomCenter,
                            //color: Colors.red, //just chenk area
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                              size: abHeight.height * 0.28,
                            ),
                          ),
                        ),
                        Container(
                          height: abHeight.height * 0.4,
                          width: abWidth.width * 0.48,
                          padding:
                              EdgeInsets.only(bottom: abHeight.height * 0.04),
                          alignment: Alignment.bottomLeft,
                          //color: Colors.yellow, //just cheCk area
                          child: Text(
                            //auto text here
                            "NOTIFICATION", //
                            style: TextStyle(
                                fontSize: abWidth.width * 0.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: abWidth.width * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: abHeight.height * 0.1),
                          child: Image.asset(
                            "assets/icons/noti-icon.png",
                            height: abHeight.height * 0.2,
                          ),
                        )
                      ],
                    ),
                    //Username and setting button
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget body(size) {
    Size bdHeight = size * 0.75, bdWidth = size;
    return Container(
      height: bdHeight.height,
      width: bdWidth.width,
      //color: Colors.black,
      padding: EdgeInsets.only(
        left: bdWidth.width * 0.032,
        right: bdWidth.width * 0.032,
      ),
      child: Stack(
        children: [
          ListView(
            children: [],
          ),
          //ADD HOME BUTTON
          Container(
            height: size.height * 0.715,
            width: size.width,
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(size.height * 0.025),
            //color: Colors.black,
            child: Container(
              height: size.height * 0.15,
              width: size.width * 0.2,
              //color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Widget buildInfo() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.5,
      width: size.width,
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: Column(
          children: [appbar(size), body(size)],
        ),
      ),
    );
  }
}
