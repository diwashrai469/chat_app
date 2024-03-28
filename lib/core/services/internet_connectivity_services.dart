// import 'dart:async';

// import 'package:chat_app/common/constant/ui_helpers.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class InternetConnectivityServices  {
//   @override
//   void onInit() {
//     checekInternetConnectivity();
//     getConfigTimePeriodic();
//     super.onInit();
//   }

//   void getConfigTimePeriodic() {
//     Timer.periodic(
//       const Duration(seconds: 5),
//       (timer) async {
//         checekInternetConnectivity();
//       },
//     );
//   }

//   void checekInternetConnectivity() async {
//     final connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       if (connectivityResult == ConnectivityResult.none) {
//         ScaffoldMessenger.of(Get.context!).showSnackBar(
//           SnackBar(
//             content: Row(
//               children: [
//                 const Icon(
//                   CupertinoIcons.wifi_slash,
//                   color: Colors.white,
//                 ),
//                 mWidthSpan,
//                 const Text('No internet connection !'),
//               ],
//             ),
//           ),
//         );
//       } else {
//         Get.back();
//       }
//     }
//   }
// }
