import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tictactoe_case/core/di/locator.config.dart';

GetIt getIt = GetIt.instance;
@InjectableInit()
Future setupDI() => getIt.init();
