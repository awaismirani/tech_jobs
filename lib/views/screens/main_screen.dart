import 'dart:async';

import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../controllers/my_controllers.dart';

class MainScreen extends StatefulWidget {
  String initialUrl;
  String title;
  MainScreen({required this.initialUrl,required this.title});

  @override
  _MainScreenState createState() => _MainScreenState();
}
late WebViewController _webViewController1;
class _MainScreenState extends State<MainScreen> {
  var controller1 = Get.put(MyControllers());
var userName;
  var password;
  final _key = UniqueKey();
  bool bac=false;
  bool far=false;
  bool isLoading = false;
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  void initState() {
    getdata();
    super.initState();
  }
  Future<void> getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName= prefs.getString('username');
    password= prefs.getString('password');
    print('userName: $userName');
    print('password: $password');
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(widget.title),
          leading:  IconButton(onPressed: () async {
            // if (await _webViewController1.canGoBack()) {
            // _webViewController1.goBack();
            // }
            // else {
            Get.back();
            // }
          }, icon: Icon(Icons.arrow_back),),
          actions: [
            IconButton(onPressed: () async {
              _webViewController1.reload();
            }, icon: Icon(Icons.refresh),),
          ],
         ),
        body: Stack(
            children: [
              WillPopScope(
                onWillPop: () async {
                  if (await _webViewController1.canGoBack()) {
                    _webViewController1.goBack();
                    return false;
                  }
                  return true;
                },
                child:  WebView(
                  initialUrl: widget.initialUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) async {
                    _controller.complete(webViewController);
                    _webViewController1=webViewController;
                  },
                  javascriptChannels: Set.from([
                    JavascriptChannel(
                        name: 'GetLoginDetails',
                        onMessageReceived: (JavascriptMessage message) {
                          // String username1 = message.message;
                          // String password1 = "password"; // replace with actual password
                          saveLoginDetails(userName, password);
                        }),
                  ]),
                  navigationDelegate: (NavigationRequest request) async {
                    bool nav = true;
                    if (request.url.contains('techjobs')) {
                      // controller1.update();
                      setState(() {
                        nav = true;
                      });
                    }
                    else {
                      bool confirm = await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Are you sure?'),
                          content: Text(
                              'Do you want to exit the app and open the link in a browser?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text('Yes'),
                            ),
                          ],
                        ),
                      );
                      if (confirm) {
                        await launch(
                          request.url,
                        );
                        SystemNavigator.pop();
                      }
                    }
                    if (request.url.startsWith("https://techjobs.website/my-account/")) {
                      WebViewController controller = await _controller.future;
                      String username = await controller.evaluateJavascript(
                          "document.getElementById('user_login').value");
                      String password = await controller.evaluateJavascript(
                          "document.getElementById('user_pass').value");
                      saveLoginDetails(username, password);
                      print('UserName : $username');
                      print('Password : $password');
                    }
                    return nav
                        ? NavigationDecision.navigate
                        : NavigationDecision.prevent;

                  },
                  onPageStarted: (url){
                    setState(() {
                      isLoading=true;
                    });
                  },
                  onPageFinished: (url){
                    setState(() {
                      isLoading=false;
                    });
                  },
                ),
              ),
              Visibility(
                visible: isLoading,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Shimmer.fromColors(
                    baseColor: Colors.red.withOpacity(.3),
                    // (controller1.page.value == 0)
                    //     ? Colors.black12
                    //     : (controller1.page.value == 1)
                    //     ? Colors.red
                    //     : (controller1.page.value == 2)
                    //     ? Colors.yellow
                    //     : Colors.white10,
                    highlightColor: Colors.white,
                    // (controller1.page.value == 0)
                    //     ? Colors.white10
                    //     : (controller1.page.value == 1)
                    //     ? Colors.cyan
                    //     : (controller1.page.value == 2)
                    //     ? Colors.red
                    //     : Colors.black12,
                    enabled: true,
                    child: SingleChildScrollView(
                      child: (widget.title=='Dashboard')?Column(
                        children: [
                          Container(
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              // color: Colors.greenAccent,
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 3.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 40.sp,
                                  width: 40.sp,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    // borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.sp),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 53.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ):Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 2.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 40.w,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(12),
                                 ),
                                ),
                                Container(
                                 padding: EdgeInsets.all(25.sp),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    // borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 3.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Stack(
                            children: [
                              Container(
                              height: 55.h,
                              child: Container(
                                height: 30.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                              Positioned(
                                top: 30.h,
                                child: Container(
                                  height: 30.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ]
                          ),
                          SizedBox(height: 2.h,),
                          Container(
                            height: 3.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                               padding: EdgeInsets.all(20.sp),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                    shape: BoxShape.circle                                ),
                              ),
                              SizedBox(width: 3.w,),
                              Container(
                                padding: EdgeInsets.all(20.sp),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                    shape: BoxShape.circle                                ),
                              ),
                              SizedBox(width: 3.w,),
                              Container(
                                padding: EdgeInsets.all(20.sp),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h,),
                          Container(
                            height: 3.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ),
            ]),

      ),
    );
  }
  void saveLoginDetails(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   // var name= prefs.getString("username") ;
   //  var pas=  prefs.getString("password");
       if ((username != null ||  username != '') && (password != null || password != '')) {
         prefs.setString("username", username) ;
         prefs.setString("password", password);
       }  
  }
}
