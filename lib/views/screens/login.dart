// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:tech_jobs/views/screens/screen_home.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../../controllers/my_controllers.dart';
//
// class Login extends StatefulWidget {
//   Login({Key? key, required String url}) : super(key: key);
//
//   @override
//   _LoginState createState() => _LoginState();
// }
//  late WebViewController _webViewController1 ;
// class _LoginState extends State<Login> {
//   var controller1 = Get.put(MyControllers());
//   var userName;
//   var password;
//   final _key = UniqueKey();
//   bool bac=false;
//   bool far=false;
//   bool isLoading = false;
//   final Completer<WebViewController> _controller = Completer<WebViewController>();
//   @override
//   void initState() {
//     // getdata();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text('Login'),
//       //
//       // ),
//       body: WebView(
//         initialUrl: 'https://techjobs.website/login-and-register/',
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) async {
//           _controller.complete(webViewController);
//           _webViewController1=webViewController;
//         },
//         javascriptChannels: Set.from([
//           JavascriptChannel(
//               name: 'GetLoginDetails',
//               onMessageReceived: (JavascriptMessage message) {
//                 // String username1 = message.message;
//                 // String password1 = "password"; // replace with actual password
//                 // saveLoginDetails(userName, password);
//               }),
//         ]),
//         navigationDelegate: (NavigationRequest request) async {
//           bool nav = true;
//           if (request.url.contains('techjobs')) {
//             // controller1.update();
//             setState(() {
//               nav = true;
//             });
//           }
//           else {
//             bool confirm = await showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Text('Are you sure?'),
//                 content: Text(
//                     'Do you want to exit the app and open the link in a browser?'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () => Navigator.of(context).pop(false),
//                     child: Text('No'),
//                   ),
//                   TextButton(
//                     onPressed: () => Navigator.of(context).pop(true),
//                     child: Text('Yes'),
//                   ),
//                 ],
//               ),
//             );
//             if (confirm) {
//               await launch(
//                 request.url,
//               );
//               SystemNavigator.pop();
//             }
//           }
//           if (request.url.startsWith("https://techjobs.website/frontend-dashboard/?fed=dashboard")||request.url.startsWith("https://techjobs.website/") ) {
//             WebViewController controller = await _controller.future;
//             String username = await controller.evaluateJavascript(
//                 "document.getElementById('user_login').value");
//             String password = await controller.evaluateJavascript(
//                 "document.getElementById('user_pass').value");
//             // saveLoginDetails(username, password);
//             print('UserName : $username');
//             print('Password : $password');
//             if ((username != null && password != null)||(username != '' && password != '')) {
//               Get.to(BottomNavigatorExample());
//             }
//           }
//           return nav
//               ? NavigationDecision.navigate
//               : NavigationDecision.prevent;
//         },
//         onPageStarted: (url){
//           setState(() {
//             isLoading=true;
//           });
//         },
//         onPageFinished: (url){
//           setState(() {
//             isLoading=false;
//           });
//         },
//       ),
//     );
//   }
// }
