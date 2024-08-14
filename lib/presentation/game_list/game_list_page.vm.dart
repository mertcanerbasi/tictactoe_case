import 'package:injectable/injectable.dart';
import 'package:tictactoe_case/core/localdata/local_data_source.dart';
import 'package:tictactoe_case/core/model/game.dart';
import 'package:tictactoe_case/core/repository/games_repository.dart';

@injectable
class GamesListViewModel {
  final GamesRepository _gamesRepository;
  final LocalDataSource _localDataSource;
  GamesListViewModel(this._gamesRepository, this._localDataSource) {
    username = _localDataSource.storedUserName ?? "";
  }

  String username = "";

  Stream<List<Game>> getGamesStream() {
    return _gamesRepository.getGamesStream();
  }

  //update the status of a game in the database
  Future<void> joinGame(String gameId, String status) async {
    await _gamesRepository.joinGame(gameId, status, username);
  }
}
