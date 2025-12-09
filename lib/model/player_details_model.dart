// To parse this JSON data, do
//
//     final playerDetailsModel = playerDetailsModelFromJson(jsonString);

import 'dart:convert';

PlayerDetailsModel playerDetailsModelFromJson(String str) =>
    PlayerDetailsModel.fromJson(json.decode(str));

String playerDetailsModelToJson(PlayerDetailsModel data) =>
    json.encode(data.toJson());

/// FootyStats Player Individual endpoint model.
class PlayerDetailsModel {
  final bool? success;
  final Pager? pager;
  final Metadata? metadata;
  final PlayerData? data;
  final String? message;

  PlayerDetailsModel({
    this.success,
    this.pager,
    this.metadata,
    this.data,
    this.message,
  });

  factory PlayerDetailsModel.fromJson(Map<String, dynamic> json) =>
      PlayerDetailsModel(
        success: json['success'] as bool?,
        pager: json['pager'] != null ? Pager.fromJson(_asMap(json['pager'])) : null,
        metadata:
            json['metadata'] != null ? Metadata.fromJson(_asMap(json['metadata'])) : null,
        data: json['data'] != null ? PlayerData.fromJson(_asMap(json['data'])) : null,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'pager': pager?.toJson(),
        'metadata': metadata?.toJson(),
        'data': data?.toJson(),
        'message': message,
      };
}

class Pager {
  final int? currentPage;
  final int? maxPage;
  final int? resultsPerPage;
  final int? totalResults;

  Pager({
    this.currentPage,
    this.maxPage,
    this.resultsPerPage,
    this.totalResults,
  });

  factory Pager.fromJson(Map<String, dynamic> json) => Pager(
        currentPage: _toInt(json['current_page']),
        maxPage: _toInt(json['max_page']),
        resultsPerPage: _toInt(json['results_per_page']),
        totalResults: _toInt(json['total_results']),
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'max_page': maxPage,
        'results_per_page': resultsPerPage,
        'total_results': totalResults,
      };
}

class Metadata {
  final String? requestLimit;
  final String? requestRemaining;
  final String? requestResetMessage;

  Metadata({
    this.requestLimit,
    this.requestRemaining,
    this.requestResetMessage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        requestLimit: _asString(json['request_limit']),
        requestRemaining: _asString(json['request_remaining']),
        requestResetMessage: _asString(json['request_reset_message']),
      );

  Map<String, dynamic> toJson() => {
        'request_limit': requestLimit,
        'request_remaining': requestRemaining,
        'request_reset_message': requestResetMessage,
      };
}

class PlayerData {
  final int? playerId;
  final int? teamId;
  final String? playerSlug;
  final String? playerName;
  final String? knownName;
  final String? nationality;
  final String? country;
  final String? position;
  final String? preferredFoot;
  final String? birthdate;
  final int? age;
  final String? height;
  final String? weight;
  final String? teamName;
  final String? teamSlug;
  final String? teamLogo;
  final String? leagueName;
  final int? leagueId;
  final String? season;
  final int? appearancesOverall;
  final int? appearancesHome;
  final int? appearancesAway;
  final int? gamesStarted;
  final int? subIn;
  final int? subOut;
  final int? minutesPlayedOverall;
  final int? goalsOverall;
  final int? goalsHome;
  final int? goalsAway;
  final int? assistsOverall;
  final int? yellowCardsOverall;
  final int? redCardsOverall;
  final int? cleanSheetsOverall;
  final int? goalsConcededOverall;
  final int? penaltiesTaken;
  final int? penaltiesScored;
  final int? penaltiesMissed;
  final int? penaltiesSaved;
  final double? ratingOverall;
  final int? manOfTheMatch;
  final int? minutesPerGoal;
  final double? goalsPer90;
  final double? assistsPer90;
  final double? goalsAndAssistsPer90;
  final double? shotsPerGame;
  final double? shotsOnTargetPerGame;
  final double? keyPassesPerGame;
  final double? dribblesPerGame;
  final double? dribblesSuccessRate;
  final double? touchesPerGame;
  final double? passSuccess;
  final double? crossAccuracy;
  final double? longBallAccuracy;
  final double? throughBallAccuracy;
  final double? tacklesPer90;
  final double? interceptionsPer90;
  final double? foulsPer90;
  final double? offsidesPer90;
  final double? dispossessedPer90;
  final String? playerImage;
  final String? playerUrl;
  final List<RecentMatch> recentMatches;

