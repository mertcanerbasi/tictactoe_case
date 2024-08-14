import 'package:get_storage/get_storage.dart';

import 'package:injectable/injectable.dart';
import 'package:tictactoe_case/core/constants.dart';

abstract class LocalDataSource {
  Future<void> clear();
  Future<void> setStoredUserName(String username);
  String? get storedUserName;
}

@Order(-1000)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final GetStorage _getStorage;
  LocalDataSourceImpl(this._getStorage);

  @override
  Future<void> clear() async {
    _getStorage.erase();
    return;
  }

  @override
  String? get storedUserName => _getStorage.read(Constants.USERNAME);

  @override
  Future setStoredUserName(String username) async {
    await _getStorage.write(Constants.USERNAME, username);
    return;
  }
}
