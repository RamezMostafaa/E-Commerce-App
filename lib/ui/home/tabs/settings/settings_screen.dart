import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../provider/app_config_provider.dart';
import '../../../utils/my_colors.dart';
import 'language_bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLocalizations = AppLocalizations.of(context);
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    appLocalizations!.language,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.primaryColor),
                  ),
                  Icon(
                    Icons.language,
                    color: AppColors.primaryColor,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return const FractionallySizedBox(
                        heightFactor: .30,
                        child: ShowLanguageBottomSheet(),
                      );
                    });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: .25),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.isArLang()
                            ? appLocalizations.arabic
                            : appLocalizations.english,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.normal)),
                    const Icon(Icons.arrow_drop_down,
                        color: AppColors.primaryColor)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
