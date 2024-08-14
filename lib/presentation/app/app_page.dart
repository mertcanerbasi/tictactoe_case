import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe_case/core/constants.dart';
import 'package:tictactoe_case/core/theme/app_theme.dart';
import 'package:tictactoe_case/presentation/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 720),
        minTextAdapt: true,
        builder: (_, child) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: MaterialApp(
              title: Constants.APP_NAME,
              theme: AppTheme.theme(),
              home: const SplashPage(),
            ),
          );
        });
  }
}
