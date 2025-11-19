// To parse this JSON data, do
//
//     final leaguesModel = leaguesModelFromJson(jsonString);

import 'dart:convert';

SoccerSeasonModel leaguesModelFromJson(String str) => SoccerSeasonModel.fromJson(json.decode(str));

String leaguesModelToJson(SoccerSeasonModel data) => json.encode(data.toJson());

class SoccerSeasonModel {
    List<Datum> data;
    Pagination pagination;
    List<Subscription> subscription;
    RateLimit rateLimit;
    String timezone;

    SoccerSeasonModel({
        required this.data,
        required this.pagination,
        required this.subscription,
        required this.rateLimit,
        required this.timezone,
    });

    factory SoccerSeasonModel.fromJson(Map<String, dynamic> json) => SoccerSeasonModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
        subscription: List<Subscription>.from(json["subscription"].map((x) => Subscription.fromJson(x))),
        rateLimit: RateLimit.fromJson(json["rate_limit"]),
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
        "subscription": List<dynamic>.from(subscription.map((x) => x.toJson())),
        "rate_limit": rateLimit.toJson(),
        "timezone": timezone,
    };
}

class Datum {
    int id;
    int sportId;
    int leagueId;
    int tieBreakerRuleId;
    String name;
    bool finished;
    bool pending;
    bool isCurrent;
    DateTime startingAt;
    DateTime endingAt;
    DateTime standingsRecalculatedAt;
    bool gamesInCurrentWeek;

    Datum({
        required this.id,
        required this.sportId,
        required this.leagueId,
        required this.tieBreakerRuleId,
        required this.name,
        required this.finished,
        required this.pending,
        required this.isCurrent,
        required this.startingAt,
        required this.endingAt,
        required this.standingsRecalculatedAt,
        required this.gamesInCurrentWeek,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sportId: json["sport_id"],
        leagueId: json["league_id"],
        tieBreakerRuleId: json["tie_breaker_rule_id"],
        name: json["name"],
        finished: json["finished"],
        pending: json["pending"],
        isCurrent: json["is_current"],
        startingAt: DateTime.parse(json["starting_at"]),
        endingAt: DateTime.parse(json["ending_at"]),
        standingsRecalculatedAt: DateTime.parse(json["standings_recalculated_at"]),
        gamesInCurrentWeek: json["games_in_current_week"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "league_id": leagueId,
        "tie_breaker_rule_id": tieBreakerRuleId,
        "name": name,
        "finished": finished,
        "pending": pending,
        "is_current": isCurrent,
        "starting_at": "${startingAt.year.toString().padLeft(4, '0')}-${startingAt.month.toString().padLeft(2, '0')}-${startingAt.day.toString().padLeft(2, '0')}",
        "ending_at": "${endingAt.year.toString().padLeft(4, '0')}-${endingAt.month.toString().padLeft(2, '0')}-${endingAt.day.toString().padLeft(2, '0')}",
        "standings_recalculated_at": standingsRecalculatedAt.toIso8601String(),
        "games_in_current_week": gamesInCurrentWeek,
    };
}

class Pagination {
    int count;
    int perPage;
    int currentPage;
    String nextPage;
    bool hasMore;

    Pagination({
        required this.count,
        required this.perPage,
        required this.currentPage,
        required this.nextPage,
        required this.hasMore,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        hasMore: json["has_more"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "next_page": nextPage,
        "has_more": hasMore,
    };
}

class RateLimit {
    int resetsInSeconds;
    int remaining;
    String requestedEntity;

    RateLimit({
        required this.resetsInSeconds,
        required this.remaining,
        required this.requestedEntity,
    });

    factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit(
        resetsInSeconds: json["resets_in_seconds"],
        remaining: json["remaining"],
        requestedEntity: json["requested_entity"],
    );

    Map<String, dynamic> toJson() => {
        "resets_in_seconds": resetsInSeconds,
        "remaining": remaining,
        "requested_entity": requestedEntity,
    };
}

class Subscription {
    List<dynamic> meta;
    List<Plan> plans;
    List<dynamic> addOns;
    List<dynamic> widgets;

    Subscription({
        required this.meta,
        required this.plans,
        required this.addOns,
        required this.widgets,
    });

    factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
        addOns: List<dynamic>.from(json["add_ons"].map((x) => x)),
        widgets: List<dynamic>.from(json["widgets"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
        "add_ons": List<dynamic>.from(addOns.map((x) => x)),
        "widgets": List<dynamic>.from(widgets.map((x) => x)),
    };
}

class Plan {
    String plan;
    String sport;
    String category;

    Plan({
        required this.plan,
        required this.sport,
        required this.category,
    });

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        plan: json["plan"],
        sport: json["sport"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "plan": plan,
        "sport": sport,
        "category": category,
    };
}
