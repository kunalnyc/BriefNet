import 'package:briefnet/Screens/Membership/start_membership.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreenPage extends StatefulWidget {
  const IntroScreenPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroScreenPageState createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.00,
        leading: IconButton(
          color: CupertinoColors.white,
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: CupertinoColors.black,
      ),
      backgroundColor: CupertinoColors.black,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              const IntroSlide(
                image:
                    'https://images.unsplash.com/photo-1523580846011-d3a5bc25702b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGVkdWNhdGlvbnxlbnwwfHwwfHx8MA%3D%3D',
                title: 'Welcome to BriefNet',
                description: 'Discover a world of educational content.',
                key: null,
                tap: CupertinoButton(onPressed: null, child: Text('')),
              ),
              const IntroSlide(
                image:
                    'https://images.unsplash.com/photo-1611262588019-db6cc2032da3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFjaW50b3NofGVufDB8fDB8fHww',
                title: 'Learn Anywhere, Anytime',
                description: 'Access courses and videos on the go.',
                key: null,
                tap: CupertinoButton(onPressed: null, child: Text('')),
              ),
              IntroSlide2(
                image:
                    'https://images.unsplash.com/photo-1518770660439-4636190af475?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dGVjaG5vbG9neXxlbnwwfHwwfHx8MA%3D%3D',
                title: 'Start Learning Today',
                description: 'Join our community and expand your knowledge.',
                key: null,
                tap: CupertinoButton(
                  color: CupertinoColors.systemYellow,
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            const MembershipOptionsScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Text('Start Membership',
                      style: GoogleFonts.crimsonText(
                        textStyle: const TextStyle(
                          color: CupertinoColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: _currentPage == index ? 10 : 8,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.yellow : Colors.grey,
      ),
    );
  }
}

class IntroSlide extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final CupertinoButton tap;

  // ignore: use_super_parameters
  const IntroSlide({
    /// required Key key,
    required this.image,
    required this.title,
    required this.description,
    required this.tap,
    required key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          image,
          height: 300,
        ),
        const SizedBox(height: 40),
        Text(title,
            style: GoogleFonts.crimsonText(
              textStyle: const TextStyle(
                color: CupertinoColors.systemYellow,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            )),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(description,
              selectionColor: CupertinoColors.systemYellow,
              textAlign: TextAlign.center,
              style: GoogleFonts.crimsonText(
                textStyle: const TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class IntroSlide2 extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final CupertinoButton tap;

  // ignore: use_super_parameters
  const IntroSlide2({
    /// required Key key,
    required this.image,
    required this.title,
    required this.description,
    required this.tap,
    required key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          image,
          height: 300,
        ),
        const SizedBox(height: 40),
        Text(title,
            style: GoogleFonts.crimsonText(
              textStyle: const TextStyle(
                color: CupertinoColors.systemYellow,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            )),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(description,
              selectionColor: CupertinoColors.systemYellow,
              textAlign: TextAlign.center,
              style: GoogleFonts.crimsonText(
                textStyle: const TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
        ),
        const SizedBox(height: 20),
        CupertinoButton(
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const MembershipOptionsScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(1.0, 0.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: tap)
      ],
    );
  }
}
