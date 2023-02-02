import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  // value of row
  String _row = '0';

  // value of column
  String _column = '0';

  // getter for row
  String get row => _row;

  // getter for column
  String get column => _column;

  // setter for row 
  set row(String value) {
    _row = value;
    notifyListeners();
  }

  // setter for column
  set column(String value) {
    _column = value;
    notifyListeners();
  }
}
