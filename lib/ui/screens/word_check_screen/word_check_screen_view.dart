import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'word_check_screen_view_model.dart';

part 'word_check_screen_mobile.dart';

class WordSearchScreenView extends StatelessWidget {
  final int row;
  final int column;
  final List<String> gridList;
  const WordSearchScreenView(
      {Key? key,
      required this.row,
      required this.column,
      required this.gridList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WordSearchScreenViewModel>.reactive(
        viewModelBuilder: () => WordSearchScreenViewModel(
              context: context,
              rows: row,
              columns: column,
              gridList: gridList,
            ),
        onModelReady: (model) {
          // Do Something on Model Ready
          model.addGridInput();
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
              mobile: _WordSearchScreenMobile(
            viewModel: model,
          ));
        });
  }
}
