import 'package:briefnet/Screens/video/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Series extends StatefulWidget {
  const Series({super.key});

  @override
  State<Series> createState() => _SeriesState();
}

class _SeriesState extends State<Series> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: CupertinoColors.white,
          ),
        ),
        backgroundColor: CupertinoColors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
              color: CupertinoColors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: Colors.black,
                child: Container(
                  height: 200,
                  width:
                      MediaQuery.of(context).size.width * 0.9, // Adjust width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: Border.all(color: Colors.white),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://img.youtube.com/vi/Vm4tx1O9GAc/maxresdefault.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Padding(
                          //       padding: EdgeInsets.all(8.0),
                          //       child: Text(
                          //         'Silicon Valley',
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 30,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Padding(
                          //       padding: EdgeInsets.all(8.0),
                          //       child: Text(
                          //         'Drama . Tech . Startups . Entrepreneurship . Humor ',
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 12,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          const String videoUrl =
                              "https://www.youtube.com/watch?v=ab1H602yc_Y";
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const VideoPlayerScreen(
                                videoUrl: videoUrl,
                              ),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 60, // Adjust size
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Silicon Valley',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '2019 | 28:14 ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Add spacing
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text(
                      'HD',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Add spacing
                  GestureDetector(
                    onTap: () {
                      // Implement functionality for "More" button
                    },
                    child: const Text(
                      'More',
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity, // Make the button wide
                  child: CupertinoButton(
                    color: Colors.white,
                    child: const Text(
                      'Play',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity, // Make the button wide
                  child: CupertinoButton(
                    color: CupertinoColors.darkBackgroundGray,
                    child: const Text(
                      'Download',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Silicon Valley | Ten Years Later: The Extended Pied Piper Documentary | HBO',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.hand_thumbsup_fill,
                            color: Colors.white)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share,
                            color: Colors.white)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.download_circle_fill,
                            color: Colors.white))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
