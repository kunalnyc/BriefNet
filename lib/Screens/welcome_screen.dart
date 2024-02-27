import 'package:briefnet/Screens/Membership/start_membership.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'BriefNet',
                style: GoogleFonts.crimsonPro(
                  textStyle: const TextStyle(
                    color: CupertinoColors.systemYellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '            From Insight to Impact\n Where Research Meets Education. \n       Learn, Anytime, Anywhere',
                        style: GoogleFonts.crimsonText(
                          textStyle: const TextStyle(
                            color: CupertinoColors.systemGrey,
                            //    fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset(
                'assets/play.json',
                width: 200,
                height: 200,
                repeat: true,
                //  reverse: true,
                animate: true,
                frameRate: const FrameRate(120),
                filterQuality: FilterQuality.high,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.transparent,
                  child: TextButton(
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
                    style: TextButton.styleFrom(
                      backgroundColor: CupertinoColors.systemYellow,
                      // primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? CupertinoColors.systemYellow
                                  : CupertinoColors.systemYellow,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text("Start Membership",
                          style: GoogleFonts.crimsonText(
                            textStyle: const TextStyle(
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: CupertinoButton(
            //     onPressed: () => Navigator.push(
            //       context,
            //       CupertinoPageRoute(
            //         builder: (context) => const LoginScreen(),
            //       ),
            //     ),
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.transparent,
            //         borderRadius: BorderRadius.circular(12.0),
            //         border: Border.all(
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //       ),
            //       child: const Center(
            //         child: Text(
            //           'Let\'s Chat',
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
