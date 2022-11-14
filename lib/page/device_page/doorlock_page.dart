import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:my_app_intern/components/constants.dart';

class DoorLockPage extends StatefulWidget {
  const DoorLockPage({Key? key}) : super(key: key);

  @override
  State<DoorLockPage> createState() => _DoorLockPageState();
}

class _DoorLockPageState extends State<DoorLockPage> {
  bool status1 = true;
  Widget appbar(size) {
    Size abHeight = size * 0.3, abWidth = size;
    return Container(
        height: abHeight.height,
        width: abWidth.width,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 3,
                  spreadRadius: -5,
                  offset: Offset(0, 5))
            ]),
        child: Padding(
          padding: EdgeInsets.only(
              top: abHeight.height * 0.05,
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
                    //DEVICE NAME AND BACK ICON
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
                            "Door Lock", //
                            style: TextStyle(
                                fontSize: abHeight.height * 0.2,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    //ID
                    Container(
                      height: abHeight.height * 0.15,
                      width: abWidth.width * 0.5,
                      //color: Colors.black,
                      margin: EdgeInsets.only(left: abWidth.width * 0.22),
                      alignment: Alignment.topLeft,
                      child: Row(children: const [
                        Text(
                          "ID: ",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "985632552",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                    //STATUS AND ELEC BILL
                    Container(
                      height: abHeight.height * 0.2,
                      width: abWidth.width * 0.94,
                      //color: Colors.pink,
                      margin: EdgeInsets.only(top: abHeight.height * 0.03),
                      padding: EdgeInsets.only(
                        left: abWidth.width * 0.05,
                        right: abWidth.width * 0.05,
                      ),
                      child: Row(
                        children: [
                          Row(children: const [
                            Text(
                              "Status: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "online",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal),
                            )
                          ]),
                          const Spacer(),
                          Row(children: const [
                            /*Text(
                              "Elec Bill: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "1400",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal),
                            )*/
                          ])
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget body(size) {
    Size bdHeight = size * 0.7, bdWidth = size;
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
              Container(
                height: size.height * 0.18,
                width: size.width * 0.45,
                padding: EdgeInsets.all(size.width * 0.1),
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
                    Text(
                      "Status Door Lock: ",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    FlutterSwitch(
                      width: 70,
                      height: 35,
                      valueFontSize: 15.0,
                      toggleSize: 25.0,
                      value: status1,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      activeColor: Colors.green,
                      onToggle: (val) {
                        setState(() {
                          status1 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          //ADD HOME BUTTON
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
}
