import 'package:flutter/material.dart';

class SettingItemModel {
  final String title;
  final String? subTitle;
  final Widget leadingIcon;
  final String? path;

  SettingItemModel({
    required this.title,
    this.subTitle,
    required this.leadingIcon,
    this.path,
  });
}
