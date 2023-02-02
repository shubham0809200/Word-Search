import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:word_search/core/route_constants.dart';
import 'package:word_search/ui/screens/value_input_screen/value_input_screen_view.dart';

import 'home_screen_view_model.dart';

part 'home_screen_mobile.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.nonReactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        // onModelReady: (model) {
        //   // Do Something on Model Ready
        // },
        builder: (context, model, child) {
          return ScreenTypeLayout(
              mobile: _HomeScreenMobile(
            viewModel: model,
          ));
        });
  }
}
