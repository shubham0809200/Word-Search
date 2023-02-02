part of 'home_screen_view.dart';

class _HomeScreenMobile extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  const _HomeScreenMobile({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Search'),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // row input field
            SizedBox(
              width: 300,
              child: TextField(
                controller: TextEditingController(
                  text: viewModel.row.toString(),
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Row',
                ),
                keyboardType: TextInputType.number,
                onChanged: ((value) {
                  viewModel.row = value;
                }),
              ),
            ),
            const SizedBox(height: 20),
            // column input field
            SizedBox(
              width: 300,
              child: TextField(
                controller: TextEditingController(
                  text: viewModel.column.toString(),
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Column',
                ),
                keyboardType: TextInputType.number,
                onChanged: ((value) {
                  viewModel.column = value;
                }),
              ),
            ),
            const SizedBox(height: 20),
            // submit button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, valueInputScreen,
                    arguments: ValueInputScreenView(
                      row: int.parse(viewModel.row.toString()),
                      column: int.parse(viewModel.column.toString()),
                    ));
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
