import 'package:flutter/material.dart';
import 'package:tictactoe_case/core/di/locator.dart';
import 'package:tictactoe_case/presentation/app/app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();

  runApp(const MyApp());
}
