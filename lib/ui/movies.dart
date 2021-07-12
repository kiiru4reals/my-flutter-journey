import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
            return Stack(
                children: <Widget>[
                      movieCard (movieList[index], context),

                  Positioned(
                    top: 10,

                      child: movieImage(movieList[index].images[0]))
                ] );
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
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[1]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieExtraPosters(posters: movie.images,)
        ],
      ),

        );


  }

}
class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover
                )
              ),
            ),
            Icon(Icons.play_circle_filled_outlined, size: 100,
            color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
          ),
          height: 80,
        )
      ],
    );
  }
}

Widget movieCard(Movie movie, BuildContext context){
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(left: 60),
      width: MediaQuery.of(context).size.width,
      height: 120.0,
      child: Card(
        color: Colors.black45,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0,
          bottom: 8.0,
          left: 54.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Flexible(
                    child: Text(movie.title, style: TextStyle (
                        fontWeight: FontWeight.bold,
                        fontSize:17.0,
                        color: Colors.white),
                    ),
                  ),
                    Text("Rating: ${movie.imdbRating} /10",
                    style: mainTextStyle()),
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
    ),
    onTap: () => {Navigator.push(context, MaterialPageRoute(
        builder: (context) => MovieListViewDetails(movieName: movie.title,
             movie: movie )))},
    );
}

Widget movieImage(String imageUrl){
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover
      ),

    ),
  );
}
TextStyle mainTextStyle(){
  return TextStyle(
      fontSize: 15.0,
      color: Colors.grey
  );
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(width: 16),
          Expanded(
            child: (MovieDetailsHeader(movie: movie))
          )
        ],
        
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key? key, required this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width /4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(poster),
            fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${movie.year} . ${movie.genre}".toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.cyan
        ),),
        Text(movie.title, style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 32
        ),),
        Text.rich(TextSpan(style: TextStyle(
          fontSize: 13,fontWeight: FontWeight.w300,
        ),
            children: <TextSpan>[
              TextSpan(
                  text: movie.plot
              ),
              TextSpan(
                text: "More...",
                style: TextStyle(
                  color: Colors.indigoAccent
                )
              )
            ]))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field: "Cast", value: movie.actors),
          MovieField(field: "Directors", value: movie.director),
          MovieField(field: "Awards", value: movie.awards)
          
        ],
      ),
    );
  }
}
class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key? key, required this.field, required this.value} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field : ", style: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          fontWeight: FontWeight.w300
        ),),
        Expanded(
          child: Text(value, style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w300
          ),),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: .5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieExtraPosters extends StatelessWidget {
  final List<String> posters;

  const MovieExtraPosters({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("More movie posters".toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          color: Colors.black26
        ),),
        Container(
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: posters.length,
              separatorBuilder: (context, index) => SizedBox(width: 8,),
    itemBuilder: (context, index) => ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: MediaQuery.of(context).size.width /4,
        height: 160,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(posters[index]),
          fit: BoxFit.cover)
        ),
      ),

    )),
        )
      ],

    );
  }
}


