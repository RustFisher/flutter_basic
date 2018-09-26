import 'package:flutter/material.dart';

void main() {
  runApp(HeroApp());
}

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hexo demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
            tag: 'imageHero',
            child: Image.network(
                'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg')),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailScreen()));
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
              tag: 'imageHero',
              child: Image.network(
                  'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg')),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
