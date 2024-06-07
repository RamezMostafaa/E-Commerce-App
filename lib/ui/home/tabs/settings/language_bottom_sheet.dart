import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../provider/app_config_provider.dart';
import '../../../utils/my_colors.dart';

class ShowLanguageBottomSheet extends StatefulWidget {
  const ShowLanguageBottomSheet({super.key});

  @override
  State<ShowLanguageBottomSheet> createState() =>
      _ShowLanguageBottomSheetState();
}

class _ShowLanguageBottomSheetState extends State<ShowLanguageBottomSheet> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: provider.appLanguage == "en"
                  ? getSelectedItemLanguage(
                      context, AppLocalizations.of(context)!.english)
                  : getUnSelectedItemLanguage(
                      context, AppLocalizations.of(context)!.english),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                provider.changeLanguage("ar");
              },
              child: provider.appLanguage == "ar"
                  ? getSelectedItemLanguage(
                      context, AppLocalizations.of(context)!.arabic)
                  : getUnSelectedItemLanguage(
                      context, AppLocalizations.of(context)!.arabic),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemLanguage(BuildContext context, String language) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedItemLanguage(BuildContext context, String language) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(language,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.black)),
      ],
    );
  }
}
