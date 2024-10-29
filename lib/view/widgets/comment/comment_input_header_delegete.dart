import 'package:flutter/material.dart';

class CommentInputHeaderDelegate extends SliverPersistentHeaderDelegate {
  CommentInputHeaderDelegate(
      {required this.child, required this.maxHeight, required this.minHeight});
  final Widget child;
  final Key _key = UniqueKey();
  final double maxHeight;
  final double minHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(key: _key, child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
