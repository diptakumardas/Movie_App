import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/models/trending_movies_model.dart' ;
import 'package:movie_app/widget/constant.dart';

import 'models/result_model.dart';



class DetailsScreen extends StatelessWidget {

  const DetailsScreen({super.key,required this.trendingMovie,});
  final Results trendingMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          flexibleSpace: FlexibleSpaceBar(),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(trendingMovie.title.toString(),style: GoogleFonts.aboreto(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height*.7,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft:Radius.circular(40) ),
                      child: Image.network(Constant.imagePath+trendingMovie.posterPath.toString(),filterQuality: FilterQuality.high,fit: BoxFit.cover,)),
                ),
        
              ],
            ),
            Text("OverView",style: GoogleFonts.acme(fontSize: 30,fontWeight: FontWeight.bold),),
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15) ),
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(

                    height: MediaQuery.sizeOf(context).height*.3,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(trendingMovie.overview.toString(),style:GoogleFonts.abhayaLibre(fontSize: 20,),),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 8
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text('Release Date: ',style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w600),),
                        Text(trendingMovie.releaseDate.toString(),style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 15),)
                      ],
                    ),

                  ),
                  Container(padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text('Rating : ',style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w600),),
                        Icon(Icons.star,color: Colors.yellow,size: 20,),
                        Text(trendingMovie.voteAverage?.toStringAsFixed(1)??'',style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 15),)
                      ],
                    ),

                  ),

                ],

              ),
            )
          ],

        ),
      ),


    );
  }
}
