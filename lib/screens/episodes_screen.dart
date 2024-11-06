import 'package:flutter/material.dart';
import 'package:podcast_app/screens/profile_screen.dart';

class EpisodesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HoverIcon(icon: Icons.grid_view, size: 28),
                  HoverIcon(icon: Icons.notifications_none, size: 28),
                ],
              ),
              SizedBox(height: 20),

              // Section Title
              Text(
                "New Episodes",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Episode Icon Row
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    IconContainer(
                      icon: Icons.search,
                      color: Colors.orange,
                      isRounded: true,
                    ),
                    IconContainer(
                      imagePath: 'assets/profile1.png',
                      isRounded: true,
                    ),
                    IconContainer(
                      imagePath: 'assets/profile2.png',
                      isRounded: true,
                    ),
                    IconContainer(
                      imagePath: 'assets/profile3.png',
                      isRounded: true,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: IconContainer(
                        imagePath: 'assets/profile4.png',
                        isRounded: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Featured Episode Card
              EpisodeCard(),
              SizedBox(height: 20),

              // Podcasts You May Like Section
              Text(
                "Podcasts You May Like",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Suggested Podcast Card
              SuggestedPodcastCard(),
              SizedBox(height: 20),

              // Spacer to push the bottom navigation bar to the bottom
              Spacer(),

              // Bottom Navigation Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HoverIcon(icon: Icons.home, size: 28, color: Colors.grey),
                  HoverIcon(
                    icon: Icons.explore,
                    size: 28,
                    color: Colors.white,
                    backgroundColor: Colors.orange,
                    isCircular: true,
                  ),
                  HoverIcon(icon: Icons.person, size: 28, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HoverIcon for hover effect on icons
class HoverIcon extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final Color? backgroundColor;
  final bool isCircular;

  HoverIcon({
    required this.icon,
    this.size = 24,
    this.color,
    this.backgroundColor,
    this.isCircular = false,
  });

  @override
  _HoverIconState createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        padding: widget.isCircular ? EdgeInsets.all(12) : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: isHovered
              ? (widget.backgroundColor ?? Colors.grey[300])
              : widget.backgroundColor,
          shape: widget.isCircular ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: Icon(
          widget.icon,
          size: widget.size,
          color: isHovered ? Colors.orange : widget.color,
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final Color? color;
  final bool isRounded;
  final VoidCallback? onTap;

  IconContainer({
    this.icon,
    this.imagePath,
    this.color,
    this.isRounded = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color ?? Colors.transparent,
            borderRadius: isRounded ? BorderRadius.circular(12) : null,
          ),
          child: icon != null
              ? Icon(icon, color: Colors.white)
              : (imagePath != null
                  ? ClipRRect(
                      borderRadius: isRounded
                          ? BorderRadius.circular(12)
                          : BorderRadius.zero,
                      child: Image.asset(imagePath!, fit: BoxFit.cover),
                    )
                  : SizedBox.shrink()),
        ),
      ),
    );
  }
}

class EpisodeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Episode Image and Waveform
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.graphic_eq, size: 28, color: Colors.grey),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/researcher_profile.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Icon(Icons.graphic_eq, size: 28, color: Colors.grey),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "S1E2: Fuel Your Fire: A Journey to Motivation",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            "In this episode, we dive deep into the spark that fuels lasting motivation...",
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HoverIcon(
                icon: Icons.favorite_border,
                size: 24,
                color: Colors.grey,
              ),
              HoverIcon(icon: Icons.share, size: 24, color: Colors.grey),
              HoverIcon(icon: Icons.download, size: 24, color: Colors.grey),
              HoverIcon(
                icon: Icons.play_circle_fill,
                color: Colors.orange,
                size: 28,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SuggestedPodcastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.deepOrange[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/researcher_profile.png'),
              radius: 24,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Researcher",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "25k followers",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            Spacer(),
            MouseRegion(
              onEnter: (_) {},
              onExit: (_) {},
              child: TextButton(
                onPressed: () {},
                child: Text("Follow"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
