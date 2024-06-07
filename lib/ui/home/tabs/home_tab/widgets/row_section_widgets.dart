import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/my_colors.dart';

class RowSectionWidget extends StatelessWidget {
  String name;

  RowSectionWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLocalizations = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.darkPrimaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                )),
        InkWell(
          onTap: () {},
          child: Text(
            appLocalizations!.view_all,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.darkPrimaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
