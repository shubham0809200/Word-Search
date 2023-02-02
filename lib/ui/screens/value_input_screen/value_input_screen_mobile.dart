part of 'value_input_screen_view.dart';

class _ValueInputScreenMobile extends StatelessWidget {
  final ValueInputScreenViewModel viewModel;

  const _ValueInputScreenMobile({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Information'),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              // height: MediaQuery.of(context).size.height * 0.7,
              child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: viewModel.column,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children:
                      List.generate(viewModel.row * viewModel.column, (index) {
                    return SizedBox(
                      // color: Colors.grey[300],
                      child: Center(
                          child: Neumorphic(
                        margin: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 3),
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(12)),
                            depth: 8,
                            lightSource: LightSource.topLeft,
                            color: Colors.grey),
                        // make a textfield and take input inn every grid in an list of string
                        child: TextField(
                          textAlign: TextAlign.center,
                          focusNode: viewModel.focusNodeList[index],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          onChanged: (value) {
                            // if value lenght > 1 then cut to to only one character
                            if (value.length > 1) {
                              // substring the value
                              viewModel.gridInputs[index] =
                                  value.substring(0, 1);
                            } else {
                              viewModel.gridInputs[index] = value;
                            }
                            // go to next textfield
                            if (index + 1 < viewModel.row * viewModel.column) {
                              viewModel.focusNodeList[index + 1].requestFocus();
                            }
                          },
                        ),
                      )),
                    );
                  })),
            ),

// make a submit button
            const SizedBox(height: 20),
            // submit button
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, wordSearchScreen,
                      arguments: WordSearchScreenView(
                        row: viewModel.row,
                        column: viewModel.column,
                        gridList: viewModel.gridInputs,
                      ));
                },
                child: const Text('Form Grid'),
              ),
            ),
            const SizedBox(height: 20)
            // Flexible(
            //   flex: 1,
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width * 0.8,
            //     height: 50,
            //     child: ElevatedButton(
            //       onPressed: () {},
            //       child: const Text('Submit'),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
