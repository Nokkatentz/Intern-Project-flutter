// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:my_app_intern/page/room_page.dart';

import 'package:my_app_intern/components/constants.dart';
import 'package:my_app_intern/page/Noti_Page.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  State<PlacePage> createState() => _PlacePageState();
}

String selectcategory_room = '';
String catego_room = '';

class _PlacePageState extends State<PlacePage> {
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
                          width: abWidth.width * 0.5,
                          padding:
                              EdgeInsets.only(bottom: abHeight.height * 0.02),
                          alignment: Alignment.bottomLeft,
                          //color: Colors.yellow, //just cheCk area
                          child: AutoSizeText(
                            //auto text here
                            "HOME 1", //value
                            style: TextStyle(
                                fontSize: abWidth.width * 0.085,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 30,
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
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.yellow[300]),
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
                            print("go to notification page");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Noti_Page();
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
              placebox(pname: "Living room", pnumber: "3"),
              placebox(pname: "Bed room", pnumber: "3"),
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
                  // Go to pop-up add home
                  print("Go to pop-up add room ");
                  selectcategory_room = '';
                  showAlert(context);
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

  placebox({pname, pnumber}) {
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
                      pname, //get name
                      style: TextStyle(
                          fontSize: size.height * 0.038,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    Row(
                      children: [
                        Text(
                          "จำนวนอุปกรณ์ ", //get name
                          style: TextStyle(
                              fontSize: size.height * 0.03,
                              fontWeight: FontWeight.normal,
                              color: kPrimaryColor),
                        ),
                        Text(
                          pnumber, //get num
                          style: TextStyle(
                              fontSize: size.height * 0.03,
                              fontWeight: FontWeight.normal,
                              color: kPrimaryColor),
                        ),
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
                print("Go to room page");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RoomPage()),
                );
              },
              child: Container()),
        ),
      ],
    );
  }

  void showAlert(BuildContext context) {
    showDialog(context: context, builder: (context) => ShowpopupRoom());
  }
}

class ShowpopupRoom extends StatefulWidget {
  const ShowpopupRoom({Key? key}) : super(key: key);

  @override
  State<ShowpopupRoom> createState() => _ShowpopupRoomState();
}

class _ShowpopupRoomState extends State<ShowpopupRoom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      //TITLE OF POPUP
      title: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        //color: Colors.blue,
        alignment: Alignment.bottomCenter,
        child: Text(
          //auto text here
          "เพิ่มห้อง", //get name
          style: TextStyle(
              fontSize: size.height * 0.035,
              fontWeight: FontWeight.bold,
              color: Colors.blue[400]),
        ),
      ),
      //BODY OF POPUP
      content: Container(
        height: size.height * 0.18,
        width: size.width * 0.8,
        //color: Colors.black,
        padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.01),
        child: Column(
          children: [
            //TEXTFIELD NAME
            SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.6,
              child: const TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(top: 5, left: 10, right: 10),
                  hintText: "NAME",
                  fillColor: Color.fromARGB(255, 235, 235, 235),
                  filled: true,
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            //SELECT CATEGORY
            Container(
                height: size.height * 0.08,
                width: size.width * 0.6,
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                margin: EdgeInsets.only(top: size.height * 0.03),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xF8F8F8F8),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.grey, width: 1.5)),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      setState(() {
                        //selectcategory_room = catego_room;
                        print("current selectcategory: " + selectcategory_room);
                      });
                      category();
                    },
                    child: Row(
                      children: [
                        Text(
                          selectcategory_room, //have to elect category
                          style:
                              TextStyle(fontSize: 22, color: Colors.blue[200]),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
      //BUTTON OK
      actions: <Widget>[
        Container(
          height: size.height * 0.1,
          width: size.width * 0.8,
          //color: Colors.black,
          alignment: Alignment.center,
          child: Container(
              height: size.height * 0.07,
              width: size.width * 0.2,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 169, 196, 218),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 3,
                        spreadRadius: -5,
                        offset: Offset(0, 5))
                  ]),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: const Text("OK",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              )),
        ),
      ],
    );
  }

  void category() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20), //fix
                child: Column(
                  children: [
                    listTile(x: 'ห้องนอน'),
                    listTile(x: 'ห้องรับแขก'),
                    listTile(x: 'ห้องนั่งเล่น'),
                    listTile(x: 'ห้องครัว'),
                    listTile(x: 'ห้องน้ำ'),
                    listTile(x: 'ห้องพระ'),
                    listTile(x: 'อื่นๆ'),
                  ],
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            ],
          );
        });
  }

  ListTile listTile({required String x}) {
    return ListTile(
        title: Padding(
          padding: const EdgeInsets.only(top: 20 * 0.5),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(60)),
                border: Border.all(color: Colors.grey, width: 1.5)),
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              x,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onTap: () {
          print("before setstate:" + selectcategory_room);
          setState(() {
            selectcategory_room = x;
            catego_room = selectcategory_room;
          });
          print("after setstate:" + selectcategory_room);

          Navigator.pop(context);
        });
  }
}
