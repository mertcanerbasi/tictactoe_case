// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe_case/core/theme/app_colors.dart';
import 'package:tictactoe_case/core/theme/app_textstyle.dart';

// Project imports:

class AppTheme {
  static ThemeData theme() => ThemeData(
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashColor: AppColors.vividOrange.withOpacity(0.2),
        colorScheme: ColorScheme.light(
            primary: AppColors.primarySwatch,
            secondary: AppColors.primarySwatch),
        scaffoldBackgroundColor: AppColors.neroBlack,
        indicatorColor: AppColors.primarySwatch,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.ghostWhite),
          color: AppColors.neroBlack,
          titleTextStyle: AppTextStyle.bodyMedium,
        ),
        listTileTheme: ListTileThemeData(
            titleTextStyle: AppTextStyle.bodyMedium,
            subtitleTextStyle: AppTextStyle.bodyRegular),
        buttonTheme: buttonTheme,
        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.vividOrange,
            textStyle: AppTextStyle.bodyMedium,
            padding: EdgeInsets.all(8.r),
            fixedSize: Size(1.sw, 40.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          errorMaxLines: 2,
          iconColor: AppColors.ghostWhite.withOpacity(0.7),
          hintStyle: AppTextStyle.captionRegular
              .copyWith(color: AppColors.ghostWhite.withOpacity(0.7)),
          fillColor: AppColors.textFieldBg,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
        ),
      );

  static ButtonThemeData buttonTheme = ButtonThemeData(
    padding: EdgeInsets.all(8.r),
  );

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: ElevatedButton.styleFrom(
    padding: EdgeInsets.all(8.r),
  ));
}
