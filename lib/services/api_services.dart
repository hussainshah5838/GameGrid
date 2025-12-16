import 'package:dio/dio.dart';
import 'package:game_grid/config/helper/logger.dart';
import 'package:game_grid/model/match_details_model.dart';
import 'package:game_grid/model/player_details_model.dart';
import 'package:game_grid/model/league_list_model.dart';
import 'package:game_grid/model/league_team_model.dart';
import 'package:game_grid/model/team_league_model.dart';
import 'package:game_grid/model/today_sports_monk_model.dart';
import 'package:game_grid/model/todays_matches_model.dart';
import 'package:http/http.dart' as http;

import '../model/football_scores_model.dart';

final String baseurlForImages =
    "https://api.football-data-api.com/?key=2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6";

class ApiService {
  // Base URL for all API calls
  // static const String _baseUrl = "http://www.goalserve.com/getfeed/f21daf115aeb4dbc39ed08ddad4f0258";

  static const String _baseUrl = "https://api.football-data-api.com/";
  static const String _baseUrlSportsMonk =
      "https://api.sportmonks.com/v3/football/livescores/inplay";
  final dio = Dio();

  Future<TodaysMatchesModel?> fetchTodayMatches(String endpoint) async {
    try {
      final resp = await dio.get("${_baseUrl}$endpoint", queryParameters: {
        "key":
            "2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6"
      });

      if (resp.statusCode == 200) {
        prettyLogger(resp.data);
        return TodaysMatchesModel.fromJson(resp.data);
      } else {
        return resp.data;
      }
    } catch (e) {
      throw ("Error $e");
    }
  }

  Future<MatchDetailsModel?> fetchMatchDetails(
      String endpoint, String matchId) async {
    try {
      final resp = await dio.get("${_baseUrl}$endpoint", queryParameters: {
        "key":
            "2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6",
        "match_id": matchId
      });

      if (resp.statusCode == 200) {
        prettyLogger(resp.data);
        final data = resp.data;
        if (data is Map<String, dynamic>) {
          final hasPayload = data['data'] != null;
          if (hasPayload) {
            return MatchDetailsModel.fromJson(data);
          }
          final msg = data['message'] ?? 'No match data returned';
          throw Exception(msg.toString());
        }
        throw Exception('Unexpected match response shape');
      }
      throw Exception('Match-details request failed: ${resp.statusCode}');
    } catch (e) {
      throw ("Error $e");
    }
  }

  Future<TodaysMatchesSportsMonkModel?>
      fetchTodayMatchesFromSportsMonk() async {
    try {
      final resp = await dio.get("${_baseUrlSportsMonk}", queryParameters: {
        "api_token":
            "B3NHDaDHHuBfTlPkoRgaReVJezrvzOaSsRJQPPgWeQhnMrf2rz42hCMwJoBm",
        "include": "participants;scores;periods;events;league.country;round"
      });

      if (resp.statusCode == 200) {
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
        throw Exception(
            'Failed to load scores. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any network or parsing errors
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<PlayerDetailsModel?> fetchPlayerDetails(String playerId) async {
    try {
      final resp = await dio.get(
        "${_baseUrl}player",
        queryParameters: {
          "key":
              "2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6",
          "player_id": playerId,
        },
      );

      if (resp.statusCode == 200) {
        prettyLogger(resp.data);
        return PlayerDetailsModel.fromJson(resp.data);
      } else {
        return resp.data;
      }
    } catch (e) {
      throw ("Error $e");
    }
  }

  Future<LeagueListModel?> fetchLeagueList({String? country}) async {
    try {
      final resp = await dio.get(
        "${_baseUrl}league-list",
        queryParameters: {
          "key":
              "2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6",
          if (country != null && country.isNotEmpty) "country": country,
        },
      );
      if (resp.statusCode == 200) {
        prettyLogger(resp.data);
        return LeagueListModel.fromJson(resp.data);
      } else {
        return resp.data;
      }
    } catch (e) {
      throw ("Error $e");
    }
  }

  Future<LeagueDetailsModel?> fetchLeagueSeason(String seasonId) async {
    try {
      final resp = await dio.get(
        "${_baseUrl}league-season",
        queryParameters: {
          "key":
              "2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6",
          "season_id": seasonId,
        },
      );

      if (resp.statusCode == 200) {
        final data = resp.data;
        prettyLogger(data);
        if (data is Map<String, dynamic>) {
          final success = data['success'] == true;
          final hasPayload = data['data'] != null;
          if (success && hasPayload) {
            try {
              return LeagueDetailsModel.fromJson(data);
            } catch (e) {
              throw Exception('Parsing league-season failed: $e');
            }
          }
          final msg = data['message'] ?? 'No league data returned';
          throw Exception(msg.toString());
        }
        throw Exception('Unexpected league-season response shape');
      }
      throw Exception('League-season request failed: ${resp.statusCode}');
    } catch (e) {
      throw ("Error $e");
    }
  }

  Future<LeagueTeamsModel?> fetchLeagueTeams(String seasonId) async {
    try {
      final resp = await dio.get(
        "${_baseUrl}league-teams",
        queryParameters: {
          "key":
              "2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6",
          "season_id": seasonId,
        },
      );

      if (resp.statusCode == 200) {
        final data = resp.data;
        prettyLogger(data);
        if (data is Map<String, dynamic>) {
          final success = data['success'] == true;
          final hasPayload = data['data'] != null;
          if (success && hasPayload) {
            try {
              return LeagueTeamsModel.fromJson(data);
            } catch (e) {
              throw Exception('Parsing league-teams failed: $e');
            }
          }
          final msg = data['message'] ?? 'No teams data returned';
          throw Exception(msg.toString());
        }
        throw Exception('Unexpected league-teams response shape');
      }
      throw Exception('League-teams request failed: ${resp.statusCode}');
    } catch (e) {
      throw ("Error $e");
    }
  }

  Future<Map<String, dynamic>?> fetchTeamStats(int teamId) async {
    try {
      final resp = await dio.get(
        "${_baseUrl}team",
        queryParameters: {
          "key":
              "2721f00df0f151eb69007bb25680d802914a91c582599887e48bc139e37ffcc6",
          "team_id": teamId,
        },
      );

      if (resp.statusCode == 200) {
        final data = resp.data;
        prettyLogger(data);
        if (data is Map<String, dynamic>) {
          final list = data['data'];
          if (list is List && list.isNotEmpty && list.first is Map) {
            return list.first as Map<String, dynamic>;
          }
          final msg = data['message'] ?? 'No team data returned';
          throw Exception(msg.toString());
        }
        throw Exception('Unexpected team response shape');
      }
      throw Exception('Team request failed: ${resp.statusCode}');
    } catch (e) {
      throw ("Error $e");
    }
  }
}
