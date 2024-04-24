import 'package:briefnet/Screens/Membership/start_membership.dart';
import 'package:briefnet/Screens/video/video_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Video {
  final String title;
  final String thumbnailUrl;
  final String videoId;

  Video({
    required this.title,
    required this.thumbnailUrl,
    required this.videoId,
  });
}

class NetflixLikeScreen extends StatefulWidget {
  const NetflixLikeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NetflixLikeScreenState createState() => _NetflixLikeScreenState();
}

class _NetflixLikeScreenState extends State<NetflixLikeScreen> {
  final List<Video> _videos = [
    Video(
      title: 'Los Angeles',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1592096626141-3c7ef0472fdf?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      videoId: 'https://vimeo.com/141187410',
    ),
    // Add more videos as needed
  ];

// Store the currently playing video ID

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          final video = _videos[index];

          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => const VideoScreen()));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              // primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? CupertinoColors.darkBackgroundGray
                                      : CupertinoColors.white,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0),
                              child: Text(
                                "New Arrivals",
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? CupertinoColors.darkBackgroundGray
                                      : CupertinoColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            // primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? CupertinoColors.darkBackgroundGray
                                    : CupertinoColors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8.0),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? CupertinoColors.darkBackgroundGray
                                    : CupertinoColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            // primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? CupertinoColors.darkBackgroundGray
                                    : CupertinoColors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8.0),
                            child: Text(
                              "STEM",
                              style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? CupertinoColors.darkBackgroundGray
                                    : CupertinoColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                child: Card(
                  color: Colors.black,
                  child: Container(
                    height: 450,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      border:
                          Border.all(color: Colors.white), // Add border color
                      image: DecorationImage(
                        image: NetworkImage(
                            video.thumbnailUrl), // Load network image
                        fit: BoxFit
                            .cover, // Ensure the image covers the entire container
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Silicon Valley', // Example text, replace with actual information
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Drama . Tech . Startups . Entrepreneurship . Humor ', // Example text, replace with actual information
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const MembershipOptionsScreen(),
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              var begin =
                                                  const Offset(1.0, 0.0);
                                              var end = Offset.zero;
                                              var curve = Curves.ease;
                                              var tween = Tween(
                                                      begin: begin, end: end)
                                                  .chain(
                                                      CurveTween(curve: curve));
                                              var offsetAnimation =
                                                  animation.drive(tween);
                                              return SlideTransition(
                                                position: offsetAnimation,
                                                child: child,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: CupertinoColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Theme.of(context)
                                                        .brightness ==
                                                    Brightness.light
                                                ? CupertinoColors.white
                                                : CupertinoColors.systemYellow,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 35.0, vertical: 7.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.play_fill,
                                              color: CupertinoColors.black,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Play",
                                              style: TextStyle(
                                                color: CupertinoColors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const MembershipOptionsScreen(),
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              var begin =
                                                  const Offset(1.0, 0.0);
                                              var end = Offset.zero;
                                              var curve = Curves.ease;
                                              var tween = Tween(
                                                      begin: begin, end: end)
                                                  .chain(
                                                      CurveTween(curve: curve));
                                              var offsetAnimation =
                                                  animation.drive(tween);
                                              return SlideTransition(
                                                position: offsetAnimation,
                                                child: child,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            CupertinoColors.tertiaryLabel,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Theme.of(context)
                                                        .brightness ==
                                                    Brightness.light
                                                ? CupertinoColors.tertiaryLabel
                                                : CupertinoColors.white,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0, vertical: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.add,
                                              color: CupertinoColors.white,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "My List",
                                              style: TextStyle(
                                                color: CupertinoColors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    Text(
                      'Pupular on BriefNet',
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          color: Colors.black,
                          child: Container(
                            height: 180,
                            width: 120,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(
                                  color: Colors.white), // Add border color
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1580654842920-37b786f32bfc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Load network image
                                fit: BoxFit
                                    .cover, // Ensure the image covers the entire container
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.black,
                          child: Container(
                            height: 180,
                            width: 120,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(
                                  color: Colors.white), // Add border color
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://plus.unsplash.com/premium_photo-1675314167547-9cb4f72f145f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c2lsaWNvbiUyMHZhbGxleXxlbnwwfHwwfHx8MA%3D%3D'), // Load network image
                                fit: BoxFit
                                    .cover, // Ensure the image covers the entire container
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.black,
                          child: Container(
                            height: 180,
                            width: 120,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(
                                  color: Colors.white), // Add border color
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://plus.unsplash.com/premium_photo-1678566111481-8e275550b700?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Load network image
                                fit: BoxFit
                                    .cover, // Ensure the image covers the entire container
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.black,
                          child: Container(
                            height: 180,
                            width: 120,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(
                                  color: Colors.white), // Add border color
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1460881680858-30d872d5b530?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Load network image
                                fit: BoxFit
                                    .cover, // Ensure the image covers the entire container
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.black,
                          child: Container(
                            height: 180,
                            width: 120,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(
                                  color: Colors.white), // Add border color
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1523430410476-0185cb1f6ff9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Load network image
                                fit: BoxFit
                                    .cover, // Ensure the image covers the entire container
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
