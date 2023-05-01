import 'package:flutter/material.dart';
import 'package:moviesapp/models/Movie.dart' as models;

import '../models/MovieInfo.dart';
import '../services/MovieService.dart';

class MovieItem extends StatelessWidget {
  final models.Movie movie;

  MovieItem({this.movie});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieInfo>(
      future: getMovie(this.movie.imdbID),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
        {
          return SizedBox(height: 0,);
        }
        return Container(
            padding: EdgeInsets.all(10.0),
            width: 150.0,
            height: MediaQuery.of(context).size.height * 0.23,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 33.0, bottom: 10, right: 10),
                  padding:
                      EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 15),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.22,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.15),
                        offset: Offset(5.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            height: 30,
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  this.movie.title,
                                  style: TextStyle(fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            //height: 30,
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                            snapshot.data.genre.replaceAll(",", " |"),
                            style: TextStyle(color: Colors.grey),
                         )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
           
            );
      }
    );
  }
}
