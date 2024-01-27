import 'package:flutter/material.dart';
import 'package:movie_app/details_screen.dart';
import 'package:movie_app/models/upcoming_movie_models.dart';

import 'constant.dart';
class UpcomingMovieSlider extends StatefulWidget {
  const UpcomingMovieSlider({super.key, required this.snapshot});
  final UpcomingMovieModels snapshot;

  @override
  State<UpcomingMovieSlider> createState() => _UpcomingMovieSliderState();
}

class _UpcomingMovieSliderState extends State<UpcomingMovieSlider> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height*1;
    final width = MediaQuery.sizeOf(context).width*1;
    return  SizedBox(
      height: height*.22,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.snapshot.results!.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(trendingMovie: widget.snapshot.results![index])));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: height*.3,
                    width:width*.3,
                    child: Image.network(fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        Constant.imagePath+widget.snapshot.results![index].posterPath.toString()
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
