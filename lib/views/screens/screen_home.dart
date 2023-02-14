import 'dart:developer';
import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_jobs/views/screens/screen_terms_and_conditions.dart';
import 'package:tech_jobs/views/screens/screen_user_about.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../controllers/my_controllers.dart';
import 'main_screen.dart';

class BottomNavigatorExample extends StatefulWidget {
  @override
  State<BottomNavigatorExample> createState() => _BottomNavigatorExampleState();
}

class _BottomNavigatorExampleState extends State<BottomNavigatorExample> {
  String initialUrl = 'https://techjobs.website/home-3';
  bool bac = false;
  bool far = false;
 bool isloading =false;
  var controller1 = Get.put(MyControllers());
  late WebViewController webViewController;
  int index=0;
  final List<String> currentUrl = [
    'https://techjobs.website/home-3',
    'https://techjobs.website/?s=&post_type=projects',
    'https://techjobs.website/services/',
    'https://techjobs.website/?s=&post_type=sellers',
  ];
  final _key = UniqueKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xffffffff),
        child: Column(
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // Image.asset("assets/images/splash.png"),
                  SizedBox(
                    height: 6,
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                            wordSpacing: 2,
                          ),
                          children: [
                            TextSpan(
                              text: 'Tech',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 23.sp,
                              ),
                            ),
                            TextSpan(
                              text: 'Jobs',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23.sp,
                              ),
                            ),
                          ])),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: 'Shikafi Innovation ',
                            ),
                            TextSpan(
                                text: '& ',
                                style: TextStyle(
                                    color: Colors.pink.withOpacity(.4),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: 'Technology',
                            ),
                          ])),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: ListTile(
                      trailing: Container(
                          decoration: BoxDecoration(
                            color: Colors.pink.withOpacity(.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 4, horizontal: 12),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 12,
                          )),
                      title: Text('Contact us.'),
                      onTap: () {
                        setState(()  {
                          Get.to(ScreenUserAbout());
                          // await _webViewController1.loadUrl(currentUrl[2]);
                          // Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                  // Text('Shikafi Innovation & Technology',style: TextStyle(
                  //   color: Colors.black,fontSize: 12,
                  // ),),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal:16.w),
                      child: Divider(color: Colors.black,height: 2,)
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // color: Colors.pink.withOpacity(.2),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: ListTile(
                          title: Text('Dashboard'),
                          leading: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
                              child: Icon(
                                Icons.dashboard,
                                color: Colors.pink.withOpacity(.4),
                                size: 16,
                              )),
                          onTap: () {
                            Get.to(MainScreen(initialUrl: 'https://techjobs.website/frontend-dashboard/?fed=dashboard', title: 'Dashboard',));
                            // webViewController.loadUrl('https://techjobs.website/frontend-dashboard/?fed=dashboard');
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      // color: Colors.pink.withOpacity(.2),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: ListTile(
                          onTap:() async {
                            Get.to(MainScreen(initialUrl: 'https://techjobs.website/sellers/dodnickigmail-com/', title: 'Public profile view',));
                            // await  webViewController.loadUrl('https://techjobs.website/sellers/dodnickigmail-com/');
                            // Get.back();
                          },
                          title: Text('Public profile view'),
                          leading: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
                              child: Icon(
                                Icons.groups,
                                color: Colors.pink.withOpacity(.4),
                                size: 16,
                              )),
                          // onTap: () {
                          //   // Get.off(ScreenAdminDashboard());
                          //   Navigator.pop(context);
                          // },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      // color: Colors.pink.withOpacity(.2),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: ListTile(
                          title: Text('Tutorials'),
                          leading: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
                              child: Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.pink.withOpacity(.4),
                                size: 16,
                              )),
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Are you sure?',
                              content: Text(
                                  'Do you want to exit the app and open the link in a browser?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    launch('https://youtube.com/@shikaafisengineeringtechnologi');
                                    Get.back();
                                  },
                                  child: Text('Yes'),
                                ),
                              ],
                            );
                            // Get.to(MainScreen(initialUrl: 'https://youtube.com/@shikaafisengineeringtechnologi', title: 'Tutorials',));
                            // Get.off(ScreenAdminDashboard());
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      // color: Colors.pink.withOpacity(.2),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: ListTile(
                          title: Text('Terms and Conditions'),
                          leading: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
                              child: Icon(
                                Icons.home,
                                color: Colors.pink.withOpacity(.4),
                                size: 16,
                              )),
                          onTap: () {
                            Get.to(ScreenTermsAndConditions());
                            // Get.off(ScreenAdminDashboard());
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal:20.w),
                child: Divider(color: Colors.black,height: 2,)
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.w),
              child: ListTile(
                onTap:() {
                  webViewController!.loadUrl('https://techjobs.website/wp-login.php?action=logout&redirect_to=https%3A%2F%2Ftechjobs.website&_wpnonce=3a504cae0f');
                  Get.back();

                  // Get.off(Login(url:'https://techjobs.website/wp-login.php?action=logout&redirect_to=https%3A%2F%2Ftechjobs.website&_wpnonce=3a504cae0f',));
                  // webViewController.loadUrl('https://techjobs.website/wp-login.php?action=logout&redirect_to=https%3A%2F%2Ftechjobs.website&_wpnonce=3a504cae0f');
                  // Navigator.pop(context);
                },
                leading: Icon(Icons.exit_to_app,color: Colors.pink.withOpacity(.4),),
                title: Text('Logout',style: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18
                )),
              ),
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor:Colors.pink,
        title: Text('Tech Jobs'),
        actions: [
          IconButton(onPressed: (){
            webViewController!.reload();
          }, icon: Icon(Icons.refresh)),
          IconButton(onPressed: () async {
            if (await webViewController!.canGoBack()) {
            webViewController!.goBack();
           setState(() {
             bac=true;
           });
            }
            else{
              setState(() {
                bac=false;
              });
            }
            // webViewController!.reload();
          }, icon: Icon(Icons.arrow_back,color: bac?Colors.white:Colors.grey,)),
          IconButton(onPressed: ()async {
            if (await webViewController!.canGoForward()) {
              webViewController!.goForward();
              setState(() {
                far=true;
              });
            }
            else{
              setState(() {
                far=false;
              });
            }
            // webViewController!.reload();
          }, icon: Icon(Icons.arrow_forward,color: far?Colors.white:Colors.grey,)),
        ],
      ),
