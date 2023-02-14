import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class MyControllers extends GetxController {
  var timeSTamp = 0.obs;
 RxInt male=0.obs;
  var notifications = ''.obs;
  var imgURL = ''.obs;
  final selected = "BBQ".obs;
  RxInt currontIndex = 0.obs;
  RxBool isSwitched = false.obs;
  RxDouble rating = 4.5.obs;
  RxInt defaultChoiceIndex = 0.obs;
  RxBool arrowClr = false.obs;
  RxBool isSelected = false.obs;
  RxBool isFavorite = false.obs;
  RxBool load = false.obs;
  RxInt i=0.obs;
  RxInt selectedIndex = 0.obs;
  RxString gender ="Male".obs;
  RxString bank ="Vissa".obs;
  File? photo;

  final ImagePicker picker = ImagePicker();
  RxInt page = 0.obs;
  RxBool isLoading = false.obs;
  final Rx<PageController> pageController = PageController().obs;
  final recipeTitle = TextEditingController().obs;
  final estimatedTime = TextEditingController().obs;
  final ingradient = TextEditingController().obs;
  final quantity = TextEditingController().obs;
  final engDesc = TextEditingController().obs;
  final urduDesc = TextEditingController().obs;
  List<String> ingradientsList =[];
  List<String> quantityList =[];
  List<String> currentUrl = [
    'https://microprogramers.org',
    'https://microprogramers.org/blog/',
    'https://microprogramers.org/about/',
    'https://microprogramers.org/contact/',
  ];
  RxInt index=0.obs;

  RxBool loading = false.obs;
  final emailController = TextEditingController().obs;
  final experienceController = TextEditingController().obs;
  final workPlaceController = TextEditingController().obs;
  final messageController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final postDescController = TextEditingController().obs;
  var check = false.obs;
  final fieldController = TextEditingController().obs;


  Future imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    update();

      if (pickedFile != null) {
        photo = File(pickedFile.path);
        update();
      } else {
        print('No image selected.');
      }
  }

  Future imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    update();
      if (pickedFile != null) {
        photo = File(pickedFile.path);
        update();
      } else {
        print('No image selected.');
      }
  }

  double screenHeight = 0;

  double screenWidth = 0;

  Color primary = const Color(0xffeef444c);

  String profilePicLink = "";

  // Future uploadFile() async {
  //   if (photo == null) return;
  //   try {
  //     final ref = firebase_storage.FirebaseStorage.instance
  //         .ref()
  //         .child('users/'+uid+'/$uid.jpg');
  //     await ref.putFile(File(photo!.path)).then((_) {});
  //     final String downloadUrl = await ref.getDownloadURL();
  //     await userRef.doc(uid).update({
  //       "imageURL": downloadUrl.toString(),
  //     }).then((value) {
  //       Get.snackbar("Alert", "image uploaded");
  //     }).catchError((error) {
  //       Get.snackbar("Alert", error.toString());
  //     });
  //   } catch (e) {
  //     print('error occured');
  //   }
  // }


  // void login() async {
  //   String email = emailController.value.text.trim();
  //   String password = passwordController.value.text.trim();
  //   if (email.isNotEmpty && password.isNotEmpty) {
  //     bool isValidEmail = EmailValidator.validate(email);
  //     if (isValidEmail) {
  //       try {
  //         await FirebaseAuth.instance
  //             .signInWithEmailAndPassword(email: email, password: password)
  //             .then(
  //               (value) async {
  //             print("LogIn");
  //             if (value.user!.emailVerified) {
  //               // Get.offAll(HomeScreen());
  //               emailController.value.clear();
  //               passwordController.value.clear();
  //             } else {
  //               Get.snackbar('Please first verify your email', '',
  //                   backgroundColor: Colors.transparent,
  //                   colorText: Colors.white,
  //                   overlayBlur: 2.0,
  //                   overlayColor: Colors.red.withOpacity(0.3));
  //             }
  //           },
  //         );
  //       } on FirebaseAuthException catch (e) {
  //         switch (e.code) {
  //           case 'user-not-found':
  //             Get.snackbar(
  //               'Email not registered', '',
  //               backgroundColor: Colors.transparent,
  //               colorText: Colors.black,
  //               //overlayBlur: 2.0,
  //               //  overlayColor: Colors.red.withOpacity(0.2)
  //             );
  //             break;
  //           case 'wrong-password':
  //             Get.snackbar('Wrong Password', '',
  //                 backgroundColor: Colors.transparent,
  //                 colorText: Colors.black,
  //                 overlayBlur: 2.0,
  //                 overlayColor: Colors.red.withOpacity(0.2));
  //             break;
  //           default:
  //         }
  //       }
  //     } else {
  //       Get.snackbar('Please check your email and password', '',
  //           backgroundColor: Colors.transparent,
  //           colorText: Colors.black,
  //           overlayBlur: 2.0,
  //           overlayColor: Colors.red.withOpacity(0.3));
  //     }
  //   }
  // }
  //
  // void signUp() async {
  //   String email = emailController.value.text.trim();
  //   String password = passwordController.value.text.trim();
  //   String confirmPassword = confirmPasswordController.value.text.trim();
  //   String name = nameController.value.text.trim();
  //
  //   if (email.isEmpty ||
  //       password.isEmpty ||
  //       confirmPassword.isEmpty ||
  //       name.isEmpty ||
  //       password != confirmPassword) {
  //     Get.snackbar("Alert", "Error");
  //   } else if (email.isNotEmpty) {
  //     bool isValidEmail = EmailValidator.validate(email);
  //     if (isValidEmail) {
  //       try {
  //         await FirebaseAuth.instance
  //             .createUserWithEmailAndPassword(email: email, password: password)
  //             .then((value) {
  //           value.user!.sendEmailVerification();
  //           print("signUp");
  //           // Get.offAll(LoginScreen());
  //
  //           var id = value.user!.uid;
  //           // Users user = Users(
  //           //     id: id,
  //           //     name: name,
  //           //     email: email,
  //           //     password: password,
  //           //     confirmPassword: confirmPassword,
  //           //     imageURL: imgURL.value,
  //           //     timeStamp: DateTime.now().millisecondsSinceEpoch,
  //           //     notificationToken: notifications.value,
  //           //     specialization: '',
  //           //     experience: '',
  //           //     recentlyWork: '',
  //           //     totalRecipe: 0,
  //           //     blocked: false,
  //           //     chefMode: false,
  //           //     chefBlocked: false);
  //           // FirebaseFirestore.instance
  //           //     .collection("users")
  //           //     .doc(user.id)
  //           //     .set(user.toMap())
  //           //     .then((value) {
  //           //   nameController.value.clear();
  //           //   emailController.value.clear();
  //           //   passwordController.value.clear();
  //           //   confirmPasswordController.value.clear();
  //           //   // Get.snackbar("Alert", "User Register");
  //           // });
  //           // FirebaseFirestore.instance.collection("users").doc(user.id).collection("collectionPath").doc().collection(collectionPath)
  //           // if (value.user!.emailVerified) {
  //           //   // Get.snackbar("Alert", "Verified");
  //           //   Get.offAll(ScreenHomePage());
  //           //
  //           // }
  //           // else{
  //           //   Get.snackbar("Alert", "First verify your email");
  //           // }
  //         });
  //       } on FirebaseAuthException catch (e) {
  //         switch (e.code) {
  //           case 'invalid-email':
  //             Get.snackbar('Alert', 'invalid email',
  //                 backgroundColor: Colors.transparent,
  //                 colorText: Colors.white,
  //                 overlayBlur: 2.0,
  //                 overlayColor: Colors.red.withOpacity(0.3));
  //             break;
  //           case 'email-already-in-use':
  //             Get.snackbar('Alert', 'email is already in use',
  //                 backgroundColor: Colors.transparent,
  //                 colorText: Colors.white,
  //                 overlayBlur: 2.0,
  //                 overlayColor: Colors.red.withOpacity(0.3));
  //             break;
  //           default:
  //         }
  //       }
  //     }
  //   } else {
  //     print("Error");
  //     Get.snackbar("Alert Message", "Please enter an email ",
  //         backgroundColor: Colors.transparent,
  //         colorText: Colors.white,
  //         overlayBlur: 2.0,
  //         overlayColor: Colors.red.withOpacity(0.3));
  //   }
  // }
  //
  // void forgotPassword() async {
  //   String email = emailController.value.text.trim();
  //   print(email);
  //   if (email.isNotEmpty) {
  //     bool isValidEmail = EmailValidator.validate(email);
  //     if (isValidEmail) {
  //       await FirebaseAuth.instance
  //           .sendPasswordResetEmail(email: email)
  //           .then((value) async {
  //         Get.snackbar("Email has been sent", "",
  //             backgroundColor: Colors.transparent,
  //             colorText: Colors.white,
  //             overlayBlur: 2.0,
  //             overlayColor: Colors.red.withOpacity(0.3));
  //         // await Future.delayed(Duration(seconds: 2))
  //         //     .then((value) => Get.to(LoginScreen()));
  //         emailController.value.clear();
  //       });
  //     } else {
  //       Get.snackbar("Please Check your email or password", "",
  //           backgroundColor: Colors.transparent,
  //           colorText: Colors.white,
  //           overlayBlur: 2.0,
  //           overlayColor: Colors.red.withOpacity(0.3));
  //     }
  //   } else {
  //     print("Error");
  //     Get.snackbar("Please enter an email ", '',
  //         backgroundColor: Colors.transparent,
  //         colorText: Colors.white,
  //         overlayBlur: 2.0,
  //         overlayColor: Colors.red.withOpacity(0.3));
  //   }
  // }
  //
  // // void forgotPassword() async {
  // //   loading.value = true;
  // //   String email = emailController.value.text.trim();
  // //   print(email);
  // //   if (email.isNotEmpty) {
  // //     bool isValidEmail = EmailValidator.validate(email);
  // //     if (isValidEmail) {
  // //       await FirebaseAuth.instance
  // //           .sendPasswordResetEmail(email: email)
  // //           .then((value) {
  // //         print("Check email and reset password");
  // //         Get.to(LoginScreen());
  // //       });
  // //     } else {
  // //       Get.snackbar("Please Check your email or password", "Alert");
  // //     }
  // //   } else {
  // //     print("Error");
  // //     Get.snackbar("Alert Message", "Please enter an email ");
  // //   }
  // //   loading.value = false;
  // // }
  // void SignOut() async {
  //   loading.value = true;
  //   await FirebaseAuth.instance.signOut();
  //   // Get.offAll(LoginScreen());
  //   imageCache.clear();
  //   imageCache.clearLiveImages();
  //   loading.value = false;
  // }

  Future<void> Wait() async {
    print("wait Started");
    load.value=true;
    await Future.delayed(Duration(seconds: 12)).then((value) {
      load.value=false;
      print("Wait Completed");
    });
  }

  void setSelected(String value){
    selected.value = value;
  }

  void Dispose(){
    ingradient.value.dispose();
    quantity.value.dispose();
  }
}
