// import 'package:flutter/material.dart';
// import 'package:booking_app/screens/methods/form_screen.dart';
// import 'package:booking_app/screens/methods/payment_screen.dart';
// import 'package:booking_app/screens/methods/accuracy_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:booking_app/provider/booking_provider.dart';

// class ProceduresScreen extends StatefulWidget {
//   final GlobalKey<FirstPageState> _firstPageKey = GlobalKey<FirstPageState>();
//   final Map<String, dynamic> room;

//   ProceduresScreen({Key? key, required this.room}) : super(key: key);

//   @override
//   State<ProceduresScreen> createState() => _ProceduresScreenState();
// }

// class _ProceduresScreenState extends State<ProceduresScreen> {
//   final PageController _pageController = PageController(initialPage: 0);
//   late Map<String, dynamic> room;

//   int currentIndex = 0;

//   bool isFormComplete() {
//     return widget._firstPageKey.currentState?.validateFormData() ?? false;
//   }

//   @override
//   void initState() {
//     super.initState();
//     room = widget.room;
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void showIncompleteFormDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Thông báo'),
//           content: const Text('Vui lòng nhập đầy đủ thông tin để tiếp tục.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Đóng'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => BookingProvider(),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(56.0),
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Colors.transparent,
//               boxShadow: [BoxShadow(color: Colors.transparent)],
//             ),
//             child: AppBar(
//               automaticallyImplyLeading:
//                   false, // Add this line to hide the back button
//               backgroundColor: Colors.transparent,
//               shadowColor: Colors.transparent,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   3,
//                   (index) => Container(
//                     width: currentIndex == index ? 70 : 70,
//                     height: 3,
//                     margin: const EdgeInsets.only(right: 5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: currentIndex == index
//                           ? const Color(0xff4361EE)
//                           : const Color(0xffADADAD),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         body: PageView(
//           physics: currentIndex == 0
//               ? const NeverScrollableScrollPhysics()
//               : const PageScrollPhysics(),
//           onPageChanged: (index) {
//             setState(() {
//               currentIndex = index;
//             });

//             if (index == 0) {
//               bool isFormValid =
//                   widget._firstPageKey.currentState?.validateFormData() ??
//                       false;

//               // Nếu thông tin không đầy đủ, không cho phép chuyển trang
//               if (!isFormValid) {
//                 _pageController.jumpToPage(currentIndex);
//               }
//             }
//           },
//           controller: _pageController,
//           children: [
//             FirstPage(
//               key: widget._firstPageKey,
//               room: {},
//             ),
//             const SecondPage(),
//             const ThirdPage(),
//           ],
//         ),
//         bottomNavigationBar: Container(
//           margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
              // Container(
              //   width: 170,
              //   height: 60,
              //   decoration: BoxDecoration(
              //     color: const Color(0xffF8F9FA),
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(
              //       color: const Color(0xffE5E5E5),
              //       width: 2.0,
              //     ),
              //   ),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     style: ElevatedButton.styleFrom(
              //       shadowColor: Colors.transparent,
              //       backgroundColor: Colors.transparent,
              //     ),
              //     child: const Text(
              //       'Quay lại',
              //       style: TextStyle(
              //         color: Color(0xffADADAD),
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
//               Container(
//                 width: 170,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: const Color(0xff4361EE),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_pageController.page != 2) {
//                       // Kiểm tra xem tất cả 6 trường đã được nhập hay chưa
//                       if (widget._firstPageKey.currentState
//                               ?.validateFormData() ??
//                           false) {
//                         _pageController.nextPage(
//                           duration: const Duration(milliseconds: 500),
//                           curve: Curves.easeIn,
//                         );
//                       } else {
//                         showIncompleteFormDialog();
//                       }
//                     } else {
//                       // Xử lý khi ấn nút tiếp tục ở trang cuối cùng
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shadowColor: Colors.transparent,
//                     backgroundColor: Colors.transparent,
//                   ),
//                   child: const Text(
//                     'Tiếp tục',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
