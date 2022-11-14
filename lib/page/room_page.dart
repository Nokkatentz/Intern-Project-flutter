// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:my_app_intern/page/add_device.dart';
import 'package:my_app_intern/page/device_page/doorlock_page.dart';
import 'package:my_app_intern/page/device_page/lineswitch_page.dart';
import 'package:my_app_intern/page/device_page/plug_page.dart';
import 'package:my_app_intern/components/constants.dart';
import 'package:my_app_intern/page/Noti_Page.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  Widget appbar(size) {
    Size abHeight = size * 0.25, abWidth = size;
    return Container(
        height: abHeight.height,
        width: abWidth.width,
        decoration: const BoxDecoration(
            color: kPrimaryColor,
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
                              color: Colors.white,
                              size: abHeight.height * 0.28,
                            ),
                          ),
                        ),
                        Container(
                          height: abHeight.height * 0.4,
                          width: abWidth.width * 0.48,
                          padding:
                              EdgeInsets.only(bottom: abHeight.height * 0.02),
                          alignment: Alignment.bottomLeft,
                          //color: Colors.yellow, //just cheCk area
                          child: AutoSizeText(
                            //auto text here
                            "HOME 1/Living room", //
                            style: TextStyle(
                                fontSize: abWidth.width * 0.085,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 18,
                          ),
                        )
                      ],
                    ),
                    //Username and setting button
                    Row(
                      children: [
                        Container(
                          height: abHeight.height * 0.2,
                          width: abWidth.width * 0.405,
                          margin: EdgeInsets.only(left: abHeight.height * 0.2),
                          alignment: Alignment.topLeft,
                          //color: Colors.yellow, //just chenk area
                          child: Row(
                            children: [
                              SizedBox(
                                width: abWidth.width * 0.28,
                                child: AutoSizeText(
                                  //Autotext here
                                  "Username", //get username
                                  style: TextStyle(
                                      fontSize: abHeight.height * 0.15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  minFontSize: 20,
                                ),
                              ),
                              const Spacer(),
                              //setting icon
                              Material(
                                color: kPrimaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(1000)),
                                child: IconButton(
                                  icon: Image.asset(
                                      "assets/icons/setting-icon.png"),
                                  iconSize: abHeight.height * 0.15,
                                  onPressed: () {
                                    // ignore: avoid_print
                                    print('go to setting page');
                                    //go to setting page
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                //Noti button
                Container(
                  height: abHeight.height * 0.6,
                  width: abWidth.width * 0.2,
                  alignment: Alignment.bottomCenter,
                  //color: Colors.red, // just check area
                  child: Container(
                    height: abHeight.height * 0.3,
                    width: abWidth.width * 0.2,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SizedBox(
                      height: abHeight.height * 0.3,
                      width: abWidth.width * 0.2,
                      child: Material(
                        color: Colors.yellow[300],
                        child: IconButton(
                          icon: Image.asset(
                            "assets/icons/noti-icon.png",
                            scale: abWidth.width * 0.02,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Noti_Page();
                            }));
                          },
                        ),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                )
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
            children: [
              devicebox(
                  dname: "Smart Plug",
                  id: "254362558",
                  status: "online",
                  type: "plug"),
              devicebox(
                  dname: "Light",
                  id: "120200365",
                  status: "online",
                  type: "lineswitch"),
              devicebox(
                  dname: "Door Lock",
                  id: "985632552",
                  status: "online",
                  type: "door"),
            ],
          ),
          //ADD HOME BUTTON
          Container(
            height: size.height * 0.715,
            width: size.width,
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(size.height * 0.025),
            //color: Colors.black,
            child: SizedBox(
              height: size.height * 0.15,
              width: size.width * 0.2,
              //color: Colors.green,
              child: FloatingActionButton(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return addDevice();
                  }));
                },
                child: Icon(Icons.add,
                    size: size.width * 0.1, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
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

  devicebox({dname, id, status, type}) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.18,
          width: size.width,
          margin: EdgeInsets.only(bottom: size.height * 0.025),
          padding: EdgeInsets.only(
            left: size.width * 0.03,
            right: size.width * 0.03,
            top: size.height * 0.02,
            bottom: size.height * 0.02,
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 3,
                    spreadRadius: -5,
                    offset: Offset(0, 5))
              ]),
          child: Row(
            children: [
              Container(
                height: size.height * 0.18,
                width: size.width * 0.25,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 104, 129, 150),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Container(
                height: size.height * 0.18,
                width: size.width * 0.018,
                margin: EdgeInsets.only(left: size.width * 0.025),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
              Container(
                height: size.height * 0.18,
                width: size.width * 0.55,
                margin: EdgeInsets.only(left: size.width * 0.03),
                padding: EdgeInsets.only(top: size.height * 0.01),
                //color: Colors.pink,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //auto text here
                      dname, //get name
                      style: TextStyle(
                          fontSize: size.height * 0.038,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    Row(
                      children: [
                        Text(
                          "ID :", //get name
                          style: TextStyle(
                              fontSize: size.height * 0.03,
                              fontWeight: FontWeight.normal,
                              color: kPrimaryColor),
                        ),
                        Text(
                          id, //get num
                          style: TextStyle(
                              fontSize: size.height * 0.03,
                              fontWeight: FontWeight.normal,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Status :", //get name
                          style: TextStyle(
                              fontSize: size.height * 0.03,
                              fontWeight: FontWeight.normal,
                              color: kPrimaryColor),
                        ),
                        if (status == "online") ...[
                          Text(
                            status, //get num
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.normal,
                                color: Colors.green),
                          ),
                        ] else if (status == "offline") ...[
                          Text(
                            status, //get num
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.normal,
                                color: Colors.red),
                          ),
                        ],
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: size.height * 0.18,
          width: size.width,
          margin: EdgeInsets.only(bottom: size.height * 0.025),
          decoration: const BoxDecoration(
            //color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
              ),
              onPressed: () {
                //go to room page

                print("Go to other page");
                if (type == "plug") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PlugPage()),
                  );
                } else if (type == "lineswitch") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LineSwitchPage()),
                  );
                } else if (type == "door") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DoorLockPage()),
                  );
                }
              },
              child: Container()),
        ),
      ],
    );
  }
}
