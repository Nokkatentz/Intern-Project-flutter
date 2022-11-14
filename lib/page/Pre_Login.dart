import 'package:my_app_intern/page/login_Page.dart';
import 'package:my_app_intern/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:my_app_intern/page/home_page.dart';
import 'package:flutter/services.dart';
import 'package:my_app_intern/page/Register_page.dart';

class Pre_Login extends StatefulWidget {
  const Pre_Login({Key? key}) : super(key: key);

  @override
  State<Pre_Login> createState() => _Pre_LoginState();
}

Widget bulidLoginBtn(BuildContext context) {
  return ButtonTheme(
    minWidth: 240,
    height: 40,
    child: RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: kTertiaryColor,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login_Page();
        }));
      },
      child: const Text(
        "LOG IN",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget bulidRegisterBtn(BuildContext context) {
  return ButtonTheme(
    minWidth: 240,
    height: 40,
    child: RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: kSecondaryColor,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Register();
        }));
      },
      child: const Text(
        "Register",
        style: TextStyle(
            color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class _Pre_LoginState extends State<Pre_Login> {
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
                  child: Container(
                    height: size.height,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/icons/Icon-Home-plus.png",
                          height: size.height * 0.35,
                        ),
                        const Text(
                          "HOME PLUS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        bulidLoginBtn(context),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        bulidRegisterBtn(context),
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
