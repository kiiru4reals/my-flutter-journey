import 'package:flutter/material.dart';
import 'package:my_flutter_journey/model/movie.dart';


final List<Movie> movieList = Movie.getMovies();
final List movies = [
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
  "Richie rich",
  "Ozark"
];
class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
            return movieCard (movieList[index], context);
      //   return Card(
      //     elevation: 4.5,
      //   color: Colors.white,
      //   child: ListTile(
      //     leading: CircleAvatar(
      //       child: Container(
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //             image: NetworkImage(movieList[index].images[0]),
      //             fit: BoxFit.cover
      //           ),
      //           color: Colors.blue,
      //           borderRadius: BorderRadius.circular(12.9)
      //         ),
      //         child: null,
      //       ),
      //     ),
      // trailing: Text("..."),
      // title: Text(movieList[index].title),
      //     subtitle: Text("${movieList[index].year}"),
      //     // onTap: () => debugPrint ("Movie name: ${movies[index]}"),
      //     onTap: (){
      //       Navigator.push(context, MaterialPageRoute(
      //           builder: (context) => MovieListViewDetails(movieName: movieList[index].title,
      //           movie: movieList[index],)));
      //     },
      //
      // ),
      //   );
      }),
    );
  }
}

// New route
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key? key, required this.movieName, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text("Movies"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Go back ${this.movie.director}",),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey.shade400
            ),
          ),
        ),
      ),
    );

  }

}
Widget movieCard(Movie movie, BuildContext context){
  return InkWell(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 120.0,
      child: Card(
        color: Colors.black45,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0,
          bottom: 8.0,
          left: 54.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                Text(movie.title),
                  Text("Rating: ${movie.imdbRating} /10"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Released: ${movie.released}"),
                  Text(movie.runtime),
                  Text(movie.rated)
                ],
              )
          ],
          ),
        ),
      ),
    ),
    onTap: () => {Navigator.push(context, MaterialPageRoute(
        builder: (context) => MovieListViewDetails(movieName: movie.title,
             movie: movie )))},
    );
}
