import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:userapi/widgets/skeleton_code.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
  });

//some fetching time   like imolmnt circle prores indid

 // currntly not working can be used later  !!!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView(
        children: const [
          SkeletonCode(),
          SkeletonCode(),
          SkeletonCode(),
          SkeletonCode(),
          SkeletonCode(),
          SkeletonCode(),
          SkeletonCode(),
          SkeletonCode(),
        ],
      ),
    ));
  }
}
