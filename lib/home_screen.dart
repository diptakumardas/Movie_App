import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/details_screen.dart';
import 'package:movie_app/models/top_rated_movies_model.dart';
import 'package:movie_app/models/trending_movies_model.dart';
import 'package:movie_app/models/upcoming_movie_models.dart';
import 'package:movie_app/widget/top_rated_movie_slider.dart';
import 'package:movie_app/widget/trending_slider.dart';
import 'package:movie_app/widget/upcoming_movie_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<TrendingMovieModel> trendingMovies;
  late Future<TopRatedMoviesModel> topratedMovies;
  late Future<UpcomingMovieModels> upcomingMovies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Api().getTrendingMovie();
    topratedMovies = Api().getTopRatedMovie();
    upcomingMovies = Api().getUpcomingMovie();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'lib/asset/images/nutflixx.png',
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          scale: 2,

        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trending Movies',
              style: GoogleFonts.aBeeZee(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingSlider(snapshot: snapshot.data!);
                    } else {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  }),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Top Rated Movie",
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const SizedBox(
              height: 32,
            ),
             SizedBox(
               child: FutureBuilder(
                   future: topratedMovies,
                   builder: (context, snapshot) {
                     if (snapshot.hasError) {
                       return Center(
                         child: Text(snapshot.error.toString()),
                       );
                     } else if (snapshot.hasData) {
                       return TopRatedMovieSlider(snapshot: snapshot.data!);
                     } else {
                       return const Center(child: CircularProgressIndicator(),);
                     }
                   }
                   ),
             ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Upcoming Movie",
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return UpcomingMovieSlider(snapshot: snapshot.data!);
                    } else {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
