import 'package:briefnet/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';

class CelebrationScreen extends StatefulWidget {
  const CelebrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CelebrationScreenState createState() => _CelebrationScreenState();
}

class _CelebrationScreenState extends State<CelebrationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    _confettiController =
        ConfettiController(duration: const Duration(seconds: 40));

    // After the animation completes, navigate to the Home screen
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Home(),
        ));
      }
    });

    // Launch confetti when the screen is shown
    _confettiController.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Congratulations!',
                    style: GoogleFonts.redHatDisplay(
                      textStyle: const TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Unlock Limitless Learning!',
                    style: GoogleFonts.redHatDisplay(
                      textStyle: const TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Watch - Anytime, Anywhere!',
                    style: GoogleFonts.redHatDisplay(
                      textStyle: const TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Text(
                'BriefNet',
                style: GoogleFonts.crimsonPro(
                  textStyle: const TextStyle(
                    color: CupertinoColors.systemYellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -1.0, // set the confetti to float upward
              shouldLoop: false, // don't loop the animation
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.orange,
                Colors.pink
              ], // set confetti colors
              maxBlastForce: 10, // set the maximum blast force
              minBlastForce: 5, // set the minimum blast force
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05, // how often confetti should be emitted
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CelebrationScreen(),
  ));
}
