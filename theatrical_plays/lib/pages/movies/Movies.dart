import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/pages/movies/LoadingMovies.dart';
import 'package:theatrical_plays/pages/movies/MovieInfo.dart';
import 'package:theatrical_plays/using/MyColors.dart';
import 'package:theatrical_plays/using/SearchWidget.dart';

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
  String query = '';
  List<Movie> selectedMovies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors().black,
        body: Container(
            child: Column(
          children: [
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
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
                      subtitle: Text("Duration: ${movies[index].duration}",
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
                    child: Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              color: MyColors().gray,
                              child: Text(
                                "Compare ticket prices (${selectedMovies.length})",
                                style: TextStyle(
                                    color: MyColors().cyan, fontSize: 18),
                              ),
                              onPressed: () {
                                // print("Click");
                                selectedMovies.length < 5
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompareMovies(selectedMovies)))
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text(
                                            "You can't compare more than 4 movies"),
                                      ));
                              },
                            )),
                        SizedBox(
                            width: double.infinity,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              color: MyColors().gray,
                              child: Text(
                                "Clear",
                                style: TextStyle(
                                    color: MyColors().cyan, fontSize: 18),
                              ),
                              onPressed: () {
                                setState(() {
                                  List<Movie> removeList = [];
                                  selectedMovies.forEach((item) {
                                    removeList.add(item);
                                  });
                                  removeList.forEach((removeItem) {
                                    for (var movie in movies) {
                                      if (movie.id == removeItem.id) {
                                        movie.isSelected = !movie.isSelected;
                                      }
                                    }
                                  });
                                  selectedMovies.clear();
                                });
                              },
                            ))
                      ],
                    ))
                : Container()
          ],
        )));
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Movie name',
        onChanged: searchMovies,
      );

  Future searchMovies(String query) async {
    // final search = actors.where((actor) {
    //   final searchActors = actor.fullName.toLowerCase();
    //   final searchLower = query.toLowerCase();

    //   return searchActors.contains(searchLower);
    // }).toList();
    // if (query.isEmpty) {
    //   setState(() {
    //     this.query = "";
    //     this.actors = LoadingActors().createState().loadActors() as List<Actor>;
    //   });
    // } else {
    //   setState(() {
    //     this.query = query;
    //     this.actors = search;
    //   });
    // }
    final List<Movie> search =
        await LoadingMovies().createState().loadMovies(query);
    if (!mounted) return;
    setState(() {
      this.query = query;
      this.movies = search;
    });
  }
}
