import 'package:flutter/material.dart';

class Movies extends StatefulWidget {
  final List films = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Ozark",
    "Richie Rich"
  ];
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.purpleAccent.shade700,
        centerTitle: true
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: films.length,
          itemBuilder: (BuildContext context, int index){
        return Card(
          color: Colors.white,
          child: ListTile(
            title: Text(films[index]),
          ),
        );
      }),
    );
  }
}