  const PlayerData({
    this.playerId,
    this.teamId,
    this.playerSlug,
    this.playerName,
    this.knownName,
    this.nationality,
    this.country,
    this.position,
    this.preferredFoot,
    this.birthdate,
    this.age,
    this.height,
    this.weight,
    this.teamName,
    this.teamSlug,
    this.teamLogo,
    this.leagueName,
    this.leagueId,
    this.season,
    this.appearancesOverall,
    this.appearancesHome,
    this.appearancesAway,
    this.gamesStarted,
    this.subIn,
    this.subOut,
    this.minutesPlayedOverall,
    this.goalsOverall,
    this.goalsHome,
    this.goalsAway,
    this.assistsOverall,
    this.yellowCardsOverall,
    this.redCardsOverall,
    this.cleanSheetsOverall,
    this.goalsConcededOverall,
    this.penaltiesTaken,
    this.penaltiesScored,
    this.penaltiesMissed,
    this.penaltiesSaved,
    this.ratingOverall,
    this.manOfTheMatch,
    this.minutesPerGoal,
    this.goalsPer90,
    this.assistsPer90,
    this.goalsAndAssistsPer90,
    this.shotsPerGame,
    this.shotsOnTargetPerGame,
    this.keyPassesPerGame,
    this.dribblesPerGame,
    this.dribblesSuccessRate,
    this.touchesPerGame,
    this.passSuccess,
    this.crossAccuracy,
    this.longBallAccuracy,
    this.throughBallAccuracy,
    this.tacklesPer90,
    this.interceptionsPer90,
    this.foulsPer90,
    this.offsidesPer90,
    this.dispossessedPer90,
    this.playerImage,
    this.playerUrl,
    this.recentMatches = const [],
  });

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
      playerId: _toInt(_firstNonNull(json, ['player_id', 'id'])),
      teamId: _toInt(_firstNonNull(json, ['team_id', 'club_id'])),
      playerSlug: _asString(_firstNonNull(json, ['player_slug', 'slug'])),
      playerName: _asString(_firstNonNull(json, ['player_name', 'name', 'fullname'])),
      knownName: _asString(_firstNonNull(json, ['player_known_name', 'known_name', 'short_name'])),
      nationality: _asString(_firstNonNull(json, ['nationality', 'nationality_1', 'nation'])),
      country: _asString(_firstNonNull(json, ['birth_country', 'country'])),
      position: _asString(_firstNonNull(json, ['position', 'player_position', 'pos'])),
      preferredFoot: _asString(_firstNonNull(json, ['preferred_foot', 'foot'])),
      birthdate: _asString(_firstNonNull(json, ['birthdate', 'dob', 'birth_date'])),
      age: _toInt(json['age']),
      height: _asString(json['height']),
      weight: _asString(json['weight']),
      teamName: _asString(_firstNonNull(json, ['team_name', 'team', 'club', 'current_club'])),
      teamSlug: _asString(_firstNonNull(json, ['team_slug', 'club_slug'])),
      teamLogo: _asString(_firstNonNull(json, ['team_image', 'team_logo', 'club_logo'])),
      leagueName: _asString(_firstNonNull(json, ['league_name', 'team_league', 'league'])),
      leagueId: _toInt(_firstNonNull(json, ['league_id', 'team_league_id'])),
      season: _asString(json['season']),
      appearancesOverall: _toInt(_firstNonNull(json, ['appearances_overall', 'appearances'])),
      appearancesHome: _toInt(json['appearances_home']),
      appearancesAway: _toInt(json['appearances_away']),
      gamesStarted: _toInt(_firstNonNull(json, ['games_started', 'starts'])),
      subIn: _toInt(_firstNonNull(json, ['sub_in', 'substitute_in'])),
      subOut: _toInt(_firstNonNull(json, ['sub_out', 'substitute_out'])),
      minutesPlayedOverall: _toInt(_firstNonNull(json, ['minutes_played_overall', 'minutes_played'])),
      goalsOverall: _toInt(_firstNonNull(json, ['goals_overall', 'goals'])),
      goalsHome: _toInt(json['goals_home']),
      goalsAway: _toInt(json['goals_away']),
      assistsOverall: _toInt(_firstNonNull(json, ['assists_overall', 'assists'])),
      yellowCardsOverall: _toInt(_firstNonNull(json, ['yellow_cards_overall', 'yellow_cards'])),
      redCardsOverall: _toInt(_firstNonNull(json, ['red_cards_overall', 'red_cards'])),
      cleanSheetsOverall: _toInt(json['clean_sheets_overall']),
      goalsConcededOverall: _toInt(json['goals_conceded_overall']),
      penaltiesTaken: _toInt(_firstNonNull(json, ['penalties_taken', 'penalty_taken'])),
      penaltiesScored: _toInt(_firstNonNull(json, ['penalties_scored', 'penalty_scored'])),
      penaltiesMissed: _toInt(_firstNonNull(json, ['penalties_missed', 'penalty_missed'])),
      penaltiesSaved: _toInt(_firstNonNull(json, ['penalties_saved', 'penalty_saved'])),
      ratingOverall: _toDouble(_firstNonNull(json, ['rating_overall', 'rating'])),
      manOfTheMatch: _toInt(_firstNonNull(json, ['man_of_the_match', 'motm'])),
      minutesPerGoal: _toInt(json['minutes_per_goal']),
      goalsPer90: _toDouble(_firstNonNull(json, ['goals_per_90_overall', 'goals_per_90'])),
      assistsPer90: _toDouble(_firstNonNull(json, ['assists_per_90_overall', 'assists_per_90'])),
      goalsAndAssistsPer90: _toDouble(
        _firstNonNull(json, ['goals_assists_per_90_overall', 'goals_and_assists_per_90']),
      ),
      shotsPerGame: _toDouble(_firstNonNull(json, ['shots_per_game', 'shots_per_90'])),
      shotsOnTargetPerGame: _toDouble(
        _firstNonNull(json, ['shots_on_target_per_game', 'sot_per_game', 'shots_on_target_per_90']),
      ),
      keyPassesPerGame: _toDouble(_firstNonNull(json, ['key_passes_per_game', 'key_passes_per_90'])),
      dribblesPerGame: _toDouble(_firstNonNull(json, ['dribbles_per_game', 'dribbles_per_90'])),
      dribblesSuccessRate: _toDouble(json['dribbles_success_rate']),
      touchesPerGame: _toDouble(_firstNonNull(json, ['touches_per_game', 'touches'])),
      passSuccess: _toDouble(_firstNonNull(json, ['pass_success', 'pass_success_percentage'])),
      crossAccuracy: _toDouble(_firstNonNull(json, ['cross_accuracy', 'crosses_accuracy'])),
      longBallAccuracy: _toDouble(_firstNonNull(json, ['long_ball_accuracy', 'long_balls_accuracy'])),
      throughBallAccuracy:
          _toDouble(_firstNonNull(json, ['through_ball_accuracy', 'through_balls_accuracy'])),
      tacklesPer90: _toDouble(_firstNonNull(json, ['tackles_per_90', 'tackles_per_game'])),
      interceptionsPer90:
          _toDouble(_firstNonNull(json, ['interceptions_per_90', 'interceptions_per_game'])),
      foulsPer90: _toDouble(_firstNonNull(json, ['fouls_per_90', 'fouls_per_game'])),
      offsidesPer90: _toDouble(_firstNonNull(json, ['offsides_per_90', 'offsides_per_game'])),
      dispossessedPer90:
          _toDouble(_firstNonNull(json, ['dispossessed_per_90', 'dispossessed_per_game'])),
      playerImage: _asString(_firstNonNull(json, ['player_image', 'image', 'img', 'photo'])),
      playerUrl: _asString(_firstNonNull(json, ['player_url', 'url'])),
      recentMatches: _parseRecentMatches(json),
    );
  }

  Map<String, dynamic> toJson() => {
        'player_id': playerId,
        'team_id': teamId,
        'player_slug': playerSlug,
        'player_name': playerName,
        'player_known_name': knownName,
        'nationality': nationality,
        'country': country,
        'position': position,
        'preferred_foot': preferredFoot,
        'birthdate': birthdate,
        'age': age,
        'height': height,
        'weight': weight,
        'team_name': teamName,
        'team_slug': teamSlug,
        'team_image': teamLogo,
        'league_name': leagueName,
        'league_id': leagueId,
        'season': season,
        'appearances_overall': appearancesOverall,
        'appearances_home': appearancesHome,
        'appearances_away': appearancesAway,
        'games_started': gamesStarted,
        'sub_in': subIn,
        'sub_out': subOut,
        'minutes_played_overall': minutesPlayedOverall,
        'goals_overall': goalsOverall,
        'goals_home': goalsHome,
        'goals_away': goalsAway,
        'assists_overall': assistsOverall,
        'yellow_cards_overall': yellowCardsOverall,
        'red_cards_overall': redCardsOverall,
        'clean_sheets_overall': cleanSheetsOverall,
        'goals_conceded_overall': goalsConcededOverall,
        'penalties_taken': penaltiesTaken,
        'penalties_scored': penaltiesScored,
        'penalties_missed': penaltiesMissed,
        'penalties_saved': penaltiesSaved,
        'rating_overall': ratingOverall,
        'man_of_the_match': manOfTheMatch,
        'minutes_per_goal': minutesPerGoal,
        'goals_per_90_overall': goalsPer90,
        'assists_per_90_overall': assistsPer90,
        'goals_assists_per_90_overall': goalsAndAssistsPer90,
        'shots_per_game': shotsPerGame,
        'shots_on_target_per_game': shotsOnTargetPerGame,
        'key_passes_per_game': keyPassesPerGame,
        'dribbles_per_game': dribblesPerGame,
        'dribbles_success_rate': dribblesSuccessRate,
        'touches_per_game': touchesPerGame,
        'pass_success': passSuccess,
        'cross_accuracy': crossAccuracy,
        'long_ball_accuracy': longBallAccuracy,
        'through_ball_accuracy': throughBallAccuracy,
        'tackles_per_90': tacklesPer90,
        'interceptions_per_90': interceptionsPer90,
        'fouls_per_90': foulsPer90,
        'offsides_per_90': offsidesPer90,
        'dispossessed_per_90': dispossessedPer90,
        'player_image': playerImage,
        'player_url': playerUrl,
        'recent_matches': recentMatches.map((e) => e.toJson()).toList(),
      };
}

