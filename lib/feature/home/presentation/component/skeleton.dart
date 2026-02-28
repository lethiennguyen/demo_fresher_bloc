import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../lib.dart';

class ProductSkeletonCard extends StatelessWidget {
  const ProductSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return UtilWidget.baseCard(
      borderRadius: AppDimens.borderRadius16,
      margin: const EdgeInsets.only(bottom: 12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          spreadRadius: 1,
          offset: const Offset(0, 2),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image skeleton
            _shimmerBox(width: 80, height: 80, radius: 8),
            sdsSBWidth12,

            // Text skeleton
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerBox(width: double.infinity, height: 16),
                  sdsSBHeight6,
                  _shimmerBox(width: double.infinity, height: 13),
                  sdsSBHeight6,
                  _shimmerBox(width: 120, height: 16),
                  sdsSBHeight6,
                  _shimmerBox(width: 80, height: 14),
                ],
              ),
            ),

            sdsSBWidth8,

            // Icon skeleton
            _shimmerBox(width: 24, height: 24, radius: 12),
          ],
        ),
      ),
    );
  }

  Widget _shimmerBox({
    required double width,
    required double height,
    double radius = 6,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
