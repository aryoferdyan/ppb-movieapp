import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/style/theme.dart' as Style;
import 'package:movieapp/widgets/trending_movies.dart';
import 'package:movieapp/widgets/genres.dart';
import 'package:movieapp/widgets/now_playing.dart';
import 'package:movieapp/widgets/persons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        title: const Text("Movie App"),
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          Container(
            padding: EdgeInsets.all(20.0),
            // ignore: prefer_const_constructors
            child: TextField(
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              decoration: const InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    EvaIcons.searchOutline,
                    color: Color.fromARGB(255, 44, 68, 101),
                  ),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 147, 165, 193),
                hintText: 'Enter Title Name',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 44, 68, 101),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          GenresScreen(),
          TrendingMovies(),
          //   PersonsList(),
        ],
      ),
    );
  }
}
