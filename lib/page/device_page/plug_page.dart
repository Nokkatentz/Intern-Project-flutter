// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:my_app_intern/components/constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PlugPage extends StatefulWidget {
  const PlugPage({Key? key}) : super(key: key);

  @override
  State<PlugPage> createState() => _PlugPageState();
}

class _PlugPageState extends State<PlugPage> {
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;

  void _sendHTTP_NETPIE_Relay1_On() async {
    String username = 'fd119a9b-f7b0-414f-9d4c-64fff52960ff';
    String password = 'Tdtd6CQHAt6V9Ja2y6RcPGait495avyj';
    String basicAuth = 'Basic ' +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    print(basicAuth);
    Uri myUri =
        Uri.parse('https://api.netpie.io/v2/device/private?topic=socket01');

    http.Response r = await http.put(myUri,
        headers: <String, String>{'authorization': basicAuth},
        body: 'relay1_on');

    print(r.statusCode);
    print(r.body);
  }

  void _sendHTTP_NETPIE_Relay1_Off() async {
    String username = 'fd119a9b-f7b0-414f-9d4c-64fff52960ff';
    String password = 'Tdtd6CQHAt6V9Ja2y6RcPGait495avyj';
    String basicAuth = 'Basic ' +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    print(basicAuth);
    Uri myUri =
        Uri.parse('https://api.netpie.io/v2/device/private?topic=socket01');

    http.Response r = await http.put(myUri,
        headers: <String, String>{'authorization': basicAuth},
        body: 'relay1_off');

    print(r.statusCode);
    print(r.body);
  }

  void _sendHTTP_NETPIE_Relay2_On() async {
    String username = 'fd119a9b-f7b0-414f-9d4c-64fff52960ff';
    String password = 'Tdtd6CQHAt6V9Ja2y6RcPGait495avyj';
    String basicAuth = 'Basic ' +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    print(basicAuth);
    Uri myUri =
        Uri.parse('https://api.netpie.io/v2/device/private?topic=socket01');

    http.Response r = await http.put(myUri,
        headers: <String, String>{'authorization': basicAuth},
        body: 'relay2_on');

    print(r.statusCode);
    print(r.body);
  }

  void _sendHTTP_NETPIE_Relay2_Off() async {
    String username = 'fd119a9b-f7b0-414f-9d4c-64fff52960ff';
    String password = 'Tdtd6CQHAt6V9Ja2y6RcPGait495avyj';
    String basicAuth = 'Basic ' +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    print(basicAuth);
    Uri myUri =
        Uri.parse('https://api.netpie.io/v2/device/private?topic=socket01');

    http.Response r = await http.put(myUri,
        headers: <String, String>{'authorization': basicAuth},
        body: 'relay2_off');

    print(r.statusCode);
    print(r.body);
  }

  void _sendHTTP_NETPIE_Relay3_On() async {
    String username = 'fd119a9b-f7b0-414f-9d4c-64fff52960ff';
    String password = 'Tdtd6CQHAt6V9Ja2y6RcPGait495avyj';
    String basicAuth = 'Basic ' +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    print(basicAuth);
    Uri myUri =
        Uri.parse('https://api.netpie.io/v2/device/private?topic=socket01');

    http.Response r = await http.put(myUri,
        headers: <String, String>{'authorization': basicAuth},
        body: 'relay3_on');

    print(r.statusCode);
    print(r.body);
  }

  void _sendHTTP_NETPIE_Relay3_Off() async {
    String username = 'fd119a9b-f7b0-414f-9d4c-64fff52960ff';
    String password = 'Tdtd6CQHAt6V9Ja2y6RcPGait495avyj';
    String basicAuth = 'Basic ' +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    print(basicAuth);
    Uri myUri =
        Uri.parse('https://api.netpie.io/v2/device/private?topic=socket01');

    http.Response r = await http.put(myUri,
        headers: <String, String>{'authorization': basicAuth},
        body: 'relay3_off');

    print(r.statusCode);
    print(r.body);
  }

  void _sendHTTP_NETPIE_Relay4_On() async {
    String username = 'fd119a9b-f7b0-414f-9d4c-64fff52960ff';
    String password = 'Tdtd6CQHAt6V9Ja2y6RcPGait495avyj';
    String basicAuth = 'Basic ' +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    print(basicAuth);
    Uri myUri =
        Uri.parse('https://api.netpie.io/v2/device/private?topic=socket01');

    http.Response r = await http.put(myUri,
        headers: <String, String>{'authorization': basicAuth},
        body: 'relay4_on');

    print(r.statusCode);
    print(r.body);
  }

  void _sendHTTP_NETPIE_Relay4_Off() async {
    String username = 'fd119a9b-f7b0-414f-9d4c-64fff52960ff';
    String password = 'Tdtd6CQHAt6V9Ja2y6RcPGait495avyj';
    String basicAuth = 'Basic ' +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    print(basicAuth);
    Uri myUri =
        Uri.parse('https://api.netpie.io/v2/device/private?topic=socket01');

    http.Response r = await http.put(myUri,
        headers: <String, String>{'authorization': basicAuth},
        body: 'relay4_off');

    print(r.statusCode);
    print(r.body);
  }

