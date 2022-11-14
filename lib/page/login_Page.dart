import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_app_intern/page/home_page.dart';
import 'package:my_app_intern/components/constants.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

var new_user;
var new_password;
var local_user = "test";
var local_password = "000000";

Widget buildForgotPasswordBtn() {
  return Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 40),
    child: TextButton(
      onPressed: () => print("Forgot Password Pressed"),
      child: const Text(
        "Forgot Password ?",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buildRegisterBtn() {
  return Container(
    child: TextButton(
      onPressed: () => print("Register"),
      child: const Text(
        "Register",
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class _Login_PageState extends State<Login_Page> {
  get mainAxisAlignment => null;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool AutovalidateMode = true;
  void validate() {
    if (formkey.currentState!.validate()) {
      print("validated");
    } else {
      print("Not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Form(
                    /*height: size.height,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                    ),*/

                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/icons/Icon-Home-plus.png",
                          height: size.height * 0.25,
                        ),
                        const Text(
                          "HOME PLUS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6,
                                          offset: Offset(0, 2))
                                    ]),
                                height: 45,
                                width: 240,
                                child: TextFormField(
                                  validator: RequiredValidator(
                                      errorText: "Please Input Username"),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    setState(() {
                                      new_user = value.toString();
                                    });
                                  },
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 30),
                                    hintText: "USER NAME",
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
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6,
                                          offset: Offset(0, 2))
                                    ]),
                                height: 45,
                                width: 240,
                                child: TextFormField(
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "Please Input Password"),
                                    MinLengthValidator(6,
                                        errorText:
                                            "Should be at least 6 charecter")
                                  ]),
                                  keyboardType: TextInputType.visiblePassword,
                                  onChanged: (value1) {
                                    setState(() {
                                      new_password = value1.toString();
                                    });
                                  },
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 30),
                                    hintText: "PASSWORD",
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
                        buildForgotPasswordBtn(),
                        ButtonTheme(
                          minWidth: 180,
                          height: 40,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: kTertiaryColor,
                            onPressed: () {
                              //formkey.currentState?.save();
                              validate();
                              print(new_user);
                              print(new_password);
                              if (new_user == local_user &&
                                  new_password == local_password) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                                //formkey.currentState?.reset();
                              }
                              if (new_user != local_user &&
                                  new_password == local_password) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Username is uncorrect!"),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text("OK"))
                                          ],
                                        ));
                              }
                              if (new_user == local_user &&
                                  new_password != local_password) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Password is uncorrect!"),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text("OK"))
                                          ],
                                        ));
                              }
                              if (new_user != local_user &&
                                  new_password != local_password) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(
                                              "Username and Password is uncorrect!"),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text("OK"))
                                          ],
                                        ));
                              }
                            },
                            child: const Text(
                              "LOG IN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Text(
                          "Log in With",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Image.asset(
                                    "assets/icons/google-icon.png",
                                    height: size.height * 0.04)),
                            SizedBox(
                              width: size.width * 0.15,
                            ),
                            Container(
                              child: Image.asset("assets/icons/facebook.png",
                                  height: size.height * 0.04),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "You don't have an account ?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(child: buildRegisterBtn()),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
