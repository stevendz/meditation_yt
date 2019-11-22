import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomBody(),
          // CustomAppbar(),
          // NavBar(),
        ],
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Section(
              headline: 'Meditation',
              description: 'discover happiness',
              img: AssetImage('assets/dessert.jpg'),
            ),
            Section(
              headline: 'Sensations',
              description: 'feel the moment',
              img: AssetImage('assets/galaxy.jpg'),
            ),
          ],
        ),
        Center(
          child: Section(
                headline: 'Daydream',
                description: 'go beyond the form',
                img: AssetImage('assets/beach.jpg'),
              ),
        ),
      ],
    );
  }
}

class Section extends StatelessWidget {
  final String headline;
  final String description;
  final ImageProvider img;

  const Section({this.headline, this.description, this.img});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: img,
        ),
      ),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: headline,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            children: <TextSpan>[
              TextSpan(
                text: '\n$description',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
