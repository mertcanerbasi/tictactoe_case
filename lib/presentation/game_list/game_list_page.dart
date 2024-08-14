import 'package:flutter/material.dart';
import 'package:tictactoe_case/core/di/locator.dart';
import 'package:tictactoe_case/core/model/game.dart';
import 'package:tictactoe_case/core/theme/app_colors.dart';
import 'package:tictactoe_case/core/theme/app_textstyle.dart';
import 'package:tictactoe_case/presentation/create_game/create_game_page.dart';
import 'package:tictactoe_case/presentation/game_list/game_list_page.vm.dart';
import 'package:tictactoe_case/presentation/game_screen/game_screen.dart';

class GameListPage extends StatefulWidget {
  const GameListPage({super.key});

  @override
  _GameListPageState createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  final viewModel = getIt<GamesListViewModel>();
  late final Stream<List<Game>> _gamesStream;

  @override
  void initState() {
    super.initState();
    _gamesStream = viewModel.getGamesStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateGamePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Game>>(
        stream: _gamesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: AppTextStyle.bodyMedium
                        .copyWith(color: AppColors.red)));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child:
                    Text('No games available', style: AppTextStyle.bodyMedium));
          } else {
            final games = snapshot.data!
                .where((game) => game.status == 'waiting')
                .toList();
            if (games.isEmpty) {
              return Center(
                  child: Text('No games available',
                      style: AppTextStyle.bodyMedium));
            }
            return ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return ListTile(
                    title: Text(
                      game.name,
                      style: AppTextStyle.bodyMedium
                          .copyWith(color: AppColors.vividOrange),
                    ),
                    subtitle: Text('Created by: ${game.createdBy}',
                        style: AppTextStyle.captionRegular),
                    trailing: Text(game.status.toUpperCase(),
                        style: AppTextStyle.captionRegular
                            .copyWith(color: AppColors.vividOrange)),
                    onTap: () async {
                      // Update the status of the game to 'playing'
                      await viewModel.joinGame(game.id, 'playing').then(
                        (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameScreen(game: game),
                            ),
                          );
                        },
                      );
                    });
              },
            );
          }
        },
      ),
    );
  }
}
