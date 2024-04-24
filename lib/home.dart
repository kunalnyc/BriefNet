import 'package:briefnet/Screens/profile/profile.dart';
import 'package:briefnet/Screens/research/groups.dart';
import 'package:briefnet/viemo/library_media.dart';
import 'package:briefnet/viemo/viemo_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CupertinoColors.black,
        title: Text(
          'BriefNet',
          style: GoogleFonts.crimsonPro(
            textStyle: const TextStyle(
              color: CupertinoColors.systemYellow,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.tv,
                color: CupertinoColors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.search,
                color: CupertinoColors.white,
              )),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
         const NetflixLikeScreen(),
           const LibraryScreen(),
          ResearchGroupScreen(),
          NetflixProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              color: CupertinoColors.white,
              backgroundColor: CupertinoColors.black,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.transparent,
              gap: 8,
              activeColor: CupertinoColors.systemYellow,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: CupertinoColors.darkBackgroundGray,
              tabs: const [
                GButton(
                  icon: CupertinoIcons.play,
                  text: 'Home',
                ),
                GButton(
                  icon: CupertinoIcons.play_rectangle,
                  text: 'Library',
                ),
                GButton(
                  icon: CupertinoIcons.waveform,
                  text: 'Research',
                ),
                GButton(
                  icon: CupertinoIcons.wind,
                  text: 'My BriefNet',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.ease,
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search Screen Content',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Screen Content',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ResearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Screen Content',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
