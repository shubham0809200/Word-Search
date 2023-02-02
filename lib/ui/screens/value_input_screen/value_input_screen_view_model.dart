import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ValueInputScreenViewModel extends BaseViewModel {
  final BuildContext context;
  final int row;
  final int column;

  ValueInputScreenViewModel({
    required this.context,
    required this.row,
    required this.column,
  });

  List<String> gridInputs = [];

  // focus node list
  List<FocusNode> focusNodeList = [];

  // depending on the row and column, generate the gridInputs list
  void generateGridInputs() {
    gridInputs = List.generate(row * column, (index) => '');

    // generate focus node list
    focusNodeList = List.generate(row * column, (index) => FocusNode());
  }
}
