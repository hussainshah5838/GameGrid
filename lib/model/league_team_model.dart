// Minimal model for FootyStats league-teams endpoint.

import 'dart:convert';

LeagueTeamsModel leagueTeamsModelFromJson(String str) =>
    LeagueTeamsModel.fromJson(json.decode(str));

num? _parseNum(dynamic value) {
  if (value == null) return null;
  if (value is num) return value;
  if (value is String) return num.tryParse(value);
  return null;
}

class LeagueTeamsModel {
  final bool? success;
  final Pager? pager;
  final Metadata? metadata;
  final List<LeagueTeam> data;
  final String? message;

  LeagueTeamsModel({
    this.success,
    this.pager,
    this.metadata,
    this.data = const [],
    this.message,
  });

  factory LeagueTeamsModel.fromJson(Map<String, dynamic> json) =>
      LeagueTeamsModel(
        success: json['success'] as bool?,
        pager: json['pager'] != null ? Pager.fromJson(json['pager']) : null,
        metadata:
            json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null,
        data: (json['data'] as List<dynamic>? ?? [])
            .map((e) => LeagueTeam.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );
}

class LeagueTeam {
  final int? id;
  final String? name;
  final String? shortCode;
  final String? country;
  final String? logo;
  final int? leagueId;
  final String? leagueName;
  final int? seasonId;
  final String? season;
  final num? h2h;
  final num? l5;
  final num? l10;
  final num? l20;
  final num? over2425;
  final num? over2325;

  LeagueTeam({
    this.id,
    this.name,
    this.shortCode,
    this.country,
    this.logo,
    this.leagueId,
    this.leagueName,
    this.seasonId,
    this.season,
    this.h2h,
    this.l5,
    this.l10,
    this.l20,
    this.over2425,
    this.over2325,
  });

  LeagueTeam copyWith({
    int? id,
    String? name,
    String? shortCode,
    String? country,
    String? logo,
    int? leagueId,
    String? leagueName,
    int? seasonId,
    String? season,
    num? h2h,
    num? l5,
    num? l10,
    num? l20,
    num? over2425,
    num? over2325,
  }) {
    return LeagueTeam(
      id: id ?? this.id,
      name: name ?? this.name,
      shortCode: shortCode ?? this.shortCode,
      country: country ?? this.country,
      logo: logo ?? this.logo,
      leagueId: leagueId ?? this.leagueId,
      leagueName: leagueName ?? this.leagueName,
      seasonId: seasonId ?? this.seasonId,
      season: season ?? this.season,
      h2h: h2h ?? this.h2h,
      l5: l5 ?? this.l5,
      l10: l10 ?? this.l10,
      l20: l20 ?? this.l20,
      over2425: over2425 ?? this.over2425,
      over2325: over2325 ?? this.over2325,
    );
  }

  factory LeagueTeam.fromJson(Map<String, dynamic> json) => LeagueTeam(
        id: json['id'] as int?,
        name: json['name'] as String?,
        shortCode: json['short_code'] as String?,
        country: json['country'] as String?,
        logo: json['image'] as String? ?? json['logo'] as String?,
        leagueId: json['league_id'] as int?,
        leagueName: json['league_name'] as String?,
        seasonId: json['season_id'] as int?,
        season: json['season']?.toString(),
        h2h: _parseNum(json['h2h']),
        l5: _parseNum(json['l5']),
        l10: _parseNum(json['l10']),
        l20: _parseNum(json['l20']),
        over2425: _parseNum(
          json['24_25'] ?? json['24-25'] ?? json['24/25'],
        ),
        over2325: _parseNum(
          json['23_25'] ?? json['23-25'] ?? json['23/25'],
        ),
      );
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
        currentPage: json['current_page'] as int?,
        maxPage: json['max_page'] as int?,
        resultsPerPage: json['results_per_page'] as int?,
        totalResults: json['total_results'] as int?,
      );
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
        requestLimit: json['request_limit'] as String?,
        requestRemaining: json['request_remaining'] as String?,
        requestResetMessage: json['request_reset_message'] as String?,
      );
}
