import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:tictactoe_case/core/localdata/local_data_source.dart';
import 'package:tictactoe_case/core/model/game.dart';
import 'package:tictactoe_case/core/repository/games_repository.dart';

@injectable
class CreateGameViewModel {
  final GamesRepository _gamesRepository;
  final LocalDataSource _localDataSource;
  CreateGameViewModel(this._gamesRepository, this._localDataSource) {
    username = _localDataSource.storedUserName ?? "";
  }
  TextEditingController gameNameController = TextEditingController();
  String color = 'Red';
  String username = "";

  int boardSize = 9;

  Future<Game?> createGame() async {
    return await _gamesRepository.createGame(
        gameNameController.text, username, color, username, boardSize);
  }
}
