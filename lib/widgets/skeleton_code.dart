import 'package:flutter/material.dart';

class SkeletonCode extends StatelessWidget {
  const SkeletonCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.sizeOf(context);
    return ListTile(
      leading: Container(
        width: 60,
        color: Colors.white,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Container(
            width: _size.width,
            height: 15.0,
            color: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: _size.width,
            height: 15.0,
            color: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: _size.width/5,
            height: 15.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
