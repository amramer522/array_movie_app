import 'package:array_movie_app/screens/movies/components/item_movie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies List"),
      ),
      body: FutureBuilder(
        future: Dio().get(
            "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9"),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            var data = MoviesData.fromJson(snapShot.data!.data);
            // return Center(child: Text(data.movies[0].overview));
            // return Center(child: Text((snapshot.data!.data as Map<String,dynamic>)["results"][0]["original_title"]));
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => ItemMovie(
                  title: data.movies[index].title,
                  imageUrl: data.movies[index].backdropPath,
                ),
                itemCount: data.movies.length);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
