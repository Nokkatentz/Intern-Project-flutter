// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app_intern/components/constants.dart';
import 'package:my_app_intern/page/Noti_Page.dart';
import 'package:my_app_intern/page/place_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

//สิ่งที่ต้องทำ พรุ่งนี้
/*
  - ทำให้หน้าอื่นๆ เป็นเหมือนกัน เหลือ place_page and room_page
*/

//---------------------GOBEL VARIABLE---------------------//
String selectcategory = '';
var iconcate = Icons.home; //เก็บ icon ไว้สำหรับการโชว์ใน pop up add place
List<dynamic> data = []; //keep data from web here

//ข้อมูลจำลองสำหรับการแกะ json
Map<String, Map<String, Map<String, List<dynamic>>>> demodata = {
  //demodata[0]
  "Home1": {
    "Room1": {
      "deviceR1_1": ["123456", "online"],
      "deviceR1_2": ["142536", "online"],
      "deviceR1_3": ["256341", "online"]
    },
    "Room2": {
      "deviceR2_1": ["789654", "online"],
      "deviceR2_2": ["586974", "online"],
      "deviceR2_3": ["496758", "offline"]
    },
  },
  "Home2": {
    "Room1": {
      "deviceR1_1": ["741258", "online"],
      "deviceR1_2": ["245871", "online"],
      "deviceR1_3": ["231458", "online"]
    },
    "Room2": {
      "deviceR2_1": ["765231", "online"],
      "deviceR2_2": ["124598", "offline"]
    },
    "Room3": {
      "deviceR3_1": ["253679", "offline"],
      "deviceR3_2": ["124598", "offline"],
      "deviceR3_3": ["253679", "offline"]
    }
  },
  "Home2": {
    "Room1": {
      "deviceR1_1": ["741258", "online"],
      "deviceR1_2": ["245871", "online"],
      "deviceR1_3": ["231458", "online"]
    },
    "Room2": {
      "deviceR2_1": ["765231", "online"],
      "deviceR2_2": ["124598", "offline"]
    },
    "Room3": {
      "deviceR3_1": ["253679", "offline"],
      "deviceR3_2": ["124598", "offline"],
      "deviceR3_3": ["253679", "offline"]
    }
  },
  "Home3": {
    "Room1": {
      "deviceR1_1": ["741258", "online"],
      "deviceR1_2": ["245871", "online"],
      "deviceR1_3": ["231458", "online"]
    },
    "Room2": {
      "deviceR2_1": ["765231", "online"],
      "deviceR2_2": ["124598", "offline"]
    },
    "Room3": {
      "deviceR3_1": ["253679", "offline"],
      "deviceR3_2": ["124598", "offline"],
      "deviceR3_3": ["253679", "offline"]
    }
  },
  "Home4": {
    "Room1": {
      "deviceR1_1": ["741258", "online"],
      "deviceR1_2": ["245871", "online"],
      "deviceR1_3": ["231458", "online"]
    },
  }
};

//ข้อมูลสำหรับ MAP สถานที่กับ Category
Map<String, String> mapcategory = {
  "Home1": "HOME",
  "Home2": "CONDO",
  "Home3": "WORKPLACE",
  "Home4": "OTHER"
};

