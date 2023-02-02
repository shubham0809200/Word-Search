import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

class WordSearchScreenViewModel extends BaseViewModel {
  final BuildContext context;
  final int rows;
  final int columns;
  final List<String> gridList;

  WordSearchScreenViewModel({
    required this.context,
    required this.rows,
    required this.columns,
    required this.gridList,
  });

  List<String> gridInputs = [];
  bool flag = false;
  String wordToCheck = '';

  void addGridInput() {
    for (int i = 0; i < gridList.length; i++) {
      gridInputs.add(gridList[i]);
      notifyListeners();
    }
  }

// Combination search
  List<int> x = [-1, -1, -1, 0, 0, 1, 1, 1];
  List<int> y = [-1, 0, 1, -1, 1, -1, 0, 1];
  List<List<int>> positions = [];
  List<int> position = [];

  bool search2D(List<List<String>> grid, int row, int col, String word) {
    if (grid[row][col] != word[0]) return false;

    int len = word.length;

    for (int dir = 0; dir < 8; dir++) {
      int k, rd = row + x[dir], cd = col + y[dir];

      for (k = 1; k < len; k++) {
        if (rd >= rows || rd < 0 || cd >= columns || cd < 0) break;

        if (grid[rd][cd] != word[k]) {
          positions = [];
          break;
        }
        positions.add([rd, cd]);
        rd += x[dir];
        cd += y[dir];
      }

      if (k == len) {
        positions.add([row, col]);
        return true;
      }
      continue;
    }
    return false;
  }

  void patternSearch(List<String> grid, String word) {
    // List<List<String>> gridInputs = List.generate(row, (i) {
    //   print(
    //       'I am here***********************************************************');
    //   return grid[i].split('').toList();
    // });
    // print(gridInputs);
    List<List<String>> gridInputLists = [];
    for (int i = 0; i < grid.length; i += columns) {
      gridInputLists.add(grid.sublist(i, i + columns));
    }
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        if (gridInputLists[row][col] == word[0] &&
            search2D(gridInputLists, row, col, word)) {
          position = convertList(positions);
          Fluttertoast.showToast(
              msg: 'Found the word',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          positions.clear();
          flag = true;
          notifyListeners();
        }
      }
    }
    if (!flag) {
      Fluttertoast.showToast(
          msg: 'Word not found',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      wordToCheck = ''; 
      position.clear();
    }
    flag = false;
  }

  reset() {
    wordToCheck = '';
    notifyListeners();
  }

  // convert List<List<int>> to List<int> for easy access
  List<int> convertList(List<List<int>> list) {
    List<int> newList = [];
    for (int i = 0; i < list.length; i++) {
      newList.add(list[i][0] * columns + list[i][1]);
    }
    return newList;
  }
}
