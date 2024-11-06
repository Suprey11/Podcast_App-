import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
              // Top Navigation Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "GIMLET",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Profile Image and Title
              Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/profile4.png',
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Heavyweight',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Author and Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Andrew Biletski',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  Text(
                    '4.7',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Episode Title and Description
              Text(
                'Unstoppable Ambition: Ignite Your Potential and Achieve Greatness',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'In this empowering episode, we explore the mindset and habits that transform ambition into unstoppable momentum. Learn how to bring focus and energy to achieve your life goals.',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 20),

              // Interaction Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.chat_bubble_outline, color: Colors.black),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Audio Progress Bar and Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("5:26", style: TextStyle(color: Colors.grey[700])),
                  Expanded(
                    child: Slider(
                      value: 5.26,
                      min: 0.0,
                      max: 12.32,
                      onChanged: (value) {},
                      activeColor: Colors.orange,
                      inactiveColor: Colors.grey[300],
                    ),
                  ),
                  Text("12:32", style: TextStyle(color: Colors.grey[700])),
                ],
              ),
              SizedBox(height: 20),

              // Playback Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.replay_10, size: 32, color: Colors.grey[700]),
                  Icon(Icons.fast_rewind, size: 32, color: Colors.grey[700]),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child:
                        Icon(Icons.play_arrow, size: 36, color: Colors.white),
                  ),
                  Icon(Icons.fast_forward, size: 32, color: Colors.grey[700]),
                  Icon(Icons.forward_10, size: 32, color: Colors.grey[700]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
