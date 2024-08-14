import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe_case/core/di/locator.dart';

import 'package:tictactoe_case/core/model/game.dart';
import 'package:tictactoe_case/core/theme/app_colors.dart';
import 'package:tictactoe_case/core/theme/app_textstyle.dart';
import 'package:tictactoe_case/presentation/game_screen/game_screen.vm.dart';

class GameScreen extends StatefulWidget {
  final Game game;

  const GameScreen({super.key, required this.game});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final viewModel = getIt<GameScreenViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.initializeBoard(widget.game);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (didPop) {
          await viewModel.updateDeleteFlag(widget.game.id);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Game: ${widget.game.name}'),
            backgroundColor: widget.game.boardColor == 'Red'
                ? AppColors.red
                : widget.game.boardColor == 'Blue'
                    ? AppColors.royalBlue
                    : AppColors.green,
          ),
          backgroundColor: widget.game.boardColor == 'Red'
              ? AppColors.red
              : widget.game.boardColor == 'Blue'
                  ? AppColors.royalBlue
                  : AppColors.green,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: StreamBuilder<Game>(
              stream: viewModel.getMovesStream(widget.game.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'An error occurred while fetching the game data',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bodyMedium,
                      ),
                    ],
                  );
                } else {
                  viewModel.initializeBoard(snapshot.data!);
                  if (snapshot.data!.deleted == false) {
                    if (snapshot.data!.opponent != null) {
                      return Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    sqrt(snapshot.data!.board.length).round(),
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                              ),
                              itemCount: viewModel.board.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => viewModel.handleTap(
                                      index, snapshot.data!.opponent!, context),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.neroBlack,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        viewModel.board[index],
                                        style: TextStyle(
                                          fontSize: 36.0,
                                          color: viewModel.board[index] == 'X'
                                              ? AppColors.vividOrange
                                              : AppColors.ghostWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          10.verticalSpace,
                          Text(
                            viewModel.isMyTurn
                                ? 'Your turn'
                                : 'Opponent\'s turn',
                            style: AppTextStyle.bodyMedium,
                          ),
                          50.verticalSpace,
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Waiting for opponent to join...',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bodyMedium,
                          ),
                          10.verticalSpace,
                          SizedBox(
                            height: 50.h,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ],
                      );
                    }
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Your opponent has left the game :(\n\nYou can go back to the game list and/or create a new game.',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodyMedium,
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          )),
    );
  }
}
