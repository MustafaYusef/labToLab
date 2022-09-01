// import 'package:labtolab_app/data/labInfo.dart';
// import 'package:labtolab_app/ui/customWidget/myShopCard.dart';
// import 'package:labtolab_app/ui/customWidget/showShopsWidget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class shopListCard extends StatelessWidget {
//   Information item;
//   shopListCard(this.item);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       margin: EdgeInsets.symmetric(vertical: 10),
//       height: ((100 * (4 > 3 ? 3 : 4) + 50) + (4 > 3 ? 105 : 0)).toDouble(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//             child: Text(
//               "المعلومات المختبرية",
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//               style: TextStyle(
//                   fontSize: 22,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: 4 > 3 ? 3 : 4,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (context, index) {
//                   return myShopCard(item.shops[0]);
//                 }),
//           ),
//           4 > 3
//               ? Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white),
//                   height: 45,
//                   width: Get.width,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // _modalBottomSheetMenu(item.shops, item.mainCategoryName);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       elevation: 1,
//                       primary: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       padding: EdgeInsets.all(0.0),
//                     ),
//                     child: Ink(
//                       decoration: BoxDecoration(
//                           color: Colors.orange[900]!.withOpacity(0.2),
//                           // border: Border.all(color: Get.theme.primaryColor),
//                           borderRadius: BorderRadius.circular(10.0)),
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Text(
//                           "عرض المزيد",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.orange[900], fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }

// void _modalBottomSheetMenu(List<Shop> shops, String name) {
//   showModalBottomSheet(
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       context: Get.context!,
//       builder: (builder) {
//         return new Container(
//             height: Get.height - 50,
//             color: Colors.transparent,
//             child: areasListWidget(shops, name));
//       });
// }
