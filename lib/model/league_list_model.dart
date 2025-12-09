// Minimal model for FootyStats league list endpoint (league-list).

import 'dart:convert';

LeagueListModel leagueListModelFromJson(String str) =>
    LeagueListModel.fromJson(json.decode(str));

class LeagueListModel {
  final bool? success;
  final Pager? pager;
  final Metadata? metadata;
  final List<LeagueListItem> data;
  final String? message;

  LeagueListModel({
    this.success,
    this.pager,
    this.metadata,
    this.data = const [],
    this.message,
  });

  factory LeagueListModel.fromJson(Map<String, dynamic> json) =>
      LeagueListModel(
        success: json['success'] as bool?,
        pager: json['pager'] != null ? Pager.fromJson(json['pager']) : null,
        metadata: json['metadata'] != null
            ? Metadata.fromJson(json['metadata'])
            : null,
        data: (json['data'] as List<dynamic>? ?? [])
            .map((e) => LeagueListItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );
}

class LeagueListItem {
  final String? name;
  final String? country;
  final String? leagueName;
  final String? image;
  final List<LeagueSeason> seasons;

  LeagueListItem({
    this.name,
    this.country,
    this.leagueName,
    this.image,
    this.seasons = const [],
  });

  factory LeagueListItem.fromJson(Map<String, dynamic> json) => LeagueListItem(
        name: json['name'] as String?,
        country: json['country'] as String?,
        leagueName: json['league_name'] as String?,
        image: json['image'] as String?,
        seasons: (json['season'] as List<dynamic>? ?? [])
            .map((e) => LeagueSeason.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class LeagueSeason {
  final int? id;
  final String? year; // year sometimes comes as 20162017 or 20242025

  LeagueSeason({this.id, this.year});

  factory LeagueSeason.fromJson(Map<String, dynamic> json) => LeagueSeason(
        id: json['id'] as int?,
        year: json['year']?.toString(),
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
