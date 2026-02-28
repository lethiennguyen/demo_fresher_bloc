// import 'package:demo_fresher_bloc/feature/home/domain/domain.src.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../core/base/widget_base/base_get_page.dart';
// import '../../../../generated/locales.g.dart';
// import '../../../../lib.dart';
// import '../../../../shared/widgets/input_form/input.src.dart';
// import '../../../../shared/widgets/show_popup.dart';
// import '../component/component.src.dart';
// import '../controller/controller.src.dart';
//
// part 'detail_product_widget.dart';
// part 'update_product_wiget.dart';
//
// class DetailProductPage extends BaseGetPage<DetailProductController> {
//   DetailProductPage({super.key});
//
//   @override
//   Widget buildPage(BuildContext context) {
//     return Obx(
//       () => Scaffold(
//         backgroundColor: AppColors.basicWhite,
//         appBar: UtilWidget.buildAppBar(
//           controller.title,
//           centerTitle: true,
//           backButtonColor: AppColors.basicBlack,
//           textColor: AppColors.mainColors,
//           funcLeading: controller.onBack,
//         ),
//         body: Obx(
//           () => controller.isDetail.value
//               ? buildProductDetailBody(controller)
//               : _buildBody(controller),
//         ),
//         bottomNavigationBar: controller.isDetail.value
//             ? buildBottomBarDetail(controller)
//             : buildBottomBar(controller),
//       ),
//     );
//   }
// }
