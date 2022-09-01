// import 'package:labtolab_app/data/labInfo.dart';
// import 'package:labtolab_app/ui/customWidget/myShopCard.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:get/get.dart';
// // import 'package:string_similarity/string_similarity.dart';

// class areasListWidget extends StatefulWidget {
//   List<Shop> shops;
//   String name;
//   areasListWidget(this.shops, this.name);

//   @override
//   _areasListWidgetState createState() => _areasListWidgetState();
// }

// class _areasListWidgetState extends State<areasListWidget> {
//   TextEditingController searchAreaController = TextEditingController();

//   // Set<String> temp = Set<String>();

//   @override
//   Widget build(BuildContext context) {
//     // temp = _resourceController.areaList;
//     return new Container(
//         decoration: new BoxDecoration(
//             color: Colors.white,
//             borderRadius: new BorderRadius.only(
//                 topLeft: const Radius.circular(20.0),
//                 topRight: const Radius.circular(20.0))),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Icon(
//                       Icons.close,
//                       size: 25,
//                     ),
//                   ),
//                   Text(
//                     widget.name,
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                   Icon(
//                     Icons.close,
//                     color: Colors.white,
//                     size: 25,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: widget.shops.length,
//                     itemBuilder: (context, index) {
//                       return myShopCard(widget.shops[index]);
//                     }),
//               ),
//             )
//           ],
//         ));
//   }
// }
