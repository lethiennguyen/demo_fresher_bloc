// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// class ImagePickerWidget extends StatelessWidget {
//   final File? selectedImage;
//   final String? imageUrl;
//   final bool isLoading;
//   final double? width;
//   final double? height;
//   const ImagePickerWidget({
//     super.key,
//     this.selectedImage,
//     required this.imageUrl,
//     this.isLoading = false,
//     this.width,
//     this.height,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? 150,
//       height: height ?? 150,
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey),
//       ),
//       child: Image.network(
//         imageUrl,
//         height: 150,
//         fit: BoxFit.contain,
//       ),
//     );
//   }
// }
