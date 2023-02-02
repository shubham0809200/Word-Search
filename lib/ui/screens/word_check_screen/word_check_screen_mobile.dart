part of 'word_check_screen_view.dart';

class _WordSearchScreenMobile extends StatelessWidget {
  final WordSearchScreenViewModel viewModel;

  const _WordSearchScreenMobile({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search the Word'),
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
                  crossAxisCount: viewModel.columns,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: List.generate(viewModel.rows * viewModel.columns,
                      (index) {
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
                            color: viewModel.position.contains(index)
                                ? Colors.green
                                : Colors.grey),
                        // make a textfield and take input inn every grid in an list of string
                        child: TextField(
                          enabled: false,
                          textAlign: TextAlign.center,
                          controller: TextEditingController(
                            text: viewModel.gridInputs[index],
                          ),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )),
                    );
                  })),
            ),

// make a submit button
            const SizedBox(height: 20),
            // make a textfield to take an input to check word
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                textAlign: TextAlign.center,
                controller: TextEditingController(
                  text: viewModel.wordToCheck,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Word To Check',
                ),
                keyboardType: TextInputType.text,
                onChanged: ((value) {
                  viewModel.wordToCheck = value;
                }),
              ),
            ),
            const SizedBox(height: 20),
            // submit button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.patternSearch(
                          viewModel.gridInputs, viewModel.wordToCheck);
                      viewModel.notifyListeners();
                    },
                    child: const Text('SEARCH'),
                  ),
                ),
                // reset button
                const SizedBox(width: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.reset();
                      viewModel.notifyListeners();
                    },
                    child: const Text('RESET'),
                  ),
                ),
              ],
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
