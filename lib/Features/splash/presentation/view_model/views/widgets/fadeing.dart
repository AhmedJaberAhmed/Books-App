
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Center(
        child: Text(
          "Read free Books",
          style: GoogleFonts.aboreto(
            textStyle: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
