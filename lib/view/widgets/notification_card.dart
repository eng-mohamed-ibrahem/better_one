import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      clipBehavior: Clip.antiAlias,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
            border: BorderDirectional(
              end: BorderSide(
                width: 6,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: notification.userImageUrl != null
                        ? NetworkImage(notification.userImageUrl!)
                        : null,
                    child: notification.userImageUrl == null
                        ? Icon(
                            Icons.person,
                            size: 30.r,
                          )
                        : null,
                  ),
                  CircleAvatar(
                    radius: 8.r,
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    child: Icon(
                      Icons.notifications,
                      size: 15.r,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(notification.userName,
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 10.h),
                    Text(notification.comment,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
