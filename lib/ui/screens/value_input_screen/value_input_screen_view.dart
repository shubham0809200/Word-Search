import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:word_search/core/route_constants.dart';
import 'package:word_search/ui/screens/word_check_screen/word_check_screen_view.dart';

import 'value_input_screen_view_model.dart';

part 'value_input_screen_mobile.dart';

class ValueInputScreenView extends StatelessWidget {
  final int row;
  final int column;
  const ValueInputScreenView(
      {Key? key, required this.row, required this.column})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ValueInputScreenViewModel>.reactive(
        viewModelBuilder: () => ValueInputScreenViewModel(
          context: context,
          row: row,
          column: column,
        ),
        onModelReady: (model) {
          // Do Something on Model Ready
          model.generateGridInputs();
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
              mobile: _ValueInputScreenMobile(
            viewModel: model,
          ));
        });
  }
}
