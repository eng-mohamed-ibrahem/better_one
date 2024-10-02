import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardNotification extends StatelessWidget {
  const CardNotification(
      {super.key, required this.notification, this.isSkeleton = false});
  final NotificationModel notification;
  final bool isSkeleton;
  factory CardNotification.skeleton({
    bool isSkeleton = true,
  }) {
    return CardNotification(
      notification: NotificationModel(
        userName: "userName",
        senderId: "senderId",
        userImageUrl: "userImageUrl",
        comment: "comment",
        createdAt: DateTime.now(),
      ),
      isSkeleton: isSkeleton,
    );
  }

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
                width: 8.w,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      () {
                        if (isSkeleton) {
                          return CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.grey.shade200,
                          );
                        } else {
                          return CircleAvatar(
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
                          );
                        }
                      }(),
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
              SizedBox(height: 10.h),
              if (isSkeleton) const Text("createdAt"),
              if (!isSkeleton) SwitchDateTime(dateTime: notification.createdAt),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchDateTime extends StatefulWidget {
  const SwitchDateTime({super.key, required this.dateTime});
  final DateTime dateTime;

  @override
  State<SwitchDateTime> createState() => _SwitchDateTimeState();
}

class _SwitchDateTimeState extends State<SwitchDateTime> {
  bool isTimeago = true;

  @override
  void didChangeDependencies() {
    timeago.setLocaleMessages(
        context.locale.languageCode, timeago.ArMessages());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isTimeago = !isTimeago;
        });
      },
      child: Text(
        isTimeago
            ? timeago.format(widget.dateTime,
                locale: context.locale.languageCode)
            : DateFormat.yMMMMEEEEd(
                context.locale.languageCode,
              ).add_jm().format(widget.dateTime),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
