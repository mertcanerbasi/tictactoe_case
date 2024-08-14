import 'package:flutter/material.dart';
import 'package:tictactoe_case/core/di/locator.dart';
import 'package:tictactoe_case/presentation/game_list/game_list_page.dart';
import 'package:tictactoe_case/presentation/name_entry/name_entry_page.dart';
import 'package:tictactoe_case/presentation/splash/splash_page.vm.dart';

class SplashPage extends StatelessWidget {
  //ViewModel
  final SplashViewModel _viewModel = getIt<SplashViewModel>();

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String?>(
        future: _viewModel.getStoredUsername(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return const GameListPage();
            } else {
              return const NameEntryPage();
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
