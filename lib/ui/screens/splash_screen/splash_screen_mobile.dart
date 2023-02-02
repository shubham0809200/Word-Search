part of 'splash_screen_view.dart';

class _SplashScreenMobile extends StatelessWidget {
  final SplashScreenViewModel viewModel;

  const _SplashScreenMobile({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Text(
                  'Welcome to search word',
                  style: GoogleFonts.poppins(
                    height: 2.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0C54BE),
                  ),
                ),
              ),
            ),
            // loading circular bar
            const CircularProgressIndicator(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
