import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tictactoe_case/core/localdata/local_data_source.dart';
import 'package:tictactoe_case/core/model/game.dart';
import 'package:tictactoe_case/core/repository/games_repository.dart';
import 'package:tictactoe_case/core/theme/app_colors.dart';
import 'package:tictactoe_case/core/theme/app_textstyle.dart';

@injectable
class GameScreenViewModel {
  final GamesRepository _gamesRepository;
  final LocalDataSource _localDataSource;

  String username = "";
  List<String> board = List.filled(9, '');
  late bool isMyTurn;
  late Game game;
  bool isXturn = true;

  GameScreenViewModel(this._gamesRepository, this._localDataSource) {
    username = _localDataSource.storedUserName ?? "";
  }

  void initializeBoard(Game game) {
    this.game = game;
    board = game.board;
    isMyTurn = game.turnOwner == username;
    isXturn = game.turnOwner == game.createdBy;
  }

  Stream<Game> getMovesStream(String gameId) {
    return _gamesRepository.getMovesStream(gameId);
  }

  void showGameOverDialog(String winner, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext c) {
        return AlertDialog(
          backgroundColor: AppColors.neroBlack,
          title: Text(
            winner == 'Draw' ? 'Game Over' : 'Winner: $winner',
            style: AppTextStyle.headlineMedium,
          ),
          content: Text(
            winner == 'Draw' ? 'It\'s a draw!' : '$winner wins!',
            style: AppTextStyle.titleMedium,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(c).pop();
                Navigator.of(context).pop(); // Go back to the game list
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> handleTap(
      int index, String opponent, BuildContext context) async {
    if (board[index] == '' && isMyTurn) {
      board[index] = isXturn ? 'X' : 'O';

      await _gamesRepository.updateGameBoard(
          game.id, board, isXturn ? opponent : game.createdBy);

      String? winner = checkWinner();
      if (winner != null) {
        showGameOverDialog(winner, context);
      } else if (!board.contains('')) {
        // Restart the game board
        await _gamesRepository.updateGameBoard(
            game.id, List.filled(9, ''), game.createdBy);
        board = List.filled(9, '');
      }
    }
  }

  String? checkWinner() {
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in winningCombinations) {
      if ((board[combo[0]] != '') &&
          (board[combo[0]] == board[combo[1]]) &&
          (board[combo[1]] == board[combo[2]])) {
        return board[combo[0]] == "X" ? game.createdBy : game.opponent;
      }
    }
    return null;
  }

  Future<void> updateDeleteFlag(String gameId) async {
    await _gamesRepository.updateDeleteFlag(gameId);
  }
}
