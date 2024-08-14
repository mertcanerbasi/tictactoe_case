import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tictactoe_case/core/constants.dart';

// Project imports:

@module
abstract class AppModule {
  @preResolve
  Future<GetStorage> get storage async {
    await GetStorage.init("MyStorage");
    return GetStorage("MyStorage");
  }

  @preResolve
  Future<Supabase> get supabase {
    WidgetsFlutterBinding.ensureInitialized();
    return Supabase.initialize(
      url: Constants.APP_URL,
      anonKey: Constants.SECRET_KEY,
    );
  }
}
