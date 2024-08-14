import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tictactoe_case/core/model/game.dart';

@injectable
class GamesRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  // Get the stream of games from the database
  Stream<List<Game>> getGamesStream() {
    return _supabaseClient
        .from('Games')
        .stream(primaryKey: ["id", "board_color"])
        .order('created_at')
        .map((maps) => maps.map((map) => Game.fromMap(map)).toList());
  }

// Create a new game in the database and return its id
  Future<Game?> createGame(
      String name, String createdBy, String color, String turnOwner) async {
    // Insert the game and return the inserted row(s)
    final response = await _supabaseClient.from('Games').insert([
      {
        'name': name,
        'created_by': createdBy,
        'status': 'waiting',
        'board_color': color,
        'turnOwner': turnOwner,
      }
    ]).select();

    // Check if the response contains data
    if (response.isNotEmpty) {
      // Extract the ID from the first row
      return Game.fromMap(response[0]);
    } else {
      // Return null if something went wrong
      return null;
    }
  }

  // Update the status of a game in the database
  Future<void> joinGame(String gameId, String status, String opponent) async {
    await _supabaseClient
        .from('Games')
        .update({'status': status, 'opponent': opponent}).eq('id', gameId);
  }

  // Delete a game from the database
  Future<void> updateDeleteFlag(String gameId) async {
    await _supabaseClient.from('Games').update({
      'deleted': true,
    }).eq('id', gameId);
  }

  // Get the stream of moves for a game from the database
  Stream<Game> getMovesStream(String gameId) {
    return _supabaseClient
        .from('Games')
        .stream(primaryKey: ["id"])
        .eq('id', gameId)
        .order('created_at')
        .limit(1)
        .map((maps) => maps.map((map) => Game.fromMap(map)).toList()[0]);
  }

  Future<void> updateGameBoard(
      String gameId, List<String> board, String turnOwner) async {
    await _supabaseClient
        .from('Games')
        .update({'board': board, 'turnOwner': turnOwner}).eq('id', gameId);
  }
}
