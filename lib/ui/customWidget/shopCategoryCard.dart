// import 'package:labtolab_app/data/tendersData.dart';
// import 'package:labtolab_app/ui/customWidget/loadingImage.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// Widget shopCategoryCard(ShopDetail item) {
//   return Container(
//     child: Column(
//       children: [
//         Card(
//           semanticContainer: true,
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           child: Container(
//               width: 100,
//               height: 105,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               // "kskdsk",
//                               item.name,
//                               textAlign: TextAlign.center,

//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 2,

//                               style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.black,
//                                   height: 1.2),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: CachedNetworkImage(
//                       fit: BoxFit.cover,
//                       width: 100,
//                       imageUrl: item.img,
//                       placeholder: (context, url) => loadinImage(),
//                       errorWidget: (context, url, error) => loadinImage(),
//                     ),
//                   ),
//                 ],
//               )),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           elevation: 2,
//           margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//         ),
//       ],
//     ),
//   );
// }
