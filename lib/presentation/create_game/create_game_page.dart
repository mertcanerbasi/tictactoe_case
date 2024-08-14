import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe_case/core/di/locator.dart';
import 'package:tictactoe_case/core/theme/app_textstyle.dart';
import 'package:tictactoe_case/presentation/create_game/create_game_page.vm.dart';
import 'package:tictactoe_case/presentation/game_screen/game_screen.dart';

class CreateGamePage extends StatefulWidget {
  const CreateGamePage({super.key});

  @override
  State<CreateGamePage> createState() => _CreateGamePageState();
}

class _CreateGamePageState extends State<CreateGamePage> {
  final viewModel = getIt<CreateGameViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Game'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: viewModel.gameNameController,
              style: AppTextStyle.bodyMedium,
              decoration: const InputDecoration(
                hintText: 'Game Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Background Color : ${viewModel.color}",
              style: AppTextStyle.bodyMedium,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        viewModel.color = 'Red';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Red', style: AppTextStyle.bodyMedium),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        viewModel.color = 'Blue';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Blue', style: AppTextStyle.bodyMedium),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        viewModel.color = 'Green';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('Green', style: AppTextStyle.bodyMedium),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                await viewModel.createGame().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(
                        game: value!,
                      ),
                    ),
                  );
                });
              },
              child: Text(
                'Create Game',
                style: AppTextStyle.bodyMedium,
              ),
            ),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
