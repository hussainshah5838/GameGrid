// Minimal model for FootyStats league-teams endpoint.

import 'dart:convert';

LeagueTeamsModel leagueTeamsModelFromJson(String str) =>
    LeagueTeamsModel.fromJson(json.decode(str));

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
  });

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