//--------------------------------------------------------//
//-
//-
//-
//-
//-----------------------MAIN STATE-----------------------//
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TEST : GET DATA FROM WEB
  void _testGetData() async {
    //ต้องส่ง username and password ไปยัง server เพื่อร้องขอ data
    final url = Uri.parse("https://fakestoreapi.com/products/categories");
    http.Response respons = await http.get(url);
    List<dynamic> temp = await jsonDecode(respons.body); //change string to list

    data = temp;
    print(respons.statusCode);
    print(respons.body);
    print(data);
    print(data.runtimeType);
    print(data[0]);
    //String username = 'fd119a9b-f7b0-414f-9d4c-64fff52960ff';
    //String password = 'Tdtd6CQHAt6V9Ja2y6RcPGait495avyj';
    /*String basicAuth = 'Basic ' +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    print(basicAuth);
    Uri myUri =
        Uri.parse('https://api.netpie.io/v2/device/private?topic=socket01');

    http.Response r = await http.put(myUri,
        headers: <String, String>{'authorization': basicAuth},
        body: 'relay1_on');

    print(r.statusCode);
    print(r.body);*/

    //form old project
    /*int statusCode = 0;
    try {
      Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
      Map<String, String> headers = {"Content-type": "application/json"};
      //String json = '{"id": "$na"}';
      // get post delete put
      Response response = await post(url, headers: headers, body: json);
      statusCode = response.statusCode;
      Map<String, dynamic> temp = await jsonDecode(response.body);

      //name = na;
      //print(na);

      data = temp["msg"];
      print(data);
      print(statusCode);
    } catch (e) {
      print('Error!');
    }*/
  }

  //APP BAR HOME
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
                        Container(
                          height: abHeight.height * 0.4,
                          width: abWidth.width * 0.2,
                          alignment: Alignment.bottomCenter,
                          //color: Colors.red, //just chenk area
                          child: ImageIcon(
                            const AssetImage("assets/icons/Icon-Home-plus.png"),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: abHeight.height * 0.4,
                          ),
                        ),
                        Container(
                          height: abHeight.height * 0.4,
                          width: abWidth.width * 0.48,
                          padding:
                              EdgeInsets.only(bottom: abHeight.height * 0.02),
                          alignment: Alignment.bottomLeft,
                          //color: Colors.yellow, //just cheCk area
                          child: Text(
                            "HOME PLUS",
                            style: TextStyle(
                                fontSize: abWidth.width * 0.085,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
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
                          margin: EdgeInsets.only(left: abHeight.height * 0.15),
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
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SizedBox(
                        height: abHeight.height * 0.3,
                        width: abWidth.width * 0.2,
                        child: Material(
                          color: kNotiColor,
                          child: IconButton(
                            icon: Image.asset(
                              "assets/icons/noti-icon.png",
                              scale: abWidth.width * 0.02,
                            ),
                            onPressed: () {
                              print("Go to Noti page!");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Noti_Page();
                              }));
                            },
                          ),
                          //padding: EdgeInsets.all(16),
                          shape: const CircleBorder(),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  //BODY HOME
  Widget body(size) {
    Size bdHeight = size * 0.75, bdWidth = size;

    //CALL GET DATA FROM SERVER FUNCTION
    //_testGetData();

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
          //BODY FOR SHOW HOMEBOX
          ListView(
            children: [
              //CHECK DATA THAT IT"S NOT NULL FOR SHOW BOXHOME
              if (demodata != {}) ...{
                for (int i = 0; i < demodata.length; i++) ...{
                  homebox(
                      name: demodata.keys.toList()[i],
                      number: demodata[demodata.keys.toList()[i]]!
                          .length
                          .toString(),
                      homecate: mapcategory[mapcategory.keys.toList()[i]]),
                }
              } else ...{
                Container(
                  height: bdHeight.height * 0.45,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Don't have any place.",
                    style: TextStyle(
                        fontSize: bdHeight.height * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                )
              },
              SizedBox(
                height: size.height * 0.18,
                width: size.width,
                child: Container(),
              )
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
                  print("Show pop-up add home ");
                  selectcategory = 'HOME';
                  showPopupAdd(context);
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

  //MAIN BUILD
  @override
  Widget build(BuildContext context) {
    //TEST PRINT DATA FROM DEMODATA
    //-------------------------------------------------------------------------//
    //print(demodata[0]); //Display : list of demodata[0]
    //print(demodata[0].keys.toList()[0]); //Display : (Home1)

    print(demodata.keys.toList()[0]); //Display : Home1
    print(demodata[demodata.keys.toList()[0]]!
        .length); //Display : number of room in demodata.keys.toList()[0] => |Home1|
    print(demodata[demodata.keys.toList()[0]]
        ?.keys
        .toList()[0]); //Display : Room1

    print(demodata[demodata.keys.toList()[0]]![
            demodata[demodata.keys.toList()[0]]?.keys.toList()[0]]
        ?.keys
        .toList()[0]); //Display : deviceR1_1

    print(demodata['Home1']!['Room1']![
        'deviceR1_1']); //Display : [123456, online]

    print(mapcategory[mapcategory.keys.toList()[1]]);
    //-------------------------------------------------------------------------//

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

  //BOX HOME
  homebox({var name, var number, var homecate}) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.18,
        width: size.width,
        margin: EdgeInsets.only(bottom: size.height * 0.025),
        /*padding: EdgeInsets.only(
          left: size.width * 0.03,
          right: size.width * 0.03,
          top: size.height * 0.02,
          bottom: size.height * 0.02,
        ),*/
        decoration: const BoxDecoration(color: Colors.white,
            //borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 3,
                  spreadRadius: -5,
                  offset: Offset(0, 5))
            ]),
        //CAN SLIDE FOR EDITE OR DELETE
        child: Slidable(
          key: const ValueKey(0),
          // The end action pane is the one at the right or the bottom side.
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              //EDITE
              SlidableAction(
                // An action can be bigger than the others.
                //flex: 2,
                backgroundColor: const Color.fromARGB(255, 243, 212, 76),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
                onPressed: ((BuildContext context) {
                  //Show Edit pop-up
                  selectcategory = homecate;
                  var _iconcate;
                  if (homecate == 'HOME') {
                    _iconcate = Icons.home;
                  } else if (homecate == 'CONDO') {
                    _iconcate = Icons.weekend;
                  } else if (homecate == 'WORKPLACE') {
                    _iconcate = Icons.work_outlined;
                  } else if (homecate == 'OTHER') {
                    _iconcate = Icons.other_houses;
                  }
                  ;
                  showPopupEdit(
                      context, name, _iconcate, homecate); //show pop-up
                }),
              ),
              //DELETE
              SlidableAction(
                backgroundColor: const Color.fromARGB(255, 235, 55, 85),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                onPressed: ((BuildContext context) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => popupDelete(context),
                  );
                  //Show confirm delete pop-up
                  //Send order to server
                }),
              ),
            ],
          ),

          // BODY OF HOMEBOX
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  right: size.width * 0.03,
                  top: size.height * 0.02,
                  bottom: size.height * 0.02,
                ),
                child: Row(
                  children: [
                    //ICON CODITIONS
                    //HOME
                    if (homecate == 'HOME') ...{
                      Container(
                        height: size.height * 0.18,
                        width: size.width * 0.25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: (Icon(
                          Icons.home,
                          size: size.height * 0.1,
                        )),
                      ),
                      //CONDO
                    } else if (homecate == 'CONDO') ...{
                      Container(
                        height: size.height * 0.18,
                        width: size.width * 0.25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: (Icon(
                          Icons.weekend,
                          size: size.height * 0.1,
                        )),
                      ),
                      //WORKPLACE
                    } else if (homecate == 'WORKPLACE') ...{
                      Container(
                        height: size.height * 0.18,
                        width: size.width * 0.25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: (Icon(
                          Icons.work_outlined,
                          size: size.height * 0.1,
                        )),
                      ),
                      //OTHER
                    } else if (homecate == 'OTHER') ...{
                      Container(
                        height: size.height * 0.18,
                        width: size.width * 0.25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: (Icon(
                          Icons.other_houses,
                          size: size.height * 0.1,
                        )),
                      ),
                    },

                    /*Container(
                      height: size.height * 0.18,
                      width: size.width * 0.25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: (Icon(
                        Icons.home,
                        size: size.height * 0.1,
                      )),
                    ),*/

                    //VERTICAL LINE
                    Container(
                      height: size.height * 0.18,
                      width: size.width * 0.018,
                      margin: EdgeInsets.only(left: size.width * 0.025),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    //Detail
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
                            name, //get name
                            style: TextStyle(
                                fontSize: size.height * 0.038,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[400]),
                          ),
                          Row(
                            children: [
                              Text(
                                "จำนวนห้อง ", //get name
                                style: TextStyle(
                                    fontSize: size.height * 0.03,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.blue[300]),
                              ),
                              Text(
                                number, //get num
                                style: TextStyle(
                                    fontSize: size.height * 0.03,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.blue[300]),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //WHEN CLICK
              SizedBox(
                height: size.height * 0.18,
                width: size.width,
                //margin: EdgeInsets.only(bottom: size.height * 0.025),
                /*decoration: const BoxDecoration(
                  //color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),*/
                child: OutlinedButton(
                    /*style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),*/
                    onPressed: () {
                      //go to room page
                      print("Go to room page");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlacePage()),
                      );
                    },
                    child: Container()),
              ),
            ],
          ),
        ));
  }

  //CALL POPUP WHEN DELEDTE HOMEBOX FOR MAKE SURE
  Widget popupDelete(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
          height: size.height * 0.14,
          width: size.width * 0.4,
          //color: Colors.black,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Text(
            'Do you want to delete this?!',
            style: TextStyle(
                fontSize: size.height * 0.033,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )),
      actions: <Widget>[
        Container(
          height: size.height * 0.1,
          width: size.width * 0.8,
          //color: Colors.black,
          alignment: Alignment.center,
          child: Row(
            children: [
              SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.35,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _subpopupDelete(context),
                      );
                    },
                    child: const Text("OK",
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 28, 28),
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  )),
              SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.35,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text("CANCEL",
                        style: TextStyle(
                            color: Color.fromARGB(255, 65, 65, 65),
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _subpopupDelete(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
          height: size.height * 0.1,
          width: size.width * 0.5,
          //color: Colors.black,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.05,
          ),
          child: Text(
            'Delete Already!',
            style: TextStyle(
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )),
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
                  color: Color.fromARGB(255, 243, 76, 76),
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

  //CALL ADD POP UP
  void showPopupAdd(BuildContext context) {
    showDialog(context: context, builder: (context) => const ShowpopupAdd());
  }

  //CALL EDIT POP UP
  void showPopupEdit(
      BuildContext context, var name, var iconcate, String homecate) {
    showDialog(
        context: context,
        builder: (context) => ShowpopupEdit(
            oldname: name, oldicon: iconcate, oldhomecate: homecate));
  }
}

//--------------------------------------------------------//
//-
//-
//-
//-
//------------------STATE FOR ADD POP UP------------------//
class ShowpopupAdd extends StatefulWidget {
  const ShowpopupAdd({Key? key}) : super(key: key);

  @override
  State<ShowpopupAdd> createState() => _ShowpopupAddState();
}

class _ShowpopupAddState extends State<ShowpopupAdd> {
  //MAIN POP UP ADD PLACE
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
          "เพิ่มสถานที่", //get name
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
                      //print("current selectcategory: " + selectcategory);
                      category();
                    },
                    child: Row(
                      children: [
                        Icon(
                          iconcate,
                          size: 22,
                          color: Colors.blue[200],
                        ),
                        const Spacer(),
                        Text(
                          selectcategory, //have to elect category
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _subpopupAdd(context),
                  );
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

  Widget _subpopupAdd(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
          height: size.height * 0.1,
          width: size.width * 0.5,
          //color: Colors.black,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.05,
          ),
          child: Text(
            'Add Already!',
            style: TextStyle(
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )),
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

  //FUNCTION FOR SHOW CATEGORY
  void category() {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
              /*borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))*/
            ),
            alignment: Alignment.center,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(size.height * 0.05),
                  child: Column(
                    children: [
                      listTile(i: Icons.home, n: 'HOME'),
                      const SizedBox(height: 10),
                      listTile(i: Icons.weekend, n: 'CONDO'),
                      const SizedBox(height: 10),
                      listTile(i: Icons.work, n: 'WORKPLACE'),
                      const SizedBox(height: 10),
                      listTile(i: Icons.other_houses, n: 'OTHER'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  //FUNCTION FOR DETAIL IN CATEGORY
  ListTile listTile({required var i, required String n}) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            height: size.height * 0.09,
            width: size.width * 0.7,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.grey, width: 1.5)),
            padding: EdgeInsets.only(right: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  i,
                  size: 26,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  n,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          //print("before setstate:" + selectcategory);
          setState(() {
            selectcategory = n;
            iconcate = i;
          });
          //print("after setstate:" + selectcategory);

          Navigator.pop(context);
        });
  }
}

//--------------------------------------------------------//
//-
//-
//-
//-
//-------------------STATE FOR EDIT POP UP----------------//
class ShowpopupEdit extends StatefulWidget {
  String oldname; //get name for show it on name textfield
  var oldicon;
  String oldhomecate;

  ShowpopupEdit(
      {Key? key,
      required this.oldname,
      required this.oldicon,
      required this.oldhomecate})
      : super(key: key); //get this name

  @override
  State<ShowpopupEdit> createState() => _ShowpopupEditState();
}

class _ShowpopupEditState extends State<ShowpopupEdit> {
  //MAIN POP UP EDIT PLACE
  @override
  Widget build(BuildContext context) {
    //SET VALUE
    final String tempoldname =
        widget.oldname; //widget.name => call variable name in this state
    var tempoldicon = widget.oldicon;
    final String tempoldhomecate = widget.oldhomecate;
    print(tempoldname); // check name

    Size size = MediaQuery.of(context).size; //set size by size of device
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
          "แก้ไขสถานที่",
          style: TextStyle(
              fontSize: size.height * 0.035,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 243, 212, 76)),
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
              child: TextField(
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.only(top: 5, left: 10, right: 10),
                  hintText: tempoldname,
                  fillColor: const Color.fromARGB(255, 235, 235, 235),
                  filled: true,
                  hintStyle: const TextStyle(
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
                      category();
                    },
                    child: Row(
                      children: [
                        Icon(
                          tempoldicon,
                          size: 22,
                          color: Colors.blue[200],
                        ),
                        const Spacer(),
                        if (selectcategory == '') ...{
                          Text(
                            tempoldhomecate, //have to elect category
                            style: TextStyle(
                                fontSize: 22, color: Colors.blue[200]),
                          ),
                        } else ...{
                          Text(
                            selectcategory, //have to elect category
                            style: TextStyle(
                                fontSize: 22, color: Colors.blue[200]),
                          ),
                        },
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
                  color: Color.fromARGB(255, 243, 212, 76),
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _subpopupEdit(context),
                  );
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

  Widget _subpopupEdit(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
          height: size.height * 0.1,
          width: size.width * 0.5,
          //color: Colors.black,
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.05,
          ),
          child: Text(
            'Edit Already!',
            style: TextStyle(
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )),
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
                  color: Color.fromARGB(255, 243, 212, 76),
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

  //FUNCTION FOR SHOW CATEGORY
  void category() {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              /*borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))*/
            ),
            alignment: Alignment.center,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(size.height * 0.05),
                  child: Column(
                    children: [
                      listTile(i: Icons.home, n: 'HOME'),
                      const SizedBox(height: 10),
                      listTile(i: Icons.weekend, n: 'CONDO'),
                      const SizedBox(height: 10),
                      listTile(i: Icons.work, n: 'WORKPLACE'),
                      const SizedBox(height: 10),
                      listTile(i: Icons.other_houses, n: 'OTHER'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  //FUNCTION FOR DETAIL IN CATEGORY
  ListTile listTile({required var i, required String n}) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            height: size.height * 0.09,
            width: size.width * 0.7,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.grey, width: 1.5)),
            padding: EdgeInsets.only(right: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  i,
                  size: 26,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  n,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          //print("before setstate:" + selectcategory);
          setState(() {
            selectcategory = n;
            iconcate = i;
          });
          //print("after setstate:" + selectcategory);

          Navigator.pop(context);
        });
  }
}
//--------------------------------------------------------//