class RecentMatch {
  final int? matchId;
  final String? date;
  final String? venue;
  final String? opponentName;
  final int? opponentId;
  final String? opponentSlug;
  final String? competition;
  final String? result;
  final int? teamScore;
  final int? opponentScore;
  final int? minutesPlayed;
  final int? goals;
  final int? assists;
  final int? shotsOnTarget;
  final int? shots;
  final double? rating;

  const RecentMatch({
    this.matchId,
    this.date,
    this.venue,
    this.opponentName,
    this.opponentId,
    this.opponentSlug,
    this.competition,
    this.result,
    this.teamScore,
    this.opponentScore,
    this.minutesPlayed,
    this.goals,
    this.assists,
    this.shotsOnTarget,
    this.shots,
    this.rating,
  });

  factory RecentMatch.fromJson(Map<String, dynamic> json) => RecentMatch(
        matchId: _toInt(_firstNonNull(json, ['match_id', 'id'])),
        date: _asString(_firstNonNull(json, ['date', 'fixture_date'])),
        venue: _asString(_firstNonNull(json, ['venue', 'home_away'])),
        opponentName: _asString(_firstNonNull(json, ['opponent_name', 'vs', 'against'])),
        opponentId: _toInt(_firstNonNull(json, ['opponent_id', 'team_id'])),
        opponentSlug: _asString(_firstNonNull(json, ['opponent_slug', 'team_slug'])),
        competition: _asString(_firstNonNull(json, ['competition', 'league_name'])),
        result: _asString(json['result']),
        teamScore: _toInt(_firstNonNull(json, ['team_score', 'own_score'])),
        opponentScore: _toInt(_firstNonNull(json, ['opponent_score', 'opp_score'])),
        minutesPlayed: _toInt(_firstNonNull(json, ['minutes_played', 'minutes'])),
        goals: _toInt(json['goals']),
        assists: _toInt(json['assists']),
        shotsOnTarget: _toInt(_firstNonNull(json, ['shots_on_target', 'sot'])),
        shots: _toInt(json['shots']),
        rating: _toDouble(json['rating']),
      );

