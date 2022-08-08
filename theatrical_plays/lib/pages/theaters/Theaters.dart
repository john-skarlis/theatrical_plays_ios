import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Theater.dart';
import 'package:theatrical_plays/using/MyColors.dart';

import 'CompareTheaters.dart';
import 'TheaterInfo.dart';

// ignore: must_be_immutable
class Theaters extends StatefulWidget {
  List<Theater> theaters = [];
  Theaters(this.theaters);
  @override
  _TheatersState createState() => _TheatersState(theaters: theaters);
}

class _TheatersState extends State<Theaters> {
  List<Theater> theaters = [];
  _TheatersState({this.theaters});

  List<Theater> selectedTheaters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().black,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: theaters.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            //open the tapped item
                            MaterialPageRoute(
                                builder: (context) =>
                                    TheaterInfo(theaters[index].id)));
                      },
                      leading: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://thumbs.dreamstime.com/z/location-pin-icon-165980583.jpg'),
                        ),
                      ),
                      title: Text(
                        theaters[index].title,
                        style: TextStyle(color: MyColors().cyan),
                      ),
                      subtitle: Text(
                        theaters[index].address,
                        style: TextStyle(color: MyColors().white),
                      ),
                      trailing: theaters[index].isSelected
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
                          theaters[index].isSelected =
                              !theaters[index].isSelected;
                          print("Clicked");
                          if (theaters[index].isSelected == true) {
                            selectedTheaters.add(theaters[index]);
                          } else if (theaters[index].isSelected == false) {
                            selectedTheaters.removeWhere(
                                (element) => element.id == theaters[index].id);
                          }
                        });
                      },
                    );
                  }),
            ),
            selectedTheaters.length > 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: SizedBox(
                        width: double.infinity,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: MyColors().gray,
                          child: Text(
                            "Compare (${selectedTheaters.length})",
                            style:
                                TextStyle(color: MyColors().cyan, fontSize: 18),
                          ),
                          onPressed: () {
                            // print("Compare Click");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CompareTheaters(selectedTheaters)));
                          },
                        )))
                : Container()
          ],
        ),
      ),
    );
  }
}
