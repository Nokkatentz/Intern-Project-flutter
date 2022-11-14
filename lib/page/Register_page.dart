import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:my_app_intern/components/constants.dart';
import 'package:my_app_intern/page/login_Page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

Widget buildFontRegister() {
  return Text(
    "Register",
    style: TextStyle(
        color: kPrimaryColor, fontSize: 60, fontWeight: FontWeight.bold),
  );
}

Widget buildInputBox(BuildContext context) {
  double BtwBox = 25;
  return Container(
    height: 550,
    width: 390,
    child: Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black45,
                blurRadius: 3,
                spreadRadius: -5,
                offset: Offset(0, 5))
          ]),
      child: SizedBox(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: BtwBox,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text("User Name:",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kSecondaryColor,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SingleChildScrollView(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 6,
                                                offset: Offset(0, 2))
                                          ]),
                                      height: 40,
                                      width: 240,
                                      child: const TextField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 3, left: 30),
                                          hintText: "User Name",
                                          hintStyle: TextStyle(
                                              color: Colors.black12,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: BtwBox,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                            ),
                            Text("Email:",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kSecondaryColor,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SingleChildScrollView(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 6,
                                                offset: Offset(0, 2))
                                          ]),
                                      height: 40,
                                      width: 240,
                                      child: const TextField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 3, left: 30),
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.black12,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: BtwBox,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                            ),
                            Text("Password:",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kSecondaryColor,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SingleChildScrollView(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 6,
                                                offset: Offset(0, 2))
                                          ]),
                                      height: 40,
                                      width: 200,
                                      child: const TextField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 3, left: 30),
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.black12,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: BtwBox),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text("Confirm Password:",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: kSecondaryColor,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SingleChildScrollView(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 6,
                                                offset: Offset(0, 2))
                                          ]),
                                      height: 40,
                                      width: 200,
                                      child: const TextField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 3, left: 30),
                                          hintText: "Confirm Password",
                                          hintStyle: TextStyle(
                                              color: Colors.black12,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        bulidSubmitBtn(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget bulidSubmitBtn(BuildContext context) {
  return ButtonTheme(
    minWidth: 200,
    height: 40,
    child: SingleChildScrollView(
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: kSecondaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Login_Page();
          }));
        },
        child: const Text(
          "Register",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Scaffold(
          backgroundColor: kSecondaryColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      height: size.height,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          buildFontRegister(),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          buildInputBox(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
