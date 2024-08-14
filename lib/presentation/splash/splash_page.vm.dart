import 'package:injectable/injectable.dart';
import 'package:tictactoe_case/core/localdata/local_data_source.dart';

@injectable
class SplashViewModel {
  final LocalDataSource _localDataSource;
  const SplashViewModel(this._localDataSource);

  Future<String?> getStoredUsername() async {
    return _localDataSource.storedUserName;
  }
}
