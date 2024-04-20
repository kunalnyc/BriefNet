import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data'; // Add this import statement

class LibraryScreen extends StatefulWidget {
  const LibraryScreen();

  @override
  // ignore: library_private_types_in_public_api
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  // Sample video URLs for testing
  List<String> videoUrls = [
    'https://youtu.be/jGwO_UgTS7I?si=4caAJj8v4yMt3H7z',
    'https://youtu.be/lDwow4aOrtg?si=HnMR89qOyjMR2ClV',
    // Add more video URLs as needed
  ];
  Future<Uint8List?> fetchYoutubeThumbnail(String videoId) async {
    final response = await http.get(
      Uri.parse('https://img.youtube.com/vi/$videoId/maxresdefault.jpg'),
    );

    if (response.statusCode == 200) {
      return Uint8List.fromList(response.bodyBytes); // Convert to Uint8List
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      itemCount: videoUrls.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust the number of columns as needed
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return FutureBuilder<Uint8List?>(
          future: fetchYoutubeThumbnail(videoUrls[index]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading indicator while fetching the thumbnail
            } else if (snapshot.hasError) {
              return const Text(
                  'Error'); // Show an error message if fetching fails
            } else if (snapshot.hasData) {
              return GestureDetector(
                onTap: () {
                  _playVideo(videoUrls[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.memory(snapshot.data!), // Display the thumbnail
                      const SizedBox(height: 8.0),
                      Text(
                        'Video ${index + 1}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(); // Return an empty container by default
            }
          },
        );
      },
    ));
  }

  void _playVideo(String videoUrl) {
    // Extract the video ID from the URL
    RegExp regExp = RegExp(r'^https://youtu\.be/([^\?]+)');
    RegExpMatch? match = regExp.firstMatch(videoUrl);
    if (match != null && match.groupCount >= 1) {
      String videoId = match.group(1)!;
      print("Video ID: $videoId"); // Debugging: Print the extracted video ID

      // Create a YoutubePlayerController and launch the YouTube player
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );

      // Open a new page to play the video
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            progressColors: const ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.redAccent,
            ),
          ),
        ),
      );
    } else {
      // Show an error message if the URL is not valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid YouTube video URL'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
