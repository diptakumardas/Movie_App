import 'dart:convert';

import 'package:movie_app/models/top_rated_movies_model.dart';
import 'package:movie_app/models/trending_movies_model.dart';
import 'package:movie_app/models/upcoming_movie_models.dart';
import '../widget/constant.dart';
import 'package:http/http.dart'as http;

class Api{
  static const _trendingUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apiKey}";
  static const _topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apiKey}";
  static const _upcomingMovieUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apiKey}";

  Future<TrendingMovieModel> getTrendingMovie()async{
    final response = await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode==200){

      final Map<String,dynamic> decodeData = jsonDecode(response.body);
      print(decodeData);
       return TrendingMovieModel.fromJson(decodeData);


      //return decodeData.map((movie) => TrendingMovieModel.fromJson(movie)).toList();

    }
    else{
      throw Exception('error loading data');
    }
  }

  Future<TopRatedMoviesModel> getTopRatedMovie()async{
    final response = await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode==200){

      final Map<String,dynamic> decodeData = jsonDecode(response.body);
      print(decodeData);
      return TopRatedMoviesModel.fromJson(decodeData);


      //return decodeData.map((movie) => TrendingMovieModel.fromJson(movie)).toList();

    }
    else{
      throw Exception('error loading data');
    }
  }

  Future<UpcomingMovieModels> getUpcomingMovie()async{
    final response = await http.get(Uri.parse(_upcomingMovieUrl));
    if(response.statusCode==200){

      final Map<String,dynamic> decodeData = jsonDecode(response.body);
      print(decodeData);
      return UpcomingMovieModels.fromJson(decodeData);


      //return decodeData.map((movie) => TrendingMovieModel.fromJson(movie)).toList();

    }
    else{
      throw Exception('error loading data');
    }
  }
}