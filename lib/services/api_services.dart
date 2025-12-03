
import 'package:dio/dio.dart';
import 'package:game_grid/config/helper/logger.dart';
import 'package:game_grid/model/match_details_model.dart';
import 'package:game_grid/model/today_sports_monk_model.dart';
import 'package:game_grid/model/todays_matches_model.dart';
import 'package:http/http.dart' as http;

import '../model/football_scores_model.dart';


  final String baseurlForImages = "https://api.football-data-api.com/?key=2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6";

class ApiService {
  // Base URL for all API calls
  // static const String _baseUrl = "http://www.goalserve.com/getfeed/f21daf115aeb4dbc39ed08ddad4f0258";
  


  static const String _baseUrl = "https://api.football-data-api.com/";
  static const String _baseUrlSportsMonk = "https://api.sportmonks.com/v3/football/livescores/inplay";
  final dio = Dio();

  Future<TodaysMatchesModel?> fetchTodayMatches(String endpoint) async{

    try {
      final resp = await dio.get("${_baseUrl}$endpoint",  queryParameters: {
        "key" : "2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6"
      });

    if(resp.statusCode == 200){

      prettyLogger(resp.data);
      return TodaysMatchesModel.fromJson(resp.data);
    } else {
      return resp.data;
    }

    } catch (e) {
      throw ("Error $e");
    }
  }

   Future<MatchDetailsModel?> fetchMatchDetails(String endpoint, String matchId) async{

    try {
      final resp = await dio.get("${_baseUrl}$endpoint",  queryParameters: {
        "key" : "2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6", 
        "match_id" : matchId
      });

    if(resp.statusCode == 200){

      prettyLogger(resp.data);
      return MatchDetailsModel.fromJson(resp.data);
    } else {
      return resp.data;
    }
    } catch (e) {
      throw ("Error $e");
    }
  }


  Future<TodaysMatchesSportsMonkModel?> fetchTodayMatchesFromSportsMonk() async{

    try {
      final resp = await dio.get("${_baseUrlSportsMonk}",  queryParameters: {
        "api_token" : "B3NHDaDHHuBfTlPkoRgaReVJezrvzOaSsRJQPPgWeQhnMrf2rz42hCMwJoBm", 
        "include" : "participants;scores;periods;events;league.country;round"
      });

    if(resp.statusCode == 200){

      prettyLogger(resp.data);
      return TodaysMatchesSportsMonkModel.fromJson(resp.data);
    } else {
      return resp.data;
    }

    } catch (e) {
      throw ("Error $e");
    }
  }


  Future<FootballApiResponse> fetchFootballScores() async {
    // Construct the final URL
    final String endpoint = "/football/d-2?json=1";
    final Uri url = Uri.parse(_baseUrl + endpoint);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        prettyLogger(response.body);
        return footballApiResponseFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception that the UI can catch.
        throw Exception('Failed to load scores. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any network or parsing errors
      throw Exception('Failed to fetch data: $e');
    }
  }
}