import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/router/nameroute.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> imageListCarouselSlider = [
      'assets/images/arcane.png',
      'assets/images/Thor_Ragnarok.png',
      'assets/images/Pirates.png'
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/arcane.png'),
            child: TextButton(
                onPressed: () {
                 context.go(NameRoute.loginScreen);
                },
                child: Container()), // Avatar image
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Hello, Timur K.',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Tab Bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: DefaultTabController(
              length: 4,
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.yellow,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Movies'),
                  Tab(text: 'TV Shows'),
                  Tab(text: 'Anime'),
                  Tab(text: 'My List'),
                ],
              ),
            ),
          ),
          // Carousel/Slider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 300,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  viewportFraction: 0.6,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                ),
                items: imageListCarouselSlider.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: MovieItem(image: i, title: ""));
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 20),
          // "Episode 1 Pow Pow"
          Center(
            child: Text(
              'Episode 1',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Center(
            child: Text(
              'Pow Pow',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Recent Watched section
          SectionHeader(title: 'Recent Watched'),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MoviePoster(
                    image: 'assets/images/arcane.png', title: 'Captain Marvel'),
                MoviePoster(image: 'assets/images/arcane.png', title: 'Joker'),
                MoviePoster(
                    image: 'assets/images/arcane.png', title: 'The Hobbit'),
                MoviePoster(
                    image: 'assets/images/arcane.png', title: 'Captain Marvel'),
                MoviePoster(image: 'assets/images/arcane.png', title: 'Joker'),
                MoviePoster(
                    image: 'assets/images/arcane.png', title: 'The Hobbit'),
              ],
            ),
          ),
          SizedBox(height: 20),
          // My Favorites section
          SectionHeader(title: 'My Favorites'),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MoviePoster(
                    image: 'assets/images/arcane.png', title: 'Movie 1'),
                MoviePoster(
                    image: 'assets/images/Pirates.png', title: 'Movie 2'),
                MoviePoster(
                    image: 'assets/images/Thor_Ragnarok.png', title: 'Movie 3'),
                MoviePoster(
                    image: 'assets/images/Pirates.png', title: 'Movie 1'),
                MoviePoster(
                    image: 'assets/images/arcane.png', title: 'Movie 2'),
                MoviePoster(
                    image: 'assets/images/Thor_Ragnarok.png', title: 'Movie 3'),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: SizedBox(
        height: 110,
        child: FloatingNavbar(
          backgroundColor: Color.fromRGBO(75, 75, 81, 0.9),
          onTap: (int val) {},
          currentIndex: 0,
          items: [
            FloatingNavbarItem(
                customWidget: Icon(
              Icons.home_filled,
              size: 30,
            )),
            FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
            FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
            FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
          ],
        ),
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  final String image;
  final String title;

  const MovieItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'See all',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String image;
  final String title;

  const MoviePoster({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
