import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    this.subTitle,
    this.onTap,
    required this.leadingIcon,
  });
  final String title;
  final String? subTitle;
  final VoidCallback? onTap;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      subtitle: subTitle != null ? Text(subTitle!) : null,
      onTap: onTap,
      leading: leadingIcon,
    );
  }
}