  Map<String, dynamic> toJson() => {
        'match_id': matchId,
        'date': date,
        'venue': venue,
        'opponent_name': opponentName,
        'opponent_id': opponentId,
        'opponent_slug': opponentSlug,
        'competition': competition,
        'result': result,
        'team_score': teamScore,
        'opponent_score': opponentScore,
        'minutes_played': minutesPlayed,
        'goals': goals,
        'assists': assists,
        'shots_on_target': shotsOnTarget,
        'shots': shots,
        'rating': rating,
      };
}

dynamic _firstNonNull(Map<String, dynamic> source, List<String> keys) {
  for (final key in keys) {
    if (source.containsKey(key) && source[key] != null) {
      return source[key];
    }
  }
  return null;
}

Map<String, dynamic> _asMap(dynamic raw) {
  if (raw is Map<String, dynamic>) return raw;
  if (raw is Map) return raw.cast<String, dynamic>();
  return <String, dynamic>{};
}

String? _asString(dynamic value) {
  if (value == null) return null;
  final stringValue = value.toString();
  if (stringValue.isEmpty || stringValue.toLowerCase() == 'null') return null;
  return stringValue;
}

int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  return int.tryParse(value.toString());
}

double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value.toString());
}

List<dynamic> _toList(dynamic value) {
  if (value is List) return value;
  return <dynamic>[];
}

List<RecentMatch> _parseRecentMatches(Map<String, dynamic> json) {
  final List<dynamic> rawList = _toList(
    _firstNonNull(
      json,
      ['recent_matches', 'latest_matches', 'match_logs', 'recent_games'],
    ),
  );
  return rawList.map(_asMap).map(RecentMatch.fromJson).toList();
}
