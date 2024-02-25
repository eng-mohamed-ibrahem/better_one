import 'package:better_one/core/constants/app_colors.dart';
import 'package:better_one/core/constants/app_metrices.dart';
import 'package:better_one/core/enum/note_status.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardNote extends StatelessWidget {
  const CardNote({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * .4,
            padding: EdgeInsets.all(5.r),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppMetrices.borderRadius1),
                topRight: Radius.circular(AppMetrices.borderRadius1),
              ),
              color: AppColors.coolPrimary,
            ),
            child: Text(
              note.title ?? '',
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.r),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppMetrices.borderRadius1),
              ),
              color: AppColors.warmSecondary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.body,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.coolTertiary,
                      ),
                  overflow: TextOverflow.fade,
                  maxLines: 5,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Divider(
                  height: 10,
                  thickness: 1,
                  color: AppColors.coolPrimary,
                ),
                Text(
                  DateFormat('EEEE, MMMM d, yyyy,  hh:mm a',
                          context.locale.languageCode)
                      .format(note.createdAt),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.coolTertiary),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      note.status.name,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: note.status == NoteStatus.done
                                ? AppColors.coolTertiary
                                : AppColors.warmTertiary,
                          ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    note.status == NoteStatus.done
                        ? const Icon(
                            Icons.celebration_rounded,
                            color: AppColors.coolTertiary,
                          )
                        : const Icon(
                            Icons.monitor_heart_outlined,
                            color: AppColors.warmTertiary,
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
