import 'package:flutter/material.dart';
import 'package:tictactoe_case/core/di/locator.dart';
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
              return Container(
                height: 50,
                color: Colors.red,
              );
            } else {
              return Container();
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