key: _scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButton: SizedBox(
        height: 30,
        width: 30,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
          children: [
            WillPopScope(
              onWillPop: () async {
                if (await webViewController!.canGoBack()) {
                  webViewController!.goBack();
                  return true;
                }
                return false;
              },
              child:WebView(
                gestureNavigationEnabled: true,
                zoomEnabled: false,
                navigationDelegate: (request) async {
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
                  return nav
                      ? NavigationDecision.navigate
                      : NavigationDecision.prevent;
                },
                key: widget.key,
                // initialUrl: 'https://safestore.tech',
                initialUrl: 'https://techjobs.website/home-3',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController controller) {
                  webViewController = controller;
                },
                onPageStarted: (String url) async {
                  isloading = true;
                },
                onWebResourceError: (value) async {
                  isloading = false;
                },
                onPageFinished: (String url) async {
                  isloading = false;
                setState(() async {
                  await ( webViewController!.canGoForward())?far=true:far=false;
                  await ( webViewController!.canGoBack())?bac=true:bac=false;
                });
                },
                onProgress: (value) {
                  setState(() {
                    var progress = value;
                    if (progress == 80) {
                      setState(() {
                        isloading = false;
                      });
                    }
                  });
                },
              ),
            ),
            (index == 0)? Visibility(
              visible: isloading,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[100],
                child: Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Colors.white10,
                  enabled: true,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            height: 40.sp,
                            width: 40.sp,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 3.h,
                          width: MediaQuery.of(context).size.width-8.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            // shape: BoxShape.circle
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 3.h,
                          width: MediaQuery.of(context).size.width-10.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),

                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 3.h,
                          width: MediaQuery.of(context).size.width-8.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 3.h,
                          width: MediaQuery.of(context).size.width-40.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          height: 40.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ):
            (index == 1)? Visibility(
              visible: isloading,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[100],
                child: Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Colors.white10,
                  enabled: true,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          // height: 100.h,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 2,color: Colors.white)
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 100.sp,
                                width: 100.sp,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                 shape: BoxShape.circle
                                ),
                              ),
                              SizedBox(height: 4.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 18.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 6.h,
                                width: 22.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          height: 100.h,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2,color: Colors.white)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 30.sp,
                                width: 30.sp,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 4.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 4.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 4.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 18.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 4.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 6.h,
                                width: 22.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ):
            (index == 2)?Visibility(
              visible: isloading,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[100],
                child: Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Colors.white10,
                  enabled: true,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(3.h),
                          height: 100.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2,color: Colors.white)
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(3.h),
                                  height: 35.h,
                                  // margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white
                                    // border: Border.all(width: 2,color: Colors.white)
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 3.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    height: 10.sp,
                                    width: 40.sp,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 6.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Container(
                                    height: 6.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 6.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ],
                          )
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(3.h),
                          height: 100.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2,color: Colors.white)
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(3.h),
                                height: 35.h,
                                // margin: EdgeInsets.symmetric(horizontal: 4.w),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  // border: Border.all(width: 2,color: Colors.white)
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 3.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    height: 10.sp,
                                    width: 40.sp,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 3.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 6.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Container(
                                    height: 6.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ):
            Visibility(
              visible: isloading,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[100],
                child: Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Colors.white10,
                  enabled: true,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          height: 40.h,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2,color: Colors.white)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                ],
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 8.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          height: 40.h,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2,color: Colors.white)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                ],
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 8.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          height: 40.h,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2,color: Colors.white)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                ],
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 8.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          height: 40.h,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2,color: Colors.white)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 3.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(height: 3.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                  Icon(Icons.star,color: Colors.white,),
                                ],
                              ),
                              SizedBox(height: 3.h,),
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 6.w),
                                height: 8.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Visibility(
            //   visible: isloading,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height,
            //     width: MediaQuery.of(context).size.width,
            //     color: Colors.white,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //        Image.asset('assets/images/welcome.png'),
            //         AnimatedTextKit(
            //           animatedTexts: [
            //             WavyAnimatedText('Welcome',
            //                 textStyle: TextStyle(
            //                   color: Colors.pink,
            //                   fontSize: 30,
            //                   fontWeight: FontWeight.bold
            //                 )),
            //             WavyAnimatedText('To',
            //                 textStyle: TextStyle(
            //                     color: Colors.pink,
            //                   fontSize: 30,
            //                     fontWeight: FontWeight.bold
            //                 )),
            //             WavyAnimatedText('Tech Jobs',
            //                 textStyle: TextStyle(
            //                     color: Colors.pink,
            //                   fontSize: 30,
            //                     fontWeight: FontWeight.bold
            //                 )),
            //           ],
            //           repeatForever: true,
            //           onTap: () {
            //             print("Tech Jobs");
            //           },
            //         ),
            //         // Text('Welcome'),
            //       ],
            //     ),
            //   ),
            // )
          ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:Colors.pink,
        unselectedItemColor:Colors.grey,
        unselectedLabelStyle: TextStyle(
            fontSize: 10.sp
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex:index,
        onTap: (newIndex){
          setState(() {
            index=newIndex;
            // isloading=true;
            webViewController.loadUrl(currentUrl[index]);
            controller1.update();
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem( icon: Icon(Icons.dashboard),label: "FindWork"),
          BottomNavigationBarItem(icon: Icon(Icons.store),label: "Gigs"),
          BottomNavigationBarItem(icon: Icon(Icons.handyman_rounded),label: "Talent"),
          // BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Account"),
        ],),

    );
  }
}
class MenuItem {
  String title;
  IconData icon;
  MenuItem(this.icon, this.title);
}
