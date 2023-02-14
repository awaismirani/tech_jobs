// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:custom_utils/custom_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:tech_jobs/views/screens/screen_terms_and_conditions.dart';
// import 'package:tech_jobs/views/screens/screen_user_about.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../../controllers/my_controllers.dart';
// import 'login.dart';
// import 'main_screen.dart';
//
// class ScreenWebview extends StatefulWidget {
//   String initialUrl;
//   Key? key;
//   WebViewController? webViewController1;
//
//   ScreenWebview({required this.initialUrl, required this.key,required this.webViewController1});
//
//   @override
//   _ScreenWebviewState createState() => _ScreenWebviewState();
// }
//
// class _ScreenWebviewState extends State<ScreenWebview> {
//   bool bac = false;
//   bool far = false;
//   var controller1 = Get.put(MyControllers());
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   // late WebViewController webViewController1;
//   // @override
// //   void initState() {
// // // widget.webViewController1!.reload();
// // super.initState();
// //   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: Drawer(
//         backgroundColor: Color(0xffffffff),
//         child: Column(
//           // Important: Remove any padding from the ListView.
//           // padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color(0xffffffff),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // Image.asset("assets/images/splash.png"),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   RichText(
//                       text: TextSpan(
//                           style: TextStyle(
//                             wordSpacing: 2,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: 'Tech',
//                               style: TextStyle(
//                                 color: Colors.deepPurple,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 23.sp,
//                               ),
//                             ),
//                             TextSpan(
//                               text: 'Jobs',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 23.sp,
//                               ),
//                             ),
//                           ])),
//                   RichText(
//                       text: TextSpan(
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: 'Shikafi Innovation ',
//                             ),
//                             TextSpan(
//                                 text: '& ',
//                                 style: TextStyle(
//                                     color: Colors.pink.withOpacity(.4),
//                                     fontWeight: FontWeight.bold)),
//                             TextSpan(
//                               text: 'Technology',
//                             ),
//                           ])),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 14.0),
//                     child: ListTile(
//                       trailing: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.pink.withOpacity(.2),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 4, horizontal: 12),
//                           child: Icon(
//                             Icons.arrow_forward_ios,
//                             color: Colors.white,
//                             size: 12,
//                           )),
//                       title: Text('Contact us.'),
//                       onTap: () {
//                         setState(()  {
//                           Get.to(ScreenUserAbout());
//                           // await _webViewController1.loadUrl(currentUrl[2]);
//                           // Navigator.pop(context);
//                         });
//                       },
//                     ),
//                   ),
//                   // Text('Shikafi Innovation & Technology',style: TextStyle(
//                   //   color: Colors.black,fontSize: 12,
//                   // ),),
//                   Padding(
//                       padding: EdgeInsets.symmetric(horizontal:16.w),
//                       child: Divider(color: Colors.black,height: 2,)
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       // color: Colors.pink.withOpacity(.2),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 14.0),
//                         child: ListTile(
//                           title: Text('Dashboard'),
//                           leading: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 4, horizontal: 12),
//                               child: Icon(
//                                 Icons.dashboard,
//                                 color: Colors.pink.withOpacity(.4),
//                                 size: 16,
//                               )),
//                           onTap: () {
//                             Get.to(MainScreen(initialUrl: 'https://techjobs.website/frontend-dashboard/?fed=dashboard', title: 'Dashboard',));
//                             // webViewController.loadUrl('https://techjobs.website/frontend-dashboard/?fed=dashboard');
//                             // Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     Container(
//                       // color: Colors.pink.withOpacity(.2),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 14.0),
//                         child: ListTile(
//                           onTap:() async {
//                             Get.to(MainScreen(initialUrl: 'https://techjobs.website/sellers/dodnickigmail-com/', title: 'Public profile view',));
//                             // await  webViewController.loadUrl('https://techjobs.website/sellers/dodnickigmail-com/');
//                             // Get.back();
//                           },
//                           title: Text('Public profile view'),
//                           leading: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 4, horizontal: 12),
//                               child: Icon(
//                                 Icons.groups,
//                                 color: Colors.pink.withOpacity(.4),
//                                 size: 16,
//                               )),
//                           // onTap: () {
//                           //   // Get.off(ScreenAdminDashboard());
//                           //   Navigator.pop(context);
//                           // },
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     Container(
//                       // color: Colors.pink.withOpacity(.2),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 14.0),
//                         child: ListTile(
//                           title: Text('Tutorials'),
//                           leading: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 4, horizontal: 12),
//                               child: Icon(
//                                 Icons.bookmark_border_outlined,
//                                 color: Colors.pink.withOpacity(.4),
//                                 size: 16,
//                               )),
//                           onTap: () {
//                             Get.defaultDialog(
//                               title: 'Are you sure?',
//                               content: Text(
//                                   'Do you want to exit the app and open the link in a browser?'),
//                               actions: <Widget>[
//                                 TextButton(
//                                   onPressed: () {
//                                     Get.back();
//                                   },
//                                   child: Text('No'),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     launch('https://youtube.com/@shikaafisengineeringtechnologi');
//                                  Get.back();
//                                   },
//                                   child: Text('Yes'),
//                                 ),
//                               ],
//                             );
//                             // Get.to(MainScreen(initialUrl: 'https://youtube.com/@shikaafisengineeringtechnologi', title: 'Tutorials',));
//                             // Get.off(ScreenAdminDashboard());
//                             // Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     Container(
//                       // color: Colors.pink.withOpacity(.2),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 14.0),
//                         child: ListTile(
//                           title: Text('Terms and Conditions'),
//                           leading: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 4, horizontal: 12),
//                               child: Icon(
//                                 Icons.home,
//                                 color: Colors.pink.withOpacity(.4),
//                                 size: 16,
//                               )),
//                           onTap: () {
//                             Get.to(ScreenTermsAndConditions());
//                             // Get.off(ScreenAdminDashboard());
//                             // Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: SizedBox(
//               ),
//             ),
//             Padding(
//                 padding: EdgeInsets.symmetric(horizontal:20.w),
//                 child: Divider(color: Colors.black,height: 2,)
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal:20.w),
//               child: ListTile(
//                 onTap:() {
//                   widget.webViewController1!.loadUrl('https://techjobs.website/wp-login.php?action=logout&redirect_to=https%3A%2F%2Ftechjobs.website&_wpnonce=3a504cae0f');
//                   Get.back();
//
//                   // Get.off(Login(url:'https://techjobs.website/wp-login.php?action=logout&redirect_to=https%3A%2F%2Ftechjobs.website&_wpnonce=3a504cae0f',));
//                   // webViewController.loadUrl('https://techjobs.website/wp-login.php?action=logout&redirect_to=https%3A%2F%2Ftechjobs.website&_wpnonce=3a504cae0f');
//                   // Navigator.pop(context);
//                 },
//                 leading: Icon(Icons.exit_to_app,color: Colors.pink.withOpacity(.4),),
//                 title: Text('Logout',style: TextStyle(
//                     color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18
//                 )),
//               ),
//             ),
//             // SizedBox(
//             //   height: 5.h,
//             // ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor:Colors.pink,
//         title: Text('Tech Jobs'),
//         actions: [
//           IconButton(onPressed: (){
//             widget.webViewController1!.reload();
//     }, icon: Icon(Icons.refresh)),
//         ],
//       ),
//       backgroundColor: Colors.white,
//       floatingActionButton: SizedBox(
//         height: 30,
//         width: 30,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       body: Stack(
//           children: [
//         WillPopScope(
//           onWillPop: () async {
//     if (await widget.webViewController1!.canGoBack()) {
//       widget.webViewController1!.goBack();
//     return false;
//     }
//     return true;},
//           child: WebView(
//             gestureNavigationEnabled: true,
//             zoomEnabled: false,
//             navigationDelegate: (request) async {
//               bool nav = true;
//               // if (request.url.startsWith('loggedout=true')) {
//               //   NavigationDecision.prevent;
//               //   Get.off(Login(url: request.url));
//               // }
//               if (request.url.contains('techjobs')) {
//                 // controller1.update();
//                 setState(() {
//                   nav = true;
//                 });
//               }
//               else {
//                 bool confirm = await showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text('Are you sure?'),
//                     content: Text(
//                         'Do you want to exit the app and open the link in a browser?'),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () => Navigator.of(context).pop(false),
//                         child: Text('No'),
//                       ),
//                       TextButton(
//                         onPressed: () => Navigator.of(context).pop(true),
//                         child: Text('Yes'),
//                       ),
//                     ],
//                   ),
//                 );
//                 if (confirm) {
//                   await launch(
//                     request.url,
//                   );
//                   SystemNavigator.pop();
//                 }
//               }
//               return nav
//                   ? NavigationDecision.navigate
//                   : NavigationDecision.prevent;
//             },
//             key: widget.key,
//             // initialUrl: 'https://safestore.tech',
//             initialUrl: widget.initialUrl,
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (WebViewController controller) {
//               widget.webViewController1 = controller;
//
//               // _webViewController1.loadUrl(widget.initialUrl);
//             },
//             // javascriptChannels: <JavascriptChannel>[
//             //   JavascriptChannel(
//             //       name: "passwordChannel",
//             //       onMessageReceived: (JavascriptMessage message) {
//             //         // Do something with the message received
//             //       }
//             //   ),
//             // ].toSet(),
//             onPageStarted: (String url) async {
//               controller1.isLoading.value = true;
//               controller1.update();
//             },
//             onPageFinished: (String url) async {
//               controller1.isLoading.value = false;
//               controller1.update();
//             },
//             onProgress: (value) {
//               setState(() {
//                 var progress = value;
//                 if (progress == 90) {
//                   setState(() {
//                     controller1.isLoading.value = false;
//                     controller1.update();
//                   });
//                 }
//               });
//             },
//           ),
//         ),
//         Visibility(
//           visible: controller1.isLoading.value,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             color: Colors.grey[100],
//             child: Shimmer.fromColors(
//               baseColor: Colors.red.withOpacity(.3),
//               // (controller1.page.value == 0)
//               //     ? Colors.black12
//               //     : (controller1.page.value == 1)
//               //     ? Colors.red
//               //     : (controller1.page.value == 2)
//               //     ? Colors.yellow
//               //     : Colors.white10,
//               highlightColor: Colors.white,
//               // (controller1.page.value == 0)
//               //     ? Colors.white10
//               //     : (controller1.page.value == 1)
//               //     ? Colors.cyan
//               //     : (controller1.page.value == 2)
//               //     ? Colors.red
//               //     : Colors.black12,
//               enabled: true,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Align(
//                       alignment: AlignmentDirectional.centerEnd,
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 6.w),
//                         height: 40.sp,
//                         width: 40.sp,
//                         decoration: BoxDecoration(
//                             color: Colors.white, shape: BoxShape.circle),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Container(
//                       height: 3.h,
//                       width: MediaQuery.of(context).size.width - 8.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         // shape: BoxShape.circle
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Container(
//                       height: 3.h,
//                       width: MediaQuery.of(context).size.width - 10.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Container(
//                       height: 3.h,
//                       width: MediaQuery.of(context).size.width - 8.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Container(
//                       height: 3.h,
//                       width: MediaQuery.of(context).size.width - 40.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     // Text('Work with talented people at\nthe most affordable price to \nget the most out of your time\nand cost',style: TextStyle(
//                     //   color: Colors.white,fontSize: 22.sp,fontWeight: FontWeight.w500,
//                     // ),),
//                     // SizedBox(
//                     //   height: 2.h,
//                     // ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.end,
//                     //   children: [
//                     //     Container(
//                     //       height: 30,
//                     //       width: 120,
//                     //       decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.circular(9),
//                     //         color: Colors.white,
//                     //       ),
//                     //     ),
//                     //     SizedBox(
//                     //       width: 10,
//                     //     ),
//                     //     Container(
//                     //       height: 30,
//                     //       width: 70,
//                     //       decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.circular(9),
//                     //         color: Colors.white,
//                     //       ),
//                     //     ),
//                     //     SizedBox(
//                     //       width: 30,
//                     //     ),
//                     //   ],
//                     // ),
//                     // SizedBox(
//                     //   height: 20,
//                     // ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.end,
//                     //   children: [
//                     //     Container(
//                     //       height: 30,
//                     //       width: 50,
//                     //       decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.circular(9),
//                     //         color: Colors.white,
//                     //       ),
//                     //     ),
//                     //     SizedBox(
//                     //       width: 20,
//                     //     ),
//                     //   ],
//                     // ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                       height: 40.h,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(9),
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Visibility(
//           visible: controller1.load.value,
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             color: Colors.white,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/welcome.png'),
//                 AnimatedTextKit(
//                   animatedTexts: [
//                     WavyAnimatedText('Welcome',
//                         textStyle: TextStyle(
//                             color: Colors.deepPurple,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold)),
//                     WavyAnimatedText('To',
//                         textStyle: TextStyle(
//                             color: Colors.deepPurple,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold)),
//                     WavyAnimatedText('Tech Jobs',
//                         textStyle: TextStyle(
//                             color: Colors.deepPurple,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold)),
//                   ],
//                   repeatForever: true,
//                   onTap: () {
//                     print("Tech Jobs");
//                   },
//                 ),
//                 // Text('Welcome'),
//               ],
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }
