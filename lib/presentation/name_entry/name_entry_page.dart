import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe_case/core/di/locator.dart';
import 'package:tictactoe_case/core/theme/app_textstyle.dart';
import 'package:tictactoe_case/presentation/game_list/game_list_page.dart';
import 'package:tictactoe_case/presentation/name_entry/name_entry_page.vm.dart';

class NameEntryPage extends StatefulWidget {
  const NameEntryPage({super.key});

  @override
  State<NameEntryPage> createState() => _NameEntryState();
}

class _NameEntryState extends State<NameEntryPage> {
  final viewModel = getIt<NameEntryViewModel>();
  onSubmit(BuildContext context) async {
    await viewModel.saveName().then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GameListPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: viewModel.nameController,
              style: AppTextStyle.bodyMedium,
              decoration: const InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) => onSubmit(context),
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {
                onSubmit(context);
              },
              child: const Text('Lets Play!'),
            ),
          ],
        ),
      ),
    );
  }
}
