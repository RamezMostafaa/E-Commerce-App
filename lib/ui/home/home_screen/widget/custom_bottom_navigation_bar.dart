import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';

Widget buildCustomBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  AppLocalizations? appLocalizations = AppLocalizations.of(context);

  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r),
    ),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTapFunction,
      // selectedItemColor: Colors.transparent,
      // unselectedItemColor: Colors.transparent,
      items: [
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 0
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedHomeIcon,
                ),
              ),
            ),
            label: appLocalizations!.home),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 1
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedCategoryIcon,
                ),
              ),
            ),
            label: appLocalizations.categories),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 2
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedWishlistIcon,
                ),
              ),
            ),
            label: appLocalizations.wish_list),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 3
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedAccountIcon,
                ),
              ),
            ),
            label: appLocalizations.account)
      ],
    ),
  );
}
