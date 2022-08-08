import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/pages/movies/MovieInfo.dart';
import 'package:theatrical_plays/using/MyColors.dart';

import 'CompareMovies.dart';

// ignore: must_be_immutable
class Movies extends StatefulWidget {
  List<Movie> movies = [];
  Movies(this.movies);
  @override
  _MoviesState createState() => _MoviesState(movies: movies);
}

class _MoviesState extends State<Movies> {
  List<Movie> movies = [];
  _MoviesState({this.movies});

  List<Movie> selectedMovies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors().black,
        body: Container(
            child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieInfo(movies[index].id)));
                      },
                      leading: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://thumbs.dreamstime.com/z/print-178440812.jpg'),
                        ),
                      ),
                      title: Text(
                        movies[index].title,
                        style: TextStyle(color: MyColors().cyan),
                      ),
                      subtitle: Text("Duration: " + movies[index].duration,
                          style: TextStyle(color: MyColors().white)),
                      trailing: movies[index].isSelected
                          ? Icon(
                              Icons.check_circle,
                              color: MyColors().cyan,
                            )
                          : Icon(
                              Icons.check_circle_outline,
                              color: MyColors().gray,
                            ),
                      onLongPress: () {
                        setState(() {
                          movies[index].isSelected = !movies[index].isSelected;
                          print("Selected");
                          if (movies[index].isSelected == true) {
                            selectedMovies.add(movies[index]);
                          } else if (movies[index].isSelected == false) {
                            selectedMovies.removeWhere(
                                (element) => element.id == movies[index].id);
                          }
                        });
                      });
                },
              ),
            ),
            selectedMovies.length > 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: SizedBox(
                        width: double.infinity,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: MyColors().gray,
                          child: Text(
                            "Compare ticket prices (${selectedMovies.length})",
                            style:
                                TextStyle(color: MyColors().cyan, fontSize: 18),
                          ),
                          onPressed: () {
                            // print("Click");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CompareMovies(selectedMovies)));
                          },
                        )))
                : Container()
          ],
        )));
  }
}
