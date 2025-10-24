// lib/models/football_scores_model.dart

import 'dart:convert';

// Helper function to decode the main response
FootballApiResponse footballApiResponseFromJson(String str) => FootballApiResponse.fromJson(json.decode(str));

class FootballApiResponse {
  final Scores scores;

  FootballApiResponse({required this.scores});

  factory FootballApiResponse.fromJson(Map<String, dynamic> json) => FootballApiResponse(
    scores: Scores.fromJson(json["scores"]),
  );
}

class Scores {
  final List<Category> categories;
  final String sport;

  Scores({required this.categories, required this.sport});

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
    categories: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    sport: json["sport"],
  );
}

class Category {
  final String id;
  final String name;
  final List<Match> matches; // Always a list for consistency

  Category({required this.id, required this.name, required this.matches});

  factory Category.fromJson(Map<String, dynamic> json) {
    var matchList = <Match>[];
    // The API returns 'match' as an object OR a list. This handles both cases.
    if (json['match'] != null) {
      if (json['match'] is List) {
        matchList = List<Match>.from(json["match"].map((x) => Match.fromJson(x)));
      } else if (json['match'] is Map) {
        matchList.add(Match.fromJson(json['match']));
      }
    }

    return Category(
      id: json["id"],
      name: json["name"],
      matches: matchList,
    );
  }
}

class Match {
  final String id;
  final String date;
  final String time;
  final String status;
  final Team localteam;
  final Team awayteam;

  Match({
    required this.id,
    required this.date,
    required this.time,
    required this.status,
    required this.localteam,
    required this.awayteam,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    id: json["id"],
    date: json["date"],
    time: json["time"] ?? 'N/A', // Handle potential nulls
    status: json["status"],
    localteam: Team.fromJson(json["localteam"]),
    awayteam: Team.fromJson(json["awayteam"]),
  );
}

class Team {
  final String id;
  final String name;
  final String totalscore;

  Team({required this.id, required this.name, required this.totalscore});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    totalscore: json["totalscore"],
  );
}