import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final String id;
  final String name;
  final String createdBy;
  final String status;
  final String boardColor;
  final List<String> board;
  final String? turnOwner;
  final String? opponent;
  final bool deleted;

  const Game({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.status,
    required this.boardColor,
    required this.board,
    this.turnOwner,
    this.opponent,
    required this.deleted,
  });

  @override
  List<Object> get props => [id, name, createdBy, status, boardColor, board];

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'] as String,
      name: map['name'] as String,
      createdBy: map['created_by'] as String,
      status: map['status'] as String,
      boardColor: map['board_color'] as String,
      board: (map['board'] as List).cast<String>(),
      opponent: map['opponent'] as String?,
      turnOwner: map['turnOwner'] as String?,
      deleted: map['deleted'] as bool,
    );
  }
}
