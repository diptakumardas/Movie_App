import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/details_screen.dart';
import 'package:movie_app/widget/constant.dart';
import 'package:movie_app/models/trending_movies_model.dart';

class TrendingSlider extends StatefulWidget {

  const TrendingSlider({super.key, required this.snapshot});
  //final AsyncSnapshot snapshot;
  final TrendingMovieModel snapshot;

  @override
  State<TrendingSlider> createState() => _TrendingSliderState();
}

class _TrendingSliderState extends State<TrendingSlider> {
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height*1;
    final width = MediaQuery.sizeOf(context).width*1;

    return  SizedBox(
      width: width*1,
      child: CarouselSlider.builder(
        itemCount: widget.snapshot.results!.length,
        options: CarouselOptions(
          enlargeCenterPage: true,
          height:  height*.33,
          autoPlay: true,
          viewportFraction: 0.55,
          autoPlayCurve: Curves.fastOutSlowIn,
          pageSnapping: true,
          autoPlayAnimationDuration: const Duration(seconds: 1),

        ),
        itemBuilder: (context, itemIndex,pageViewIndex){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(trendingMovie: widget.snapshot.results![itemIndex]

              )));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: height*.3,
                width: width*.5,
                child: Image.network(fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                Constant.imagePath+widget.snapshot.results![itemIndex].posterPath.toString()
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
