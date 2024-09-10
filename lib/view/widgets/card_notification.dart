import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:flutter/material.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(notification.body),
        subtitle: Text(notification.title),
      ),
    );
  }
}
