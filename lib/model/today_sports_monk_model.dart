// To parse this JSON data, do
//
//     final todaysMatchesSportsMonkModel = todaysMatchesSportsMonkModelFromJson(jsonString);

import 'dart:convert';

List<TodaysMatchesSportsMonkModel> todaysMatchesSportsMonkModelFromJson(String str) => List<TodaysMatchesSportsMonkModel>.from(json.decode(str).map((x) => TodaysMatchesSportsMonkModel.fromJson(x)));

String todaysMatchesSportsMonkModelToJson(List<TodaysMatchesSportsMonkModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodaysMatchesSportsMonkModel {
    int id;
    int sportId;
    int leagueId;
    int seasonId;
    int stageId;
    dynamic groupId;
    dynamic aggregateId;
    int roundId;
    int stateId;
    int venueId;
    String name;
    DateTime startingAt;
    dynamic resultInfo;
    String leg;
    dynamic details;
    int length;
    bool placeholder;
    bool hasOdds;
    bool hasPremiumOdds;
    int startingAtTimestamp;
    List<Participant> participants;
    League league;
    List<ScoreElement> scores;
    List<dynamic> events;
    List<Period> periods;
    Round round;

    TodaysMatchesSportsMonkModel({
        required this.id,
        required this.sportId,
        required this.leagueId,
        required this.seasonId,
        required this.stageId,
        required this.groupId,
        required this.aggregateId,
        required this.roundId,
        required this.stateId,
        required this.venueId,
        required this.name,
        required this.startingAt,
        required this.resultInfo,
        required this.leg,
        required this.details,
        required this.length,
        required this.placeholder,
        required this.hasOdds,
        required this.hasPremiumOdds,
        required this.startingAtTimestamp,
        required this.participants,
        required this.league,
        required this.scores,
        required this.events,
        required this.periods,
        required this.round,
    });

    factory TodaysMatchesSportsMonkModel.fromJson(Map<String, dynamic> json) => TodaysMatchesSportsMonkModel(
        id: json["id"],
        sportId: json["sport_id"],
        leagueId: json["league_id"],
        seasonId: json["season_id"],
        stageId: json["stage_id"],
        groupId: json["group_id"],
        aggregateId: json["aggregate_id"],
        roundId: json["round_id"],
        stateId: json["state_id"],
        venueId: json["venue_id"],
        name: json["name"],
        startingAt: DateTime.parse(json["starting_at"]),
        resultInfo: json["result_info"],
        leg: json["leg"],
        details: json["details"],
        length: json["length"],
        placeholder: json["placeholder"],
        hasOdds: json["has_odds"],
        hasPremiumOdds: json["has_premium_odds"],
        startingAtTimestamp: json["starting_at_timestamp"],
        participants: List<Participant>.from(json["participants"].map((x) => Participant.fromJson(x))),
        league: League.fromJson(json["league"]),
        scores: List<ScoreElement>.from(json["scores"].map((x) => ScoreElement.fromJson(x))),
        events: List<dynamic>.from(json["events"].map((x) => x)),
        periods: List<Period>.from(json["periods"].map((x) => Period.fromJson(x))),
        round: Round.fromJson(json["round"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "league_id": leagueId,
        "season_id": seasonId,
        "stage_id": stageId,
        "group_id": groupId,
        "aggregate_id": aggregateId,
        "round_id": roundId,
        "state_id": stateId,
        "venue_id": venueId,
        "name": name,
        "starting_at": startingAt.toIso8601String(),
        "result_info": resultInfo,
        "leg": leg,
        "details": details,
        "length": length,
        "placeholder": placeholder,
        "has_odds": hasOdds,
        "has_premium_odds": hasPremiumOdds,
        "starting_at_timestamp": startingAtTimestamp,
        "participants": List<dynamic>.from(participants.map((x) => x.toJson())),
        "league": league.toJson(),
        "scores": List<dynamic>.from(scores.map((x) => x.toJson())),
        "events": List<dynamic>.from(events.map((x) => x)),
        "periods": List<dynamic>.from(periods.map((x) => x.toJson())),
        "round": round.toJson(),
    };
}

class League {
    int id;
    int sportId;
    int countryId;
    String name;
    bool active;
    String shortCode;
    String imagePath;
    String type;
    String subType;
    DateTime lastPlayedAt;
    int category;
    bool hasJerseys;
    Country country;

    League({
        required this.id,
        required this.sportId,
        required this.countryId,
        required this.name,
        required this.active,
        required this.shortCode,
        required this.imagePath,
        required this.type,
        required this.subType,
        required this.lastPlayedAt,
        required this.category,
        required this.hasJerseys,
        required this.country,
    });

    factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        sportId: json["sport_id"],
        countryId: json["country_id"],
        name: json["name"],
        active: json["active"],
        shortCode: json["short_code"],
        imagePath: json["image_path"],
        type: json["type"],
        subType: json["sub_type"],
        lastPlayedAt: DateTime.parse(json["last_played_at"]),
        category: json["category"],
        hasJerseys: json["has_jerseys"],
        country: Country.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "country_id": countryId,
        "name": name,
        "active": active,
        "short_code": shortCode,
        "image_path": imagePath,
        "type": type,
        "sub_type": subType,
        "last_played_at": lastPlayedAt.toIso8601String(),
        "category": category,
        "has_jerseys": hasJerseys,
        "country": country.toJson(),
    };
}

class Country {
    int id;
    int continentId;
    String name;
    String officialName;
    String fifaName;
    String iso2;
    String iso3;
    String latitude;
    String longitude;
    List<String> borders;
    String imagePath;

    Country({
        required this.id,
        required this.continentId,
        required this.name,
        required this.officialName,
        required this.fifaName,
        required this.iso2,
        required this.iso3,
        required this.latitude,
        required this.longitude,
        required this.borders,
        required this.imagePath,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        continentId: json["continent_id"],
        name: json["name"],
        officialName: json["official_name"],
        fifaName: json["fifa_name"],
        iso2: json["iso2"],
        iso3: json["iso3"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        borders: List<String>.from(json["borders"].map((x) => x)),
        imagePath: json["image_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "continent_id": continentId,
        "name": name,
        "official_name": officialName,
        "fifa_name": fifaName,
        "iso2": iso2,
        "iso3": iso3,
        "latitude": latitude,
        "longitude": longitude,
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "image_path": imagePath,
    };
}

class Participant {
    int id;
    int sportId;
    int countryId;
    int venueId;
    String gender;
    String name;
    String shortCode;
    String imagePath;
    int founded;
    String type;
    bool placeholder;
    DateTime lastPlayedAt;
    Meta meta;

    Participant({
        required this.id,
        required this.sportId,
        required this.countryId,
        required this.venueId,
        required this.gender,
        required this.name,
        required this.shortCode,
        required this.imagePath,
        required this.founded,
        required this.type,
        required this.placeholder,
        required this.lastPlayedAt,
        required this.meta,
    });

    factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json["id"],
        sportId: json["sport_id"],
        countryId: json["country_id"],
        venueId: json["venue_id"],
        gender: json["gender"],
        name: json["name"],
        shortCode: json["short_code"],
        imagePath: json["image_path"],
        founded: json["founded"],
        type: json["type"],
        placeholder: json["placeholder"],
        lastPlayedAt: DateTime.parse(json["last_played_at"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "country_id": countryId,
        "venue_id": venueId,
        "gender": gender,
        "name": name,
        "short_code": shortCode,
        "image_path": imagePath,
        "founded": founded,
        "type": type,
        "placeholder": placeholder,
        "last_played_at": lastPlayedAt.toIso8601String(),
        "meta": meta.toJson(),
    };
}

class Meta {
    Location location;
    int position;
    bool winner;

    Meta({
        required this.location,
        required this.position,
        required this.winner,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        location: locationValues.map[json["location"]]!,
        position: json["position"],
        winner: json["winner"],
    );

    Map<String, dynamic> toJson() => {
        "location": locationValues.reverse[location],
        "position": position,
        "winner": winner,
    };
}

enum Location {
    AWAY,
    HOME
}

final locationValues = EnumValues({
    "away": Location.AWAY,
    "home": Location.HOME
});

class Period {
    int id;
    int fixtureId;
    int typeId;
    int started;
    int ended;
    bool ticking;
    int sortOrder;
    String description;
    int timeAdded;
    int minutes;
    int seconds;
    bool hasTimer;

    Period({
        required this.id,
        required this.fixtureId,
        required this.typeId,
        required this.started,
        required this.ended,
        required this.ticking,
        required this.sortOrder,
        required this.description,
        required this.timeAdded,
        required this.minutes,
        required this.seconds,
        required this.hasTimer,
    });

    factory Period.fromJson(Map<String, dynamic> json) => Period(
        id: json["id"],
        fixtureId: json["fixture_id"],
        typeId: json["type_id"],
        started: json["started"],
        ended: json["ended"],
        ticking: json["ticking"],
        sortOrder: json["sort_order"],
        description: json["description"],
        timeAdded: json["time_added"],
        minutes: json["minutes"],
        seconds: json["seconds"],
        hasTimer: json["has_timer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fixture_id": fixtureId,
        "type_id": typeId,
        "started": started,
        "ended": ended,
        "ticking": ticking,
        "sort_order": sortOrder,
        "description": description,
        "time_added": timeAdded,
        "minutes": minutes,
        "seconds": seconds,
        "has_timer": hasTimer,
    };
}

class Round {
    int id;
    int sportId;
    int leagueId;
    int seasonId;
    int stageId;
    String name;
    bool finished;
    bool isCurrent;
    DateTime startingAt;
    DateTime endingAt;
    bool gamesInCurrentWeek;

    Round({
        required this.id,
        required this.sportId,
        required this.leagueId,
        required this.seasonId,
        required this.stageId,
        required this.name,
        required this.finished,
        required this.isCurrent,
        required this.startingAt,
        required this.endingAt,
        required this.gamesInCurrentWeek,
    });

    factory Round.fromJson(Map<String, dynamic> json) => Round(
        id: json["id"],
        sportId: json["sport_id"],
        leagueId: json["league_id"],
        seasonId: json["season_id"],
        stageId: json["stage_id"],
        name: json["name"],
        finished: json["finished"],
        isCurrent: json["is_current"],
        startingAt: DateTime.parse(json["starting_at"]),
        endingAt: DateTime.parse(json["ending_at"]),
        gamesInCurrentWeek: json["games_in_current_week"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "league_id": leagueId,
        "season_id": seasonId,
        "stage_id": stageId,
        "name": name,
        "finished": finished,
        "is_current": isCurrent,
        "starting_at": "${startingAt.year.toString().padLeft(4, '0')}-${startingAt.month.toString().padLeft(2, '0')}-${startingAt.day.toString().padLeft(2, '0')}",
        "ending_at": "${endingAt.year.toString().padLeft(4, '0')}-${endingAt.month.toString().padLeft(2, '0')}-${endingAt.day.toString().padLeft(2, '0')}",
        "games_in_current_week": gamesInCurrentWeek,
    };
}

class ScoreElement {
    int id;
    int fixtureId;
    int typeId;
    int participantId;
    ScoreScore score;
    Description description;

    ScoreElement({
        required this.id,
        required this.fixtureId,
        required this.typeId,
        required this.participantId,
        required this.score,
        required this.description,
    });

    factory ScoreElement.fromJson(Map<String, dynamic> json) => ScoreElement(
        id: json["id"],
        fixtureId: json["fixture_id"],
        typeId: json["type_id"],
        participantId: json["participant_id"],
        score: ScoreScore.fromJson(json["score"]),
        description: descriptionValues.map[json["description"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fixture_id": fixtureId,
        "type_id": typeId,
        "participant_id": participantId,
        "score": score.toJson(),
        "description": descriptionValues.reverse[description],
    };
}

enum Description {
    CURRENT,
    THE_1_ST_HALF
}

final descriptionValues = EnumValues({
    "CURRENT": Description.CURRENT,
    "1ST_HALF": Description.THE_1_ST_HALF
});

class ScoreScore {
    int goals;
    Location participant;

    ScoreScore({
        required this.goals,
        required this.participant,
    });

    factory ScoreScore.fromJson(Map<String, dynamic> json) => ScoreScore(
        goals: json["goals"],
        participant: locationValues.map[json["participant"]]!,
    );

    Map<String, dynamic> toJson() => {
        "goals": goals,
        "participant": locationValues.reverse[participant],
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
