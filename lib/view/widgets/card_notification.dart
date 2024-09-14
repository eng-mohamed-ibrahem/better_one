import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Icon(Icons.notifications),
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 4,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.body),
                  const SizedBox(height: 5),
                  Text(notification.title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
