import 'dart:math';

import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ScreenUserAbout extends StatefulWidget {
  ScreenUserAbout({Key? key}) : super(key: key);

  @override
  _ScreenUserAboutState createState() => _ScreenUserAboutState();
}

class _ScreenUserAboutState extends State<ScreenUserAbout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink,

          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 18,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Contact Us",
            style: TextStyle(color: Colors.white),
          ),
          // elevation: 3,
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              // Image.asset("assets/images/1.png"),
              Align(
                alignment: Alignment.center,
                child: RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Tech ",
                      style: heading1_style.copyWith(color: Colors.deepPurple, fontFamily: 'Comfortaa'),
                    ),
                    TextSpan(
                      text: "Jobs",
                      style: heading1_style.copyWith(color: Color(0xFF171717), fontFamily: 'Comfortaa'),
                    ),
                  ]
                ),


                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Help protect your website and its users with clear and fair website terms and conditions.",
                    style: normal_h2Style,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Version",
                      style: normal_h2Style_bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("1.0.1"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Powered by",
                      style: normal_h2Style_bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Shikaafi's Innovation & Technologies Ltd",
                      style: normal_h3Style,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Contact us",
                      style: normal_h2Style_bold,
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Image(
                  width: 20.sp,
                  height: 20.sp,
                  image: AssetImage("assets/images/img_webLink.png"),
                ),
                onTap: () {
                  launcher.launchUrl(
                    Uri.parse("https://www.techjobs.tech/contact-us"),
                    mode: launcher.LaunchMode.externalApplication,
                  );
                },
                title: Text(
                  "https://www.techjobs.tech",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              ListTile(
                leading: Image(
                  width: 20.sp,
                  height: 20.sp,
                  image: AssetImage("assets/images/img_gmail.png"),
                ),
                onTap: () {
                  launcher.launchUrl(
                    Uri.parse("mailto:support@techjobs.tech"),
                    mode: launcher.LaunchMode.externalApplication,
                  );
                },
                title: Text(
                  "support@techjobs.tech",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              ListTile(
                leading: Image(
                  width: 20.sp,
                  height: 20.sp,
                  image: AssetImage("assets/images/whatsapp.png"),
                ),
                onTap: () {
                  launcher.launchUrl(
                    Uri.parse("https://wa.me/+441258927052"),
                    mode: launcher.LaunchMode.externalApplication,
                  );
                },
                title: Text(
                  "+44 1258 927052",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
