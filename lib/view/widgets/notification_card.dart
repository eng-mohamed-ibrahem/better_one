import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      clipBehavior: Clip.antiAlias,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.only(left: 10.h, bottom: 2.h),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 6,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shadowColor: Theme.of(context).shadowColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(notification.body,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
              SizedBox(height: 10.h),
              Text(notification.title,
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
