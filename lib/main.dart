import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app_intern/page/device_page/doorlock_page.dart';
import 'package:my_app_intern/page/device_page/lineswitch_page.dart';
import 'package:my_app_intern/page/device_page/plug_page.dart';
import 'package:my_app_intern/page/home_page.dart';
import 'package:my_app_intern/page/login_Page.dart';
import 'package:my_app_intern/page/Pre_Login.dart';
import 'package:my_app_intern/page/place_page.dart';
import 'package:my_app_intern/page/room_page.dart';
import 'package:device_info/device_info.dart'; //for check android version

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> checkAndroidVersion() async {
      if (Platform.isAndroid) {
        var androidInfo = await DeviceInfoPlugin().androidInfo;
        var release = androidInfo.version.release;
        var sdkInt = androidInfo.version.sdkInt;
        var manufacturer = androidInfo.manufacturer;
        var model = androidInfo.model;
        print('Android $release (SDK $sdkInt), $manufacturer $model');
        // Android 9 (SDK 28), Xiaomi Redmi Note 7
      }
    }

    checkAndroidVersion();

    return const MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
