import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tictactoe_case/core/localdata/local_data_source.dart';

@injectable
class NameEntryViewModel {
  final LocalDataSource _localDataSource;
  NameEntryViewModel(this._localDataSource);
  final TextEditingController nameController = TextEditingController();

  Future<String> saveName() async {
    await _localDataSource.setStoredUserName(nameController.text);
    return nameController.text;
  }
}