  Widget appbar(size) {
    Size abHeight = size * 0.3, abWidth = size;
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
                            "Smart Plug", //
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
                          "254362558",
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
                              "5000",
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
              SizedBox(
                height: size.height * 0.4,
                width: size.width,
                //color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.18,
                          width: size.width * 0.45,
                          padding: EdgeInsets.all(size.width * 0.025),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 3,
                                    spreadRadius: -5,
                                    offset: Offset(0, 5))
                              ]),
                          child: Column(
                            children: [
                              Text(
                                "Socket 1",
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              /*Text(
                                "1250",
                                style: TextStyle(
                                    color: Colors.yellow[800],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),*/
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
                                    if (status1 == true) {
                                      _sendHTTP_NETPIE_Relay1_On();
                                    } else if (status1 == false) {
                                      _sendHTTP_NETPIE_Relay1_Off();
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: size.height * 0.18,
                          width: size.width * 0.45,
                          padding: EdgeInsets.all(size.width * 0.025),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 3,
                                    spreadRadius: -5,
                                    offset: Offset(0, 5))
                              ]),
                          child: Column(
                            children: [
                              Text(
                                "Socket 2",
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              /*Text(
                                "1250",
                                style: TextStyle(
                                    color: Colors.yellow[800],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),*/
                              const Spacer(),
                              FlutterSwitch(
                                width: 70,
                                height: 35,
                                valueFontSize: 15.0,
                                toggleSize: 25.0,
                                value: status2,
                                borderRadius: 30.0,
                                padding: 8.0,
                                showOnOff: true,
                                activeColor: Colors.green,
                                onToggle: (val2) {
                                  print(val2);
                                  setState(() {
                                    status2 = val2;
                                    if (status2 == true) {
                                      _sendHTTP_NETPIE_Relay2_On();
                                    } else if (status2 == false) {
                                      _sendHTTP_NETPIE_Relay2_Off();
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.18,
                          width: size.width * 0.45,
                          padding: EdgeInsets.all(size.width * 0.025),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 3,
                                    spreadRadius: -5,
                                    offset: Offset(0, 5))
                              ]),
                          child: Column(
                            children: [
                              Text(
                                "Socket 3",
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              /*Text(
                                "1250",
                                style: TextStyle(
                                    color: Colors.yellow[800],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),*/
                              const Spacer(),
                              FlutterSwitch(
                                width: 70,
                                height: 35,
                                valueFontSize: 15.0,
                                toggleSize: 25.0,
                                value: status3,
                                borderRadius: 30.0,
                                padding: 8.0,
                                showOnOff: true,
                                activeColor: Colors.green,
                                onToggle: (val3) {
                                  setState(() {
                                    status3 = val3;
                                    if (status3 == true) {
                                      _sendHTTP_NETPIE_Relay3_On();
                                    } else if (status3 == false) {
                                      _sendHTTP_NETPIE_Relay3_Off();
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: size.height * 0.18,
                          width: size.width * 0.45,
                          padding: EdgeInsets.all(size.width * 0.025),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 3,
                                    spreadRadius: -5,
                                    offset: Offset(0, 5))
                              ]),
                          child: Column(
                            children: [
                              Text(
                                "Socket 4",
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              /*Text(
                                "1250",
                                style: TextStyle(
                                    color: Colors.yellow[800],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),*/
                              const Spacer(),
                              FlutterSwitch(
                                width: 70,
                                height: 35,
                                valueFontSize: 15.0,
                                toggleSize: 25.0,
                                value: status4,
                                borderRadius: 30.0,
                                padding: 8.0,
                                showOnOff: true,
                                activeColor: Colors.green,
                                onToggle: (val4) {
                                  setState(() {
                                    status4 = val4;
                                    if (status4 == true) {
                                      _sendHTTP_NETPIE_Relay4_On();
                                    } else if (status4 == false) {
                                      _sendHTTP_NETPIE_Relay4_Off();
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
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

  shcket() {
    Size size = MediaQuery.of(context).size;
    bool status1 = true;
    bool status2 = true;
    bool status3 = true;
    bool status4 = false;
    return (SizedBox(
      height: size.height * 0.4,
      width: size.width,
      //color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: size.height * 0.18,
                width: size.width * 0.45,
                padding: EdgeInsets.all(size.width * 0.025),
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
                child: Column(
                  children: [
                    Text(
                      "Socket 1",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "1250",
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontSize: 22,
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
              const Spacer(),
              Container(
                height: size.height * 0.18,
                width: size.width * 0.45,
                padding: EdgeInsets.all(size.width * 0.025),
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
                child: Column(
                  children: [
                    Text(
                      "Socket 2",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "1250",
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Material(
                      child: FlutterSwitch(
                        width: 70,
                        height: 35,
                        valueFontSize: 15.0,
                        toggleSize: 25.0,
                        value: status2,
                        borderRadius: 30.0,
                        padding: 8.0,
                        showOnOff: true,
                        activeColor: Colors.green,
                        onToggle: (val) {
                          print(val);
                          setState(() {
                            status2 = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                height: size.height * 0.18,
                width: size.width * 0.45,
                padding: EdgeInsets.all(size.width * 0.025),
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
                child: Column(
                  children: [
                    Text(
                      "Socket 3",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "1250",
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    FlutterSwitch(
                      width: 70,
                      height: 35,
                      valueFontSize: 15.0,
                      toggleSize: 25.0,
                      value: status3,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      activeColor: Colors.green,
                      onToggle: (val) {
                        setState(() {
                          status3 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: size.height * 0.18,
                width: size.width * 0.45,
                padding: EdgeInsets.all(size.width * 0.025),
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
                child: Column(
                  children: [
                    Text(
                      "Socket 4",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "1250",
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    FlutterSwitch(
                      width: 70,
                      height: 35,
                      valueFontSize: 15.0,
                      toggleSize: 25.0,
                      value: status4,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      activeColor: Colors.green,
                      onToggle: (val) {
                        setState(() {
                          status4 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
