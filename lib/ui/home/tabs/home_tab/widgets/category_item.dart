import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/my_colors.dart';

class CategoryOrBrandItem extends StatelessWidget {
  //todo: categoryOrBrand model
  CategoryOrBrandEntity categoryEntity;

  CategoryOrBrandItem({required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(categoryEntity.image ?? ""),
            radius: 50.r,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            categoryEntity.name ?? "",
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.darkPrimaryColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
        )
      ],
    );
  }
}
