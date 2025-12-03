// To parse this JSON data, do
//
//     final matchDetailsModel = matchDetailsModelFromJson(jsonString);

import 'dart:convert';

MatchDetailsModel matchDetailsModelFromJson(String? str) => MatchDetailsModel.fromJson(json.decode(str!));

String? matchDetailsModelToJson(MatchDetailsModel data) => json.encode(data.toJson());

class MatchDetailsModel {
    bool? success;
    Pager? pager;
    Metadata? metadata;
    Data? data;
    String? message;

    MatchDetailsModel({
        this.success,
        this.pager,
        this.metadata,
        this.data,
        this.message,
    });

    factory MatchDetailsModel.fromJson(Map<String, dynamic> json) => MatchDetailsModel(
        success: json["success"],
        pager: _parseMap(json["pager"], (m) => Pager.fromJson(m)),
        metadata: _parseMap(json["metadata"], (m) => Metadata.fromJson(m)),
        data: _parseMap(json["data"], (m) => Data.fromJson(m)),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "pager": pager?.toJson(),
        "metadata": metadata?.toJson(),
        "data": data?.toJson(),
        "message": message,
    };
}

class Data {
    num? id;
    num? homeId;
    num? awayId;
    String? season;
    String? status;
    num? roundId;
    num? gameWeek;
    num? revisedGameWeek;
    List<dynamic>? homeGoals;
    List<dynamic>? awayGoals;
    num? homeGoalCount;
    num? awayGoalCount;
    num? totalGoalCount;
    num? teamACorners;
    num? teamBCorners;
    num? totalCornerCount;
    num? teamAOffsides;
    num? teamBOffsides;
    num? teamAYellowCards;
    num? teamBYellowCards;
    num? teamARedCards;
    num? teamBRedCards;
    num? teamAShotsOnTarget;
    num? teamBShotsOnTarget;
    num? teamAShotsOffTarget;
    num? teamBShotsOffTarget;
    num? teamAShots;
    num? teamBShots;
    num? teamAFouls;
    num? teamBFouls;
    num? teamAPossession;
    num? teamBPossession;
    dynamic refereeId;
    num? coachAId;
    num? coachBId;
    String? stadiumName;
    String? stadiumLocation;
    num? teamACardsNum;
    num? teamBCardsNum;
    double? oddsFt1;
    double? oddsFtX;
    double? oddsFt2;
    double? oddsFtOver05;
    double? oddsFtOver15;
    double? oddsFtOver25;
    double? oddsFtOver35;
    double? oddsFtOver45;
    double? oddsFtUnder05;
    double? oddsFtUnder15;
    double? oddsFtUnder25;
    double? oddsFtUnder35;
    double? oddsFtUnder45;
    double? oddsBttsYes;
    double? oddsBttsNo;
    num? oddsTeamACsYes;
    num? oddsTeamACsNo;
    num? oddsTeamBCsYes;
    num? oddsTeamBCsNo;
    double? oddsDoublechance1X;
    double? oddsDoublechance12;
    double? oddsDoublechanceX2;
    double? odds1StHalfResult1;
    double? odds1StHalfResultX;
    double? odds1StHalfResult2;
    double? odds2NdHalfResult1;
    double? odds2NdHalfResultX;
    double? odds2NdHalfResult2;
    double? oddsDnb1;
    num? oddsDnb2;
    double? oddsCornersOver75;
    double? oddsCornersOver85;
    double? oddsCornersOver95;
    double? oddsCornersOver105;
    double? oddsCornersOver115;
    double? oddsCornersUnder75;
    double? oddsCornersUnder85;
    double? oddsCornersUnder95;
    double? oddsCornersUnder105;
    double? oddsCornersUnder115;
    double? oddsCorners1;
    double? oddsCornersX;
    double? oddsCorners2;
    double? oddsTeamToScoreFirst1;
    double? oddsTeamToScoreFirstX;
    num? oddsTeamToScoreFirst2;
    num? oddsWinToNil1;
    double? oddsWinToNil2;
    double? odds1StHalfOver05;
    double? odds1StHalfOver15;
    double? odds1StHalfOver25;
    num? odds1StHalfOver35;
    double? odds1StHalfUnder05;
    double? odds1StHalfUnder15;
    double? odds1StHalfUnder25;
    double? odds1StHalfUnder35;
    double? odds2NdHalfOver05;
    double? odds2NdHalfOver15;
    double? odds2NdHalfOver25;
    num? odds2NdHalfOver35;
    num? odds2NdHalfUnder05;
    double? odds2NdHalfUnder15;
    double? odds2NdHalfUnder25;
    num? odds2NdHalfUnder35;
    num? oddsBtts1StHalfYes;
    num? oddsBtts1StHalfNo;
    num? oddsBtts2NdHalfYes;
    num? oddsBtts2NdHalfNo;
    num? overallGoalCount;
    num? htGoalsTeamA;
    num? htGoalsTeamB;
    num? goals2HgTeamA;
    num? goals2HgTeamB;
    num? goalCount2Hg;
    num? htGoalCount;
    num? dateUnix;
    num? winningTeam;
    num? noHomeAway;
    num? bttsPotential;
    num? bttsFhgPotential;
    num? btts2HgPotential;
    num? goalTimingDisabled;
    num? attendance;
    num? cornerTimingsRecorded;
    num? cardTimingsRecorded;
    num? teamAFhCorners;
    num? teamBFhCorners;
    num? teamA2HCorners;
    num? teamB2HCorners;
    num? cornerFhCount;
    num? corner2HCount;
    num? teamAFhCards;
    num? teamBFhCards;
    num? teamA2HCards;
    num? teamB2HCards;
    num? totalFhCards;
    num? total2HCards;
    num? attacksRecorded;
    num? teamADangerousAttacks;
    num? teamBDangerousAttacks;
    num? teamAAttacks;
    num? teamBAttacks;
    num? teamAXg;
    num? teamBXg;
    num? totalXg;
    num? teamAPenaltiesWon;
    num? teamBPenaltiesWon;
    num? teamAPenaltyGoals;
    num? teamBPenaltyGoals;
    num? teamAPenaltyMissed;
    num? teamBPenaltyMissed;
    num? pensRecorded;
    num? goalTimingsRecorded;
    num? teamA010MinGoals;
    num? teamB010MinGoals;
    num? teamACorners010Min;
    num? teamBCorners010Min;
    num? teamACards010Min;
    num? teamBCards010Min;
    num? throwinsRecorded;
    num? teamAThrowins;
    num? teamBThrowins;
    num? freekicksRecorded;
    num? teamAFreekicks;
    num? teamBFreekicks;
    num? goalkicksRecorded;
    num? teamAGoalkicks;
    num? teamBGoalkicks;
    num? o45Potential;
    num? o35Potential;
    num? o25Potential;
    num? o15Potential;
    num? o05Potential;
    num? o15HtPotential;
    num? o05HtPotential;
    num? o052HPotential;
    num? o152HPotential;
    double? cornersPotential;
    double? offsidesPotential;
    double? cardsPotential;
    double? avgPotential;
    String? homeUrl;
    String? homeImage;
    String? homeName;
    String? awayUrl;
    String? awayImage;
    String? awayName;
    num? homePpg;
    double? awayPpg;
    num? preMatchHomePpg;
    double? preMatchAwayPpg;
    num? preMatchTeamAOverallPpg;
    double? preMatchTeamBOverallPpg;
    num? u45Potential;
    num? u35Potential;
    num? u25Potential;
    num? u15Potential;
    num? u05Potential;
    num? cornersO85Potential;
    num? cornersO95Potential;
    num? cornersO105Potential;
    num? teamAXgPrematch;
    num? teamBXgPrematch;
    num? totalXgPrematch;
    String? matchUrl;
    num? competitionId;
    num? matchesCompletedMinimum;
    Bench? lineups;
    Bench? bench;
    List<dynamic>? teamAGoalDetails;
    List<dynamic>? teamBGoalDetails;
    dynamic trends;
    List<dynamic>? homeGoalsTimings;
    List<dynamic>? awayGoalsTimings;
    List<dynamic>? teamACardDetails;
    List<dynamic>? teamBCardDetails;
    H2H? h2H;
    List<String>? tvStations;
    Weather? weather;
    String? gptEn;
    GptInt? gptInt;
    OddsComparison? oddsComparison;

    Data({
        this.id,
        this.homeId,
        this.awayId,
        this.season,
        this.status,
        this.roundId,
        this.gameWeek,
        this.revisedGameWeek,
        this.homeGoals,
        this.awayGoals,
        this.homeGoalCount,
        this.awayGoalCount,
        this.totalGoalCount,
        this.teamACorners,
        this.teamBCorners,
        this.totalCornerCount,
        this.teamAOffsides,
        this.teamBOffsides,
        this.teamAYellowCards,
        this.teamBYellowCards,
        this.teamARedCards,
        this.teamBRedCards,
        this.teamAShotsOnTarget,
        this.teamBShotsOnTarget,
        this.teamAShotsOffTarget,
        this.teamBShotsOffTarget,
        this.teamAShots,
        this.teamBShots,
        this.teamAFouls,
        this.teamBFouls,
        this.teamAPossession,
        this.teamBPossession,
        this.refereeId,
        this.coachAId,
        this.coachBId,
        this.stadiumName,
        this.stadiumLocation,
        this.teamACardsNum,
        this.teamBCardsNum,
        this.oddsFt1,
        this.oddsFtX,
        this.oddsFt2,
        this.oddsFtOver05,
        this.oddsFtOver15,
        this.oddsFtOver25,
        this.oddsFtOver35,
        this.oddsFtOver45,
        this.oddsFtUnder05,
        this.oddsFtUnder15,
        this.oddsFtUnder25,
        this.oddsFtUnder35,
        this.oddsFtUnder45,
        this.oddsBttsYes,
        this.oddsBttsNo,
        this.oddsTeamACsYes,
        this.oddsTeamACsNo,
        this.oddsTeamBCsYes,
        this.oddsTeamBCsNo,
        this.oddsDoublechance1X,
        this.oddsDoublechance12,
        this.oddsDoublechanceX2,
        this.odds1StHalfResult1,
        this.odds1StHalfResultX,
        this.odds1StHalfResult2,
        this.odds2NdHalfResult1,
        this.odds2NdHalfResultX,
        this.odds2NdHalfResult2,
        this.oddsDnb1,
        this.oddsDnb2,
        this.oddsCornersOver75,
        this.oddsCornersOver85,
        this.oddsCornersOver95,
        this.oddsCornersOver105,
        this.oddsCornersOver115,
        this.oddsCornersUnder75,
        this.oddsCornersUnder85,
        this.oddsCornersUnder95,
        this.oddsCornersUnder105,
        this.oddsCornersUnder115,
        this.oddsCorners1,
        this.oddsCornersX,
        this.oddsCorners2,
        this.oddsTeamToScoreFirst1,
        this.oddsTeamToScoreFirstX,
        this.oddsTeamToScoreFirst2,
        this.oddsWinToNil1,
        this.oddsWinToNil2,
        this.odds1StHalfOver05,
        this.odds1StHalfOver15,
        this.odds1StHalfOver25,
        this.odds1StHalfOver35,
        this.odds1StHalfUnder05,
        this.odds1StHalfUnder15,
        this.odds1StHalfUnder25,
        this.odds1StHalfUnder35,
        this.odds2NdHalfOver05,
        this.odds2NdHalfOver15,
        this.odds2NdHalfOver25,
        this.odds2NdHalfOver35,
        this.odds2NdHalfUnder05,
        this.odds2NdHalfUnder15,
        this.odds2NdHalfUnder25,
        this.odds2NdHalfUnder35,
        this.oddsBtts1StHalfYes,
        this.oddsBtts1StHalfNo,
        this.oddsBtts2NdHalfYes,
        this.oddsBtts2NdHalfNo,
        this.overallGoalCount,
        this.htGoalsTeamA,
        this.htGoalsTeamB,
        this.goals2HgTeamA,
        this.goals2HgTeamB,
        this.goalCount2Hg,
        this.htGoalCount,
        this.dateUnix,
        this.winningTeam,
        this.noHomeAway,
        this.bttsPotential,
        this.bttsFhgPotential,
        this.btts2HgPotential,
        this.goalTimingDisabled,
        this.attendance,
        this.cornerTimingsRecorded,
        this.cardTimingsRecorded,
        this.teamAFhCorners,
        this.teamBFhCorners,
        this.teamA2HCorners,
        this.teamB2HCorners,
        this.cornerFhCount,
        this.corner2HCount,
        this.teamAFhCards,
        this.teamBFhCards,
        this.teamA2HCards,
        this.teamB2HCards,
        this.totalFhCards,
        this.total2HCards,
        this.attacksRecorded,
        this.teamADangerousAttacks,
        this.teamBDangerousAttacks,
        this.teamAAttacks,
        this.teamBAttacks,
        this.teamAXg,
        this.teamBXg,
        this.totalXg,
        this.teamAPenaltiesWon,
        this.teamBPenaltiesWon,
        this.teamAPenaltyGoals,
        this.teamBPenaltyGoals,
        this.teamAPenaltyMissed,
        this.teamBPenaltyMissed,
        this.pensRecorded,
        this.goalTimingsRecorded,
        this.teamA010MinGoals,
        this.teamB010MinGoals,
        this.teamACorners010Min,
        this.teamBCorners010Min,
        this.teamACards010Min,
        this.teamBCards010Min,
        this.throwinsRecorded,
        this.teamAThrowins,
        this.teamBThrowins,
        this.freekicksRecorded,
        this.teamAFreekicks,
        this.teamBFreekicks,
        this.goalkicksRecorded,
        this.teamAGoalkicks,
        this.teamBGoalkicks,
        this.o45Potential,
        this.o35Potential,
        this.o25Potential,
        this.o15Potential,
        this.o05Potential,
        this.o15HtPotential,
        this.o05HtPotential,
        this.o052HPotential,
        this.o152HPotential,
        this.cornersPotential,
        this.offsidesPotential,
        this.cardsPotential,
        this.avgPotential,
        this.homeUrl,
        this.homeImage,
        this.homeName,
        this.awayUrl,
        this.awayImage,
        this.awayName,
        this.homePpg,
        this.awayPpg,
        this.preMatchHomePpg,
        this.preMatchAwayPpg,
        this.preMatchTeamAOverallPpg,
        this.preMatchTeamBOverallPpg,
        this.u45Potential,
        this.u35Potential,
        this.u25Potential,
        this.u15Potential,
        this.u05Potential,
        this.cornersO85Potential,
        this.cornersO95Potential,
        this.cornersO105Potential,
        this.teamAXgPrematch,
        this.teamBXgPrematch,
        this.totalXgPrematch,
        this.matchUrl,
        this.competitionId,
        this.matchesCompletedMinimum,
        this.lineups,
        this.bench,
        this.teamAGoalDetails,
        this.teamBGoalDetails,
        this.trends,
        this.homeGoalsTimings,
        this.awayGoalsTimings,
        this.teamACardDetails,
        this.teamBCardDetails,
        this.h2H,
        this.tvStations,
        this.weather,
        this.gptEn,
        this.gptInt,
        this.oddsComparison,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        homeId: json["homeID"],
        awayId: json["awayID"],
        season: json["season"] ?? "",
        status: json["status"],
        roundId: json["roundID"],
        gameWeek: json["game_week"],
        revisedGameWeek: json["revised_game_week"],
        homeGoals: _toList(json["homeGoals"]),
        awayGoals: _toList(json["awayGoals"]),
        homeGoalCount: json["homeGoalCount"],
        awayGoalCount: json["awayGoalCount"],
        totalGoalCount: json["totalGoalCount"],
        teamACorners: json["team_a_corners"],
        teamBCorners: json["team_b_corners"],
        totalCornerCount: json["totalCornerCount"],
        teamAOffsides: json["team_a_offsides"],
        teamBOffsides: json["team_b_offsides"],
        teamAYellowCards: json["team_a_yellow_cards"],
        teamBYellowCards: json["team_b_yellow_cards"],
        teamARedCards: json["team_a_red_cards"],
        teamBRedCards: json["team_b_red_cards"],
        teamAShotsOnTarget: json["team_a_shotsOnTarget"],
        teamBShotsOnTarget: json["team_b_shotsOnTarget"],
        teamAShotsOffTarget: json["team_a_shotsOffTarget"],
        teamBShotsOffTarget: json["team_b_shotsOffTarget"],
        teamAShots: json["team_a_shots"],
        teamBShots: json["team_b_shots"],
        teamAFouls: json["team_a_fouls"],
        teamBFouls: json["team_b_fouls"],
        teamAPossession: json["team_a_possession"],
        teamBPossession: json["team_b_possession"],
        refereeId: json["refereeID"],
        coachAId: json["coach_a_ID"],
        coachBId: json["coach_b_ID"],
        stadiumName: json["stadium_name"] ?? "",
        stadiumLocation: json["stadium_location"] ?? "",
        teamACardsNum: json["team_a_cards_num"],
        teamBCardsNum: json["team_b_cards_num"],
        oddsFt1: json["odds_ft_1"]?.toDouble(),
        oddsFtX: json["odds_ft_x"]?.toDouble(),
        oddsFt2: json["odds_ft_2"]?.toDouble(),
        oddsFtOver05: json["odds_ft_over05"]?.toDouble(),
        oddsFtOver15: json["odds_ft_over15"]?.toDouble(),
        oddsFtOver25: json["odds_ft_over25"]?.toDouble(),
        oddsFtOver35: json["odds_ft_over35"]?.toDouble(),
        oddsFtOver45: json["odds_ft_over45"]?.toDouble(),
        oddsFtUnder05: json["odds_ft_under05"]?.toDouble(),
        oddsFtUnder15: json["odds_ft_under15"]?.toDouble(),
        oddsFtUnder25: json["odds_ft_under25"]?.toDouble(),
        oddsFtUnder35: json["odds_ft_under35"]?.toDouble(),
        oddsFtUnder45: json["odds_ft_under45"]?.toDouble(),
        oddsBttsYes: json["odds_btts_yes"]?.toDouble(),
        oddsBttsNo: json["odds_btts_no"]?.toDouble(),
        oddsTeamACsYes: json["odds_team_a_cs_yes"],
        oddsTeamACsNo: json["odds_team_a_cs_no"],
        oddsTeamBCsYes: json["odds_team_b_cs_yes"],
        oddsTeamBCsNo: json["odds_team_b_cs_no"],
        oddsDoublechance1X: json["odds_doublechance_1x"]?.toDouble(),
        oddsDoublechance12: json["odds_doublechance_12"]?.toDouble(),
        oddsDoublechanceX2: json["odds_doublechance_x2"]?.toDouble(),
        odds1StHalfResult1: json["odds_1st_half_result_1"]?.toDouble(),
        odds1StHalfResultX: json["odds_1st_half_result_x"]?.toDouble(),
        odds1StHalfResult2: json["odds_1st_half_result_2"]?.toDouble(),
        odds2NdHalfResult1: json["odds_2nd_half_result_1"]?.toDouble(),
        odds2NdHalfResultX: json["odds_2nd_half_result_x"]?.toDouble(),
        odds2NdHalfResult2: json["odds_2nd_half_result_2"]?.toDouble(),
        oddsDnb1: json["odds_dnb_1"]?.toDouble(),
        oddsDnb2: json["odds_dnb_2"],
        oddsCornersOver75: json["odds_corners_over_75"]?.toDouble(),
        oddsCornersOver85: json["odds_corners_over_85"]?.toDouble(),
        oddsCornersOver95: json["odds_corners_over_95"]?.toDouble(),
        oddsCornersOver105: json["odds_corners_over_105"]?.toDouble(),
        oddsCornersOver115: json["odds_corners_over_115"]?.toDouble(),
        oddsCornersUnder75: json["odds_corners_under_75"]?.toDouble(),
        oddsCornersUnder85: json["odds_corners_under_85"]?.toDouble(),
        oddsCornersUnder95: json["odds_corners_under_95"]?.toDouble(),
        oddsCornersUnder105: json["odds_corners_under_105"]?.toDouble(),
        oddsCornersUnder115: json["odds_corners_under_115"]?.toDouble(),
        oddsCorners1: json["odds_corners_1"]?.toDouble(),
        oddsCornersX: json["odds_corners_x"]?.toDouble(),
        oddsCorners2: json["odds_corners_2"]?.toDouble(),
        oddsTeamToScoreFirst1: json["odds_team_to_score_first_1"]?.toDouble(),
        oddsTeamToScoreFirstX: json["odds_team_to_score_first_x"]?.toDouble(),
        oddsTeamToScoreFirst2: json["odds_team_to_score_first_2"],
        oddsWinToNil1: json["odds_win_to_nil_1"],
        oddsWinToNil2: json["odds_win_to_nil_2"]?.toDouble(),
        odds1StHalfOver05: json["odds_1st_half_over05"]?.toDouble(),
        odds1StHalfOver15: json["odds_1st_half_over15"]?.toDouble(),
        odds1StHalfOver25: json["odds_1st_half_over25"]?.toDouble(),
        odds1StHalfOver35: json["odds_1st_half_over35"],
        odds1StHalfUnder05: json["odds_1st_half_under05"]?.toDouble(),
        odds1StHalfUnder15: json["odds_1st_half_under15"]?.toDouble(),
        odds1StHalfUnder25: json["odds_1st_half_under25"]?.toDouble(),
        odds1StHalfUnder35: json["odds_1st_half_under35"]?.toDouble(),
        odds2NdHalfOver05: json["odds_2nd_half_over05"]?.toDouble(),
        odds2NdHalfOver15: json["odds_2nd_half_over15"]?.toDouble(),
        odds2NdHalfOver25: json["odds_2nd_half_over25"]?.toDouble(),
        odds2NdHalfOver35: json["odds_2nd_half_over35"],
        odds2NdHalfUnder05: json["odds_2nd_half_under05"],
        odds2NdHalfUnder15: json["odds_2nd_half_under15"]?.toDouble(),
        odds2NdHalfUnder25: json["odds_2nd_half_under25"]?.toDouble(),
        odds2NdHalfUnder35: json["odds_2nd_half_under35"],
        oddsBtts1StHalfYes: json["odds_btts_1st_half_yes"],
        oddsBtts1StHalfNo: json["odds_btts_1st_half_no"],
        oddsBtts2NdHalfYes: json["odds_btts_2nd_half_yes"],
        oddsBtts2NdHalfNo: json["odds_btts_2nd_half_no"],
        overallGoalCount: json["overallGoalCount"],
        htGoalsTeamA: json["ht_goals_team_a"],
        htGoalsTeamB: json["ht_goals_team_b"],
        goals2HgTeamA: json["goals_2hg_team_a"],
        goals2HgTeamB: json["goals_2hg_team_b"],
        goalCount2Hg: json["GoalCount_2hg"],
        htGoalCount: json["HTGoalCount"],
        dateUnix: json["date_unix"],
        winningTeam: json["winningTeam"],
        noHomeAway: json["no_home_away"],
        bttsPotential: json["btts_potential"],
        bttsFhgPotential: json["btts_fhg_potential"],
        btts2HgPotential: json["btts_2hg_potential"],
        goalTimingDisabled: json["goalTimingDisabled"],
        attendance: json["attendance"],
        cornerTimingsRecorded: json["corner_timings_recorded"],
        cardTimingsRecorded: json["card_timings_recorded"],
        teamAFhCorners: json["team_a_fh_corners"],
        teamBFhCorners: json["team_b_fh_corners"],
        teamA2HCorners: json["team_a_2h_corners"],
        teamB2HCorners: json["team_b_2h_corners"],
        cornerFhCount: json["corner_fh_count"],
        corner2HCount: json["corner_2h_count"],
        teamAFhCards: json["team_a_fh_cards"],
        teamBFhCards: json["team_b_fh_cards"],
        teamA2HCards: json["team_a_2h_cards"],
        teamB2HCards: json["team_b_2h_cards"],
        totalFhCards: json["total_fh_cards"],
        total2HCards: json["total_2h_cards"],
        attacksRecorded: json["attacks_recorded"],
        teamADangerousAttacks: json["team_a_dangerous_attacks"],
        teamBDangerousAttacks: json["team_b_dangerous_attacks"],
        teamAAttacks: json["team_a_attacks"],
        teamBAttacks: json["team_b_attacks"],
        teamAXg: json["team_a_xg"],
        teamBXg: json["team_b_xg"],
        totalXg: json["total_xg"],
        teamAPenaltiesWon: json["team_a_penalties_won"],
        teamBPenaltiesWon: json["team_b_penalties_won"],
        teamAPenaltyGoals: json["team_a_penalty_goals"],
        teamBPenaltyGoals: json["team_b_penalty_goals"],
        teamAPenaltyMissed: json["team_a_penalty_missed"],
        teamBPenaltyMissed: json["team_b_penalty_missed"],
        pensRecorded: json["pens_recorded"],
        goalTimingsRecorded: json["goal_timings_recorded"],
        teamA010MinGoals: json["team_a_0_10_min_goals"],
        teamB010MinGoals: json["team_b_0_10_min_goals"],
        teamACorners010Min: json["team_a_corners_0_10_min"],
        teamBCorners010Min: json["team_b_corners_0_10_min"],
        teamACards010Min: json["team_a_cards_0_10_min"],
        teamBCards010Min: json["team_b_cards_0_10_min"],
        throwinsRecorded: json["throwins_recorded"],
        teamAThrowins: json["team_a_throwins"],
        teamBThrowins: json["team_b_throwins"],
        freekicksRecorded: json["freekicks_recorded"],
        teamAFreekicks: json["team_a_freekicks"],
        teamBFreekicks: json["team_b_freekicks"],
        goalkicksRecorded: json["goalkicks_recorded"],
        teamAGoalkicks: json["team_a_goalkicks"],
        teamBGoalkicks: json["team_b_goalkicks"],
        o45Potential: json["o45_potential"],
        o35Potential: json["o35_potential"],
        o25Potential: json["o25_potential"],
        o15Potential: json["o15_potential"],
        o05Potential: json["o05_potential"],
        o15HtPotential: json["o15HT_potential"],
        o05HtPotential: json["o05HT_potential"],
        o052HPotential: json["o05_2H_potential"],
        o152HPotential: json["o15_2H_potential"],
        cornersPotential: json["corners_potential"]?.toDouble(),
        offsidesPotential: json["offsides_potential"]?.toDouble(),
        cardsPotential: json["cards_potential"]?.toDouble(),
        avgPotential: json["avg_potential"]?.toDouble(),
        homeUrl: json["home_url"] ?? "",
        homeImage: json["home_image"] ?? "",
        homeName: json["home_name"] ?? "",
        awayUrl: json["away_url"] ?? "",
        awayImage: json["away_image"] ?? "",
        awayName: json["away_name"] ?? "",
        homePpg: json["home_ppg"],
        awayPpg: json["away_ppg"]?.toDouble(),
        preMatchHomePpg: json["pre_match_home_ppg"],
        preMatchAwayPpg: json["pre_match_away_ppg"]?.toDouble(),
        preMatchTeamAOverallPpg: json["pre_match_teamA_overall_ppg"],
        preMatchTeamBOverallPpg: json["pre_match_teamB_overall_ppg"]?.toDouble(),
        u45Potential: json["u45_potential"],
        u35Potential: json["u35_potential"],
        u25Potential: json["u25_potential"],
        u15Potential: json["u15_potential"],
        u05Potential: json["u05_potential"],
        cornersO85Potential: json["corners_o85_potential"],
        cornersO95Potential: json["corners_o95_potential"],
        cornersO105Potential: json["corners_o105_potential"],
        teamAXgPrematch: json["team_a_xg_prematch"],
        teamBXgPrematch: json["team_b_xg_prematch"],
        totalXgPrematch: json["total_xg_prematch"],
        matchUrl: json["match_url"] ?? "",
        competitionId: json["competition_id"],
        matchesCompletedMinimum: json["matches_completed_minimum"],
        lineups: _parseMap(json["lineups"], (m) => Bench.fromJson(m)),
        bench: _parseMap(json["bench"], (m) => Bench.fromJson(m)),
        teamAGoalDetails: _toList(json["team_a_goal_details"]),
        teamBGoalDetails: _toList(json["team_b_goal_details"]),
        trends: json["trends"],
        homeGoalsTimings: _toList(json["homeGoals_timings"]),
        awayGoalsTimings: _toList(json["awayGoals_timings"]),
        teamACardDetails: _toList(json["team_a_card_details"]),
        teamBCardDetails: _toList(json["team_b_card_details"]),
        h2H: _parseMap(json["h2h"], (m) => H2H.fromJson(m)),
        tvStations: _toStringList(json["tv_stations"]),
        weather: _parseMap(json["weather"], (m) => Weather.fromJson(m)),
        gptEn: json["gpt_en"],
        gptInt: _parseMap(json["gpt_int"], (m) => GptInt.fromJson(m)),
        oddsComparison: _parseMap(json["odds_comparison"], (m) => OddsComparison.fromJson(m)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "homeID": homeId,
        "awayID": awayId,
        "season": season,
        "status": status,
        "roundID": roundId,
        "game_week": gameWeek,
        "revised_game_week": revisedGameWeek,
        "homeGoals": List<dynamic>.from(homeGoals?.map((x) => x) ?? []),
        "awayGoals": List<dynamic>.from(awayGoals?.map((x) => x) ?? []),
        "homeGoalCount": homeGoalCount,
        "awayGoalCount": awayGoalCount,
        "totalGoalCount": totalGoalCount,
        "team_a_corners": teamACorners,
        "team_b_corners": teamBCorners,
        "totalCornerCount": totalCornerCount,
        "team_a_offsides": teamAOffsides,
        "team_b_offsides": teamBOffsides,
        "team_a_yellow_cards": teamAYellowCards,
        "team_b_yellow_cards": teamBYellowCards,
        "team_a_red_cards": teamARedCards,
        "team_b_red_cards": teamBRedCards,
        "team_a_shotsOnTarget": teamAShotsOnTarget,
        "team_b_shotsOnTarget": teamBShotsOnTarget,
        "team_a_shotsOffTarget": teamAShotsOffTarget,
        "team_b_shotsOffTarget": teamBShotsOffTarget,
        "team_a_shots": teamAShots,
        "team_b_shots": teamBShots,
        "team_a_fouls": teamAFouls,
        "team_b_fouls": teamBFouls,
        "team_a_possession": teamAPossession,
        "team_b_possession": teamBPossession,
        "refereeID": refereeId,
        "coach_a_ID": coachAId,
        "coach_b_ID": coachBId,
        "stadium_name": stadiumName,
        "stadium_location": stadiumLocation,
        "team_a_cards_num": teamACardsNum,
        "team_b_cards_num": teamBCardsNum,
        "odds_ft_1": oddsFt1,
        "odds_ft_x": oddsFtX,
        "odds_ft_2": oddsFt2,
        "odds_ft_over05": oddsFtOver05,
        "odds_ft_over15": oddsFtOver15,
        "odds_ft_over25": oddsFtOver25,
        "odds_ft_over35": oddsFtOver35,
        "odds_ft_over45": oddsFtOver45,
        "odds_ft_under05": oddsFtUnder05,
        "odds_ft_under15": oddsFtUnder15,
        "odds_ft_under25": oddsFtUnder25,
        "odds_ft_under35": oddsFtUnder35,
        "odds_ft_under45": oddsFtUnder45,
        "odds_btts_yes": oddsBttsYes,
        "odds_btts_no": oddsBttsNo,
        "odds_team_a_cs_yes": oddsTeamACsYes,
        "odds_team_a_cs_no": oddsTeamACsNo,
        "odds_team_b_cs_yes": oddsTeamBCsYes,
        "odds_team_b_cs_no": oddsTeamBCsNo,
        "odds_doublechance_1x": oddsDoublechance1X,
        "odds_doublechance_12": oddsDoublechance12,
        "odds_doublechance_x2": oddsDoublechanceX2,
        "odds_1st_half_result_1": odds1StHalfResult1,
        "odds_1st_half_result_x": odds1StHalfResultX,
        "odds_1st_half_result_2": odds1StHalfResult2,
        "odds_2nd_half_result_1": odds2NdHalfResult1,
        "odds_2nd_half_result_x": odds2NdHalfResultX,
        "odds_2nd_half_result_2": odds2NdHalfResult2,
        "odds_dnb_1": oddsDnb1,
        "odds_dnb_2": oddsDnb2,
        "odds_corners_over_75": oddsCornersOver75,
        "odds_corners_over_85": oddsCornersOver85,
        "odds_corners_over_95": oddsCornersOver95,
        "odds_corners_over_105": oddsCornersOver105,
        "odds_corners_over_115": oddsCornersOver115,
        "odds_corners_under_75": oddsCornersUnder75,
        "odds_corners_under_85": oddsCornersUnder85,
        "odds_corners_under_95": oddsCornersUnder95,
        "odds_corners_under_105": oddsCornersUnder105,
        "odds_corners_under_115": oddsCornersUnder115,
        "odds_corners_1": oddsCorners1,
        "odds_corners_x": oddsCornersX,
        "odds_corners_2": oddsCorners2,
        "odds_team_to_score_first_1": oddsTeamToScoreFirst1,
        "odds_team_to_score_first_x": oddsTeamToScoreFirstX,
        "odds_team_to_score_first_2": oddsTeamToScoreFirst2,
        "odds_win_to_nil_1": oddsWinToNil1,
        "odds_win_to_nil_2": oddsWinToNil2,
        "odds_1st_half_over05": odds1StHalfOver05,
        "odds_1st_half_over15": odds1StHalfOver15,
        "odds_1st_half_over25": odds1StHalfOver25,
        "odds_1st_half_over35": odds1StHalfOver35,
        "odds_1st_half_under05": odds1StHalfUnder05,
        "odds_1st_half_under15": odds1StHalfUnder15,
        "odds_1st_half_under25": odds1StHalfUnder25,
        "odds_1st_half_under35": odds1StHalfUnder35,
        "odds_2nd_half_over05": odds2NdHalfOver05,
        "odds_2nd_half_over15": odds2NdHalfOver15,
        "odds_2nd_half_over25": odds2NdHalfOver25,
        "odds_2nd_half_over35": odds2NdHalfOver35,
        "odds_2nd_half_under05": odds2NdHalfUnder05,
        "odds_2nd_half_under15": odds2NdHalfUnder15,
        "odds_2nd_half_under25": odds2NdHalfUnder25,
        "odds_2nd_half_under35": odds2NdHalfUnder35,
        "odds_btts_1st_half_yes": oddsBtts1StHalfYes,
        "odds_btts_1st_half_no": oddsBtts1StHalfNo,
        "odds_btts_2nd_half_yes": oddsBtts2NdHalfYes,
        "odds_btts_2nd_half_no": oddsBtts2NdHalfNo,
        "overallGoalCount": overallGoalCount,
        "ht_goals_team_a": htGoalsTeamA,
        "ht_goals_team_b": htGoalsTeamB,
        "goals_2hg_team_a": goals2HgTeamA,
        "goals_2hg_team_b": goals2HgTeamB,
        "GoalCount_2hg": goalCount2Hg,
        "HTGoalCount": htGoalCount,
        "date_unix": dateUnix,
        "winningTeam": winningTeam,
        "no_home_away": noHomeAway,
        "btts_potential": bttsPotential,
        "btts_fhg_potential": bttsFhgPotential,
        "btts_2hg_potential": btts2HgPotential,
        "goalTimingDisabled": goalTimingDisabled,
        "attendance": attendance,
        "corner_timings_recorded": cornerTimingsRecorded,
        "card_timings_recorded": cardTimingsRecorded,
        "team_a_fh_corners": teamAFhCorners,
        "team_b_fh_corners": teamBFhCorners,
        "team_a_2h_corners": teamA2HCorners,
        "team_b_2h_corners": teamB2HCorners,
        "corner_fh_count": cornerFhCount,
        "corner_2h_count": corner2HCount,
        "team_a_fh_cards": teamAFhCards,
        "team_b_fh_cards": teamBFhCards,
        "team_a_2h_cards": teamA2HCards,
        "team_b_2h_cards": teamB2HCards,
        "total_fh_cards": totalFhCards,
        "total_2h_cards": total2HCards,
        "attacks_recorded": attacksRecorded,
        "team_a_dangerous_attacks": teamADangerousAttacks,
        "team_b_dangerous_attacks": teamBDangerousAttacks,
        "team_a_attacks": teamAAttacks,
        "team_b_attacks": teamBAttacks,
        "team_a_xg": teamAXg,
        "team_b_xg": teamBXg,
        "total_xg": totalXg,
        "team_a_penalties_won": teamAPenaltiesWon,
        "team_b_penalties_won": teamBPenaltiesWon,
        "team_a_penalty_goals": teamAPenaltyGoals,
        "team_b_penalty_goals": teamBPenaltyGoals,
        "team_a_penalty_missed": teamAPenaltyMissed,
        "team_b_penalty_missed": teamBPenaltyMissed,
        "pens_recorded": pensRecorded,
        "goal_timings_recorded": goalTimingsRecorded,
        "team_a_0_10_min_goals": teamA010MinGoals,
        "team_b_0_10_min_goals": teamB010MinGoals,
        "team_a_corners_0_10_min": teamACorners010Min,
        "team_b_corners_0_10_min": teamBCorners010Min,
        "team_a_cards_0_10_min": teamACards010Min,
        "team_b_cards_0_10_min": teamBCards010Min,
        "throwins_recorded": throwinsRecorded,
        "team_a_throwins": teamAThrowins,
        "team_b_throwins": teamBThrowins,
        "freekicks_recorded": freekicksRecorded,
        "team_a_freekicks": teamAFreekicks,
        "team_b_freekicks": teamBFreekicks,
        "goalkicks_recorded": goalkicksRecorded,
        "team_a_goalkicks": teamAGoalkicks,
        "team_b_goalkicks": teamBGoalkicks,
        "o45_potential": o45Potential,
        "o35_potential": o35Potential,
        "o25_potential": o25Potential,
        "o15_potential": o15Potential,
        "o05_potential": o05Potential,
        "o15HT_potential": o15HtPotential,
        "o05HT_potential": o05HtPotential,
        "o05_2H_potential": o052HPotential,
        "o15_2H_potential": o152HPotential,
        "corners_potential": cornersPotential,
        "offsides_potential": offsidesPotential,
        "cards_potential": cardsPotential,
        "avg_potential": avgPotential,
        "home_url": homeUrl,
        "home_image": homeImage,
        "home_name": homeName,
        "away_url": awayUrl,
        "away_image": awayImage,
        "away_name": awayName,
        "home_ppg": homePpg,
        "away_ppg": awayPpg,
        "pre_match_home_ppg": preMatchHomePpg,
        "pre_match_away_ppg": preMatchAwayPpg,
        "pre_match_teamA_overall_ppg": preMatchTeamAOverallPpg,
        "pre_match_teamB_overall_ppg": preMatchTeamBOverallPpg,
        "u45_potential": u45Potential,
        "u35_potential": u35Potential,
        "u25_potential": u25Potential,
        "u15_potential": u15Potential,
        "u05_potential": u05Potential,
        "corners_o85_potential": cornersO85Potential,
        "corners_o95_potential": cornersO95Potential,
        "corners_o105_potential": cornersO105Potential,
        "team_a_xg_prematch": teamAXgPrematch,
        "team_b_xg_prematch": teamBXgPrematch,
        "total_xg_prematch": totalXgPrematch,
        "match_url": matchUrl,
        "competition_id": competitionId,
        "matches_completed_minimum": matchesCompletedMinimum,
        "lineups": lineups?.toJson(),
        "bench": bench?.toJson(),
        "team_a_goal_details": List<dynamic>.from(teamAGoalDetails?.map((x) => x) ?? []),
        "team_b_goal_details": List<dynamic>.from(teamBGoalDetails?.map((x) => x) ?? []),
        "trends": trends,
        "homeGoals_timings": List<dynamic>.from(homeGoalsTimings?.map((x) => x) ?? []),
        "awayGoals_timings": List<dynamic>.from(awayGoalsTimings?.map((x) => x) ?? []),
        "team_a_card_details": List<dynamic>.from(teamACardDetails?.map((x) => x) ?? []),
        "team_b_card_details": List<dynamic>.from(teamBCardDetails?.map((x) => x)?? []),
        "h2h": h2H?.toJson(),
        "tv_stations": List<dynamic>.from(tvStations?.map((x) => x) ?? []),
        "weather": weather?.toJson(),
        "gpt_en": gptEn,
        "gpt_int": gptInt?.toJson(),
        "odds_comparison": oddsComparison?.toJson(),
    };
}

class Bench {
    List<dynamic>? teamA;
    List<dynamic>? teamB;

    Bench({
        this.teamA,
        this.teamB,
    });

    factory Bench.fromJson(Map<String, dynamic> json) => Bench(
        teamA: _toList(json["team_a"]),
        teamB: _toList(json["team_b"]),
    );

    Map<String, dynamic> toJson() => {
        "team_a": List<dynamic>.from(teamA?.map((x) => x) ?? []),
        "team_b": List<dynamic>.from(teamB?.map((x) => x) ?? []),
    };
}

class GptInt {
    String? es;
    String? pt;
    String? tr;
    String? de;
    String? fr;
    String? ja;
    String? it;
    String? se;
    String? ru;
    String? kr;
    String? nl;
    String? dk;
    String? no;
    String? cz;
    String? gr;
    String? pl;
    String? ro;
    String? id;
    String? hr;
    String? th;
    String? fi;
    String? vn;
    String? zht;
    String? cn;
    String? bg;

    GptInt({
        this.es,
        this.pt,
        this.tr,
        this.de,
        this.fr,
        this.ja,
        this.it,
        this.se,
        this.ru,
        this.kr,
        this.nl,
        this.dk,
        this.no,
        this.cz,
        this.gr,
        this.pl,
        this.ro,
        this.id,
        this.hr,
        this.th,
        this.fi,
        this.vn,
        this.zht,
        this.cn,
        this.bg,
    });

    factory GptInt.fromJson(Map<String, dynamic> json) => GptInt(
        es: json["es"],
        pt: json["pt"],
        tr: json["tr"],
        de: json["de"],
        fr: json["fr"],
        ja: json["ja"],
        it: json["it"],
        se: json["se"],
        ru: json["ru"],
        kr: json["kr"],
        nl: json["nl"],
        dk: json["dk"],
        no: json["no"],
        cz: json["cz"],
        gr: json["gr"],
        pl: json["pl"],
        ro: json["ro"],
        id: json["id"],
        hr: json["hr"],
        th: json["th"],
        fi: json["fi"],
        vn: json["vn"],
        zht: json["zht"],
        cn: json["cn"],
        bg: json["bg"],
    );

    Map<String, dynamic> toJson() => {
        "es": es,
        "pt": pt,
        "tr": tr,
        "de": de,
        "fr": fr,
        "ja": ja,
        "it": it,
        "se": se,
        "ru": ru,
        "kr": kr,
        "nl": nl,
        "dk": dk,
        "no": no,
        "cz": cz,
        "gr": gr,
        "pl": pl,
        "ro": ro,
        "id": id,
        "hr": hr,
        "th": th,
        "fi": fi,
        "vn": vn,
        "zht": zht,
        "cn": cn,
        "bg": bg,
    };
}


class H2H {
  num? teamAId;
  num? teamBId;
  Map<String, int>? previousMatchesResults;
  Map<String, int>? bettingStats;
  List<dynamic>? previousMatchesIds;

  H2H({
    this.teamAId,
    this.teamBId,
    this.previousMatchesResults,
    this.bettingStats,
    this.previousMatchesIds,
  });

  factory H2H.fromJson(Map<String, dynamic> json) => H2H(
        teamAId: json["team_a_id"],
        teamBId: json["team_b_id"],
        previousMatchesResults:
            _parseIntMap(json["previous_matches_results"]),
        bettingStats: _parseIntMap(json["betting_stats"]),
        previousMatchesIds: _toList(json["previous_matches_ids"]),
      );

  Map<String, dynamic> toJson() => {
        "team_a_id": teamAId,
        "team_b_id": teamBId,
        "previous_matches_results":
            Map.from(previousMatchesResults ?? {})
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "betting_stats": Map.from(bettingStats ?? {})
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "previous_matches_ids":
            List<dynamic>.from(previousMatchesIds?.map((x) => x) ?? []),
      };
}

class OddsComparison {
    The2NdHalfGoals? the2NdHalfGoals;
    GoalsOverUnder? goalsOverUnder;
    SecondHalfResult? secondHalfResult;
    FtResult? ftResult;
    BothTeamsToScore? bothTeamsToScore;
    Corners? corners;
    The1StHalfGoals? the1StHalfGoals;
    HalfTimeResult? halfTimeResult;
    Corners1X2? corners1X2;
    BothTeamsToScoreInHalf? bothTeamsToScoreIn1StHalf;
    DoubleChance? doubleChance;
    BothTeamsToScoreInHalf? bothTeamsToScoreIn2NdHalf;
    Map<String, CornerMatchBet>? cornerMatchBet;

    OddsComparison({
        this.the2NdHalfGoals,
        this.goalsOverUnder,
        this.secondHalfResult,
        this.ftResult,
        this.bothTeamsToScore,
        this.corners,
        this.the1StHalfGoals,
        this.halfTimeResult,
        this.corners1X2,
        this.bothTeamsToScoreIn1StHalf,
        this.doubleChance,
        this.bothTeamsToScoreIn2NdHalf,
        this.cornerMatchBet,
    });

    factory OddsComparison.fromJson(Map<String, dynamic> json) => OddsComparison(
        the2NdHalfGoals: _parseMap(json["2nd Half Goals"], (m) => The2NdHalfGoals.fromJson(m)),
        goalsOverUnder: _parseMap(json["Goals? Over/Under"], (m) => GoalsOverUnder.fromJson(m)),
        secondHalfResult: _parseMap(json["Second Half Result"], (m) => SecondHalfResult.fromJson(m)),
        ftResult: _parseMap(json["FT Result"], (m) => FtResult.fromJson(m)),
        bothTeamsToScore: _parseMap(json["Both Teams To Score"], (m) => BothTeamsToScore.fromJson(m)),
        corners: _parseMap(json["Corners"], (m) => Corners.fromJson(m)),
        the1StHalfGoals: _parseMap(json["1st Half Goals"], (m) => The1StHalfGoals.fromJson(m)),
        halfTimeResult: _parseMap(json["Half Time Result"], (m) => HalfTimeResult.fromJson(m)),
        corners1X2: _parseMap(json["Corners 1X2"], (m) => Corners1X2.fromJson(m)),
        bothTeamsToScoreIn1StHalf: _parseMap(json["Both Teams to Score in 1st Half"], (m) => BothTeamsToScoreInHalf.fromJson(m)),
        doubleChance: _parseMap(json["Double Chance"], (m) => DoubleChance.fromJson(m)),
        bothTeamsToScoreIn2NdHalf: _parseMap(json["Both Teams to Score in 2nd Half"], (m) => BothTeamsToScoreInHalf.fromJson(m)),
        cornerMatchBet: (json["Corner Match Bet"] is Map)
            ? Map<String, CornerMatchBet>.from((json["Corner Match Bet"] as Map).map(
                (k, v) => MapEntry<String, CornerMatchBet>(k.toString(), CornerMatchBet.fromJson(v)),
              ))
            : <String, CornerMatchBet>{},
    );

    Map<String, dynamic> toJson() => {
        "2nd Half Goals": the2NdHalfGoals?.toJson(),
        "Goals? Over/Under": goalsOverUnder?.toJson(),
        "Second Half Result": secondHalfResult?.toJson(),
        "FT Result": ftResult?.toJson(),
        "Both Teams To Score": bothTeamsToScore?.toJson(),
        "Corners": corners?.toJson(),
        "1st Half Goals": the1StHalfGoals?.toJson(),
        "Half Time Result": halfTimeResult?.toJson(),
        "Corners 1X2": corners1X2?.toJson(),
        "Both Teams to Score in 1st Half": bothTeamsToScoreIn1StHalf?.toJson(),
        "Double Chance": doubleChance?.toJson(),
        "Both Teams to Score in 2nd Half": bothTeamsToScoreIn2NdHalf?.toJson(),
        "Corner Match Bet": Map.from(cornerMatchBet ?? {}).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class BothTeamsToScore {
    AwayClass? no;
    AwayClass? yes;

    BothTeamsToScore({
        this.no,
        this.yes,
    });

    factory BothTeamsToScore.fromJson(Map<String, dynamic> json) => BothTeamsToScore(
        no: AwayClass.fromJson(json["No"]),
        yes: AwayClass.fromJson(json["Yes"]),
    );

    Map<String, dynamic> toJson() => {
        "No": no?.toJson(),
        "Yes": yes?.toJson(),
    };
}

class AwayClass {
    String? bet365;
    String? the888Sport;
    String? williamHill;
    String? unibet;
    String? the188Bet;
    String? pinnacle;
    String? the10Bet;
    String? the1Xbet;
    String? sbo;

    AwayClass({
        this.bet365,
        this.the888Sport,
        this.williamHill,
        this.unibet,
        this.the188Bet,
        this.pinnacle,
        this.the10Bet,
        this.the1Xbet,
        this.sbo,
    });

    factory AwayClass.fromJson(Map<String, dynamic> json) => AwayClass(
        bet365: json["bet365"],
        the888Sport: json["888Sport"],
        williamHill: json["WilliamHill"],
        unibet: json["Unibet"],
        the188Bet: json["188Bet"],
        pinnacle: json["Pinnacle"],
        the10Bet: json["10Bet"],
        the1Xbet: json["1xbet"],
        sbo: json["Sbo"],
    );

    Map<String, dynamic> toJson() => {
        "bet365": bet365,
        "888Sport": the888Sport,
        "WilliamHill": williamHill,
        "Unibet": unibet,
        "188Bet": the188Bet,
        "Pinnacle": pinnacle,
        "10Bet": the10Bet,
        "1xbet": the1Xbet,
        "Sbo": sbo,
    };
}

class BothTeamsToScoreInHalf {
    BothTeamsToScoreIn1StHalfNo? yes;
    BothTeamsToScoreIn1StHalfNo? no;

    BothTeamsToScoreInHalf({
        this.yes,
        this.no,
    });

    factory BothTeamsToScoreInHalf.fromJson(Map<String, dynamic> json) => BothTeamsToScoreInHalf(
        yes: BothTeamsToScoreIn1StHalfNo.fromJson(json["Yes"]),
        no: BothTeamsToScoreIn1StHalfNo.fromJson(json["No"]),
    );

    Map<String, dynamic> toJson() => {
        "Yes": yes?.toJson(),
        "No": no?.toJson(),
    };
}

class BothTeamsToScoreIn1StHalfNo {
    String? the10Bet;
    String? bet365;

    BothTeamsToScoreIn1StHalfNo({
        this.the10Bet,
        this.bet365,
    });

    factory BothTeamsToScoreIn1StHalfNo.fromJson(Map<String, dynamic> json) => BothTeamsToScoreIn1StHalfNo(
        the10Bet: json["10Bet"],
        bet365: json["bet365"],
    );

    Map<String, dynamic> toJson() => {
        "10Bet": the10Bet,
        "bet365": bet365,
    };
}

class CornerMatchBet {
    String? bet365;

    CornerMatchBet({
        this.bet365,
    });

    factory CornerMatchBet.fromJson(Map<String, dynamic> json) => CornerMatchBet(
        bet365: json["bet365"],
    );

    Map<String, dynamic> toJson() => {
        "bet365": bet365,
    };
}

class Corners {
    Over115? over75;
    Over105? over85;
    Over105? under85;
    Over105? over95;
    Over105? under95;
    Over105? over105;
    Over105? under105;
    Over115? under75;
    Over115? over115;
    Over115? under115;

    Corners({
        this.over75,
        this.over85,
        this.under85,
        this.over95,
        this.under95,
        this.over105,
        this.under105,
        this.under75,
        this.over115,
        this.under115,
    });

    factory Corners.fromJson(Map<String, dynamic> json) => Corners(
        over75: Over115.fromJson(json["Over 7.5"]),
        over85: Over105.fromJson(json["Over 8.5"]),
        under85: Over105.fromJson(json["Under 8.5"]),
        over95: Over105.fromJson(json["Over 9.5"]),
        under95: Over105.fromJson(json["Under 9.5"]),
        over105: Over105.fromJson(json["Over 10.5"]),
        under105: Over105.fromJson(json["Under 10.5"]),
        under75: Over115.fromJson(json["Under 7.5"]),
        over115: Over115.fromJson(json["Over 11.5"]),
        under115: Over115.fromJson(json["Under 11.5"]),
    );

    Map<String, dynamic> toJson() => {
        "Over 7.5": over75?.toJson(),
        "Over 8.5": over85?.toJson(),
        "Under 8.5": under85?.toJson(),
        "Over 9.5": over95?.toJson(),
        "Under 9.5": under95?.toJson(),
        "Over 10.5": over105?.toJson(),
        "Under 10.5": under105?.toJson(),
        "Under 7.5": under75?.toJson(),
        "Over 11.5": over115?.toJson(),
        "Under 11.5": under115?.toJson(),
    };
}

class Over105 {
    String? the1Xbet;
    String? unibet;
    String? pinnacle;

    Over105({
        this.the1Xbet,
        this.unibet,
        this.pinnacle,
    });

    factory Over105.fromJson(Map<String, dynamic> json) => Over105(
        the1Xbet: json["1xbet"],
        unibet: json["Unibet"],
        pinnacle: json["Pinnacle"],
    );

    Map<String, dynamic> toJson() => {
        "1xbet": the1Xbet,
        "Unibet": unibet,
        "Pinnacle": pinnacle,
    };
}

class Over115 {
    String? the1Xbet;
    String? unibet;

    Over115({
        this.the1Xbet,
        this.unibet,
    });

    factory Over115.fromJson(Map<String, dynamic> json) => Over115(
        the1Xbet: json["1xbet"],
        unibet: json["Unibet"],
    );

    Map<String, dynamic> toJson() => {
        "1xbet": the1Xbet,
        "Unibet": unibet,
    };
}

class Corners1X2 {
    Over115? away;
    Over115? home;
    Over115? draw;

    Corners1X2({
        this.away,
        this.home,
        this.draw,
    });

    factory Corners1X2.fromJson(Map<String, dynamic> json) => Corners1X2(
        away: Over115.fromJson(json["Away"]),
        home: Over115.fromJson(json["Home"]),
        draw: Over115.fromJson(json["Draw"]),
    );

    Map<String, dynamic> toJson() => {
        "Away": away?.toJson(),
        "Home": home?.toJson(),
        "Draw": draw?.toJson(),
    };
}

class DoubleChance {
    DrawAway? homeDraw;
    DrawAway? homeAway;
    DrawAway? drawAway;

    DoubleChance({
        this.homeDraw,
        this.homeAway,
        this.drawAway,
    });

    factory DoubleChance.fromJson(Map<String, dynamic> json) => DoubleChance(
        homeDraw: DrawAway.fromJson(json["Home/Draw"]),
        homeAway: DrawAway.fromJson(json["Home/Away"]),
        drawAway: DrawAway.fromJson(json["Draw/Away"]),
    );

    Map<String, dynamic> toJson() => {
        "Home/Draw": homeDraw?.toJson(),
        "Home/Away": homeAway?.toJson(),
        "Draw/Away": drawAway?.toJson(),
    };
}

class DrawAway {
    String? williamHill;
    String? unibet;
    String? the1Xbet;
    String? pinnacle;
    String? the888Sport;
    String? the10Bet;
    String? sbo;

    DrawAway({
        this.williamHill,
        this.unibet,
        this.the1Xbet,
        this.pinnacle,
        this.the888Sport,
        this.the10Bet,
        this.sbo,
    });

    factory DrawAway.fromJson(Map<String, dynamic> json) => DrawAway(
        williamHill: json["WilliamHill"],
        unibet: json["Unibet"],
        the1Xbet: json["1xbet"],
        pinnacle: json["Pinnacle"],
        the888Sport: json["888Sport"],
        the10Bet: json["10Bet"],
        sbo: json["Sbo"],
    );

    Map<String, dynamic> toJson() => {
        "WilliamHill": williamHill,
        "Unibet": unibet,
        "1xbet": the1Xbet,
        "Pinnacle": pinnacle,
        "888Sport": the888Sport,
        "10Bet": the10Bet,
        "Sbo": sbo,
    };
}

class FtResult {
    Away? away;
    Away? home;
    Away? draw;

    FtResult({
        this.away,
        this.home,
        this.draw,
    });

    factory FtResult.fromJson(Map<String, dynamic> json) => FtResult(
        away: Away.fromJson(json["Away"]),
        home: Away.fromJson(json["Home"]),
        draw: Away.fromJson(json["Draw"]),
    );

    Map<String, dynamic> toJson() => {
        "Away": away?.toJson(),
        "Home": home?.toJson(),
        "Draw": draw?.toJson(),
    };
}

class Away {
    String? ladbrokes;
    String? williamHill;
    String? unibet;
    String? hkjc;
    String? melBet;
    String? pinnacle;
    String? interwetten;
    String? mansionBet;
    String? betfair;
    String? dafabet;
    String? sbo;
    String? bwin;
    String? the1Xbet;
    String? the10Bet;
    String? the188Bet;
    String? cloudBet;
    String? the888Sport;
    String? bet365;

    Away({
        this.ladbrokes,
        this.williamHill,
        this.unibet,
        this.hkjc,
        this.melBet,
        this.pinnacle,
        this.interwetten,
        this.mansionBet,
        this.betfair,
        this.dafabet,
        this.sbo,
        this.bwin,
        this.the1Xbet,
        this.the10Bet,
        this.the188Bet,
        this.cloudBet,
        this.the888Sport,
        this.bet365,
    });

    factory Away.fromJson(Map<String, dynamic> json) => Away(
        ladbrokes: json["Ladbrokes"],
        williamHill: json["WilliamHill"],
        unibet: json["Unibet"],
        hkjc: json["HKJC"],
        melBet: json["MelBet"],
        pinnacle: json["Pinnacle"],
        interwetten: json["Interwetten"],
        mansionBet: json["MansionBet"],
        betfair: json["Betfair"],
        dafabet: json["Dafabet"],
        sbo: json["Sbo"],
        bwin: json["bwin"],
        the1Xbet: json["1xbet"],
        the10Bet: json["10Bet"],
        the188Bet: json["188Bet"],
        cloudBet: json["CloudBet"],
        the888Sport: json["888Sport"],
        bet365: json["bet365"],
    );

    Map<String, dynamic> toJson() => {
        "Ladbrokes": ladbrokes,
        "WilliamHill": williamHill,
        "Unibet": unibet,
        "HKJC": hkjc,
        "MelBet": melBet,
        "Pinnacle": pinnacle,
        "Interwetten": interwetten,
        "MansionBet": mansionBet,
        "Betfair": betfair,
        "Dafabet": dafabet,
        "Sbo": sbo,
        "bwin": bwin,
        "1xbet": the1Xbet,
        "10Bet": the10Bet,
        "188Bet": the188Bet,
        "CloudBet": cloudBet,
        "888Sport": the888Sport,
        "bet365": bet365,
    };
}

class GoalsOverUnder {
    Over25? over45;
    Over25? over35;
    Over25? under45;
    Over25? under35;
    Over? over15;
    Over25? under15;
    Over25? over25;
    Over25? under25;
    Over? over05;
    Over25? under05;

    GoalsOverUnder({
        this.over45,
        this.over35,
        this.under45,
        this.under35,
        this.over15,
        this.under15,
        this.over25,
        this.under25,
        this.over05,
        this.under05,
    });

    factory GoalsOverUnder.fromJson(Map<String, dynamic> json) => GoalsOverUnder(
        over45: Over25.fromJson(json["Over 4.5"]),
        over35: Over25.fromJson(json["Over 3.5"]),
        under45: Over25.fromJson(json["Under 4.5"]),
        under35: Over25.fromJson(json["Under 3.5"]),
        over15: Over.fromJson(json["Over 1.5"]),
        under15: Over25.fromJson(json["Under 1.5"]),
        over25: Over25.fromJson(json["Over 2.5"]),
        under25: Over25.fromJson(json["Under 2.5"]),
        over05: Over.fromJson(json["Over 0.5"]),
        under05: Over25.fromJson(json["Under 0.5"]),
    );

    Map<String, dynamic> toJson() => {
        "Over 4.5": over45?.toJson(),
        "Over 3.5": over35?.toJson(),
        "Under 4.5": under45?.toJson(),
        "Under 3.5": under35?.toJson(),
        "Over 1.5": over15?.toJson(),
        "Under 1.5": under15?.toJson(),
        "Over 2.5": over25?.toJson(),
        "Under 2.5": under25?.toJson(),
        "Over 0.5": over05?.toJson(),
        "Under 0.5": under05?.toJson(),
    };
}

class Over {
    String? the888Sport;
    String? the1Xbet;
    String? the10Bet;
    String? unibet;

    Over({
        this.the888Sport,
        this.the1Xbet,
        this.the10Bet,
        this.unibet,
    });

    factory Over.fromJson(Map<String, dynamic> json) => Over(
        the888Sport: json["888Sport"],
        the1Xbet: json["1xbet"],
        the10Bet: json["10Bet"],
        unibet: json["Unibet"],
    );

    Map<String, dynamic> toJson() => {
        "888Sport": the888Sport,
        "1xbet": the1Xbet,
        "10Bet": the10Bet,
        "Unibet": unibet,
    };
}

class Over25 {
    String? unibet;
    String? the888Sport;
    String? the1Xbet;
    String? pinnacle;
    String? the10Bet;
    String? bet365;
    String? williamHill;

    Over25({
        this.unibet,
        this.the888Sport,
        this.the1Xbet,
        this.pinnacle,
        this.the10Bet,
        this.bet365,
        this.williamHill,
    });

    factory Over25.fromJson(Map<String, dynamic> json) => Over25(
        unibet: json["Unibet"],
        the888Sport: json["888Sport"],
        the1Xbet: json["1xbet"],
        pinnacle: json["Pinnacle"],
        the10Bet: json["10Bet"],
        bet365: json["bet365"],
        williamHill: json["WilliamHill"],
    );

    Map<String, dynamic> toJson() => {
        "Unibet": unibet,
        "888Sport": the888Sport,
        "1xbet": the1Xbet,
        "Pinnacle": pinnacle,
        "10Bet": the10Bet,
        "bet365": bet365,
        "WilliamHill": williamHill,
    };
}

class HalfTimeResult {
    AwayClass? home;
    AwayClass? draw;
    AwayClass? away;

    HalfTimeResult({
        this.home,
        this.draw,
        this.away,
    });

    factory HalfTimeResult.fromJson(Map<String, dynamic> json) => HalfTimeResult(
        home: AwayClass.fromJson(json["Home"]),
        draw: AwayClass.fromJson(json["Draw"]),
        away: AwayClass.fromJson(json["Away"]),
    );

    Map<String, dynamic> toJson() => {
        "Home": home?.toJson(),
        "Draw": draw?.toJson(),
        "Away": away?.toJson(),
    };
}

class SecondHalfResult {
    Over25? home;
    Over25? draw;
    Over25? away;

    SecondHalfResult({
        this.home,
        this.draw,
        this.away,
    });

    factory SecondHalfResult.fromJson(Map<String, dynamic> json) => SecondHalfResult(
        home: Over25.fromJson(json["Home"]),
        draw: Over25.fromJson(json["Draw"]),
        away: Over25.fromJson(json["Away"]),
    );

    Map<String, dynamic> toJson() => {
        "Home": home?.toJson(),
        "Draw": draw?.toJson(),
        "Away": away?.toJson(),
    };
}

class The1StHalfGoals {
    The1StHalfGoalsOver05? under15;
    The1StHalfGoalsOver05? over25;
    The1StHalfGoalsOver05? under25;
    The1StHalfGoalsOver05? over15;
    The1StHalfGoalsOver05? over05;
    The1StHalfGoalsOver05? under05;

    The1StHalfGoals({
        this.under15,
        this.over25,
        this.under25,
        this.over15,
        this.over05,
        this.under05,
    });

    factory The1StHalfGoals.fromJson(Map<String, dynamic> json) => The1StHalfGoals(
        under15: The1StHalfGoalsOver05.fromJson(json["Under 1.5"] ?? {}),
        over25: The1StHalfGoalsOver05.fromJson(json["Over 2.5"] ?? {}),
        under25: The1StHalfGoalsOver05.fromJson(json["Under 2.5"] ?? {}),
        over15: The1StHalfGoalsOver05.fromJson(json["Over 1.5"] ?? {}),
        over05: The1StHalfGoalsOver05.fromJson(json["Over 0.5"] ?? {}),
        under05: The1StHalfGoalsOver05.fromJson(json["Under 0.5"] ?? {}),
    );

    Map<String, dynamic> toJson() => {
        "Under 1.5": under15?.toJson(),
        "Over 2.5": over25?.toJson(),
        "Under 2.5": under25?.toJson(),
        "Over 1.5": over15?.toJson(),
        "Over 0.5": over05?.toJson(),
        "Under 0.5": under05?.toJson(),
    };
}

class The1StHalfGoalsOver05 {
    String? the1Xbet;
    String? the10Bet;
    String? williamHill;
    String? unibet;

    The1StHalfGoalsOver05({
        this.the1Xbet,
        this.the10Bet,
        this.williamHill,
        this.unibet,
    });

    factory The1StHalfGoalsOver05.fromJson(Map<String, dynamic> json) => The1StHalfGoalsOver05(
        the1Xbet: json["1xbet"] ?? "",
        the10Bet: json["10Bet"] ?? "",
        williamHill: json["WilliamHill"] ?? "",
        unibet: json["Unibet"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "1xbet": the1Xbet,
        "10Bet": the10Bet,
        "WilliamHill": williamHill,
        "Unibet": unibet,
    };
}

class The2NdHalfGoals {
    The2NdHalfGoalsOver05? over25;
    The2NdHalfGoalsOver05? under25;
    The2NdHalfGoalsOver05? over05;
    The2NdHalfGoalsOver05? under15;
    The2NdHalfGoalsOver05? under05;
    The2NdHalfGoalsOver05? over15;

    The2NdHalfGoals({
        this.over25,
        this.under25,
        this.over05,
        this.under15,
        this.under05,
        this.over15,
    });

    factory The2NdHalfGoals.fromJson(Map<String, dynamic> json) => The2NdHalfGoals(
        over25: The2NdHalfGoalsOver05.fromJson(json["Over 2.5"] ?? ""),
        under25: The2NdHalfGoalsOver05.fromJson(json["Under 2.5"] ?? ""),
        over05: The2NdHalfGoalsOver05.fromJson(json["Over 0.5"] ?? ""),
        under15: The2NdHalfGoalsOver05.fromJson(json["Under 1.5"] ?? ""),
        under05: The2NdHalfGoalsOver05.fromJson(json["Under 0.5"] ?? ""),
        over15: The2NdHalfGoalsOver05.fromJson(json["Over 1.5"] ?? ""),
    );

    Map<String, dynamic> toJson() => {
        "Over 2.5": over25?.toJson(),
        "Under 2.5": under25?.toJson(),
        "Over 0.5": over05?.toJson(),
        "Under 1.5": under15?.toJson(),
        "Under 0.5": under05?.toJson(),
        "Over 1.5": over15?.toJson(),
    };
}

class The2NdHalfGoalsOver05 {
    String? williamHill;
    String? the1Xbet;
    String? the888Sport;
    String? unibet;

    The2NdHalfGoalsOver05({
        this.williamHill,
        this.the1Xbet,
        this.the888Sport,
        this.unibet,
    });

    factory The2NdHalfGoalsOver05.fromJson(Map<String, dynamic> json) => The2NdHalfGoalsOver05(
        williamHill: json["WilliamHill"] ?? "",
        the1Xbet: json["1xbet"] ?? "",
        the888Sport: json["888Sport"] ?? "",
        unibet: json["Unibet"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "WilliamHill": williamHill,
        "1xbet": the1Xbet,
        "888Sport": the888Sport,
        "Unibet": unibet,
    };
}

class Weather {
    num? id;
    num? fixtureId;
    num? venueId;
    FeelsLike? temperature;
    FeelsLike? feelsLike;
    Wind? wind;
    String? humidity;
    num? pressure;
    String? clouds;
    String? description;
    String? icon;
    String? type;
    String? metric;
    dynamic current;

    Weather({
        this.id,
        this.fixtureId,
        this.venueId,
        this.temperature,
        this.feelsLike,
        this.wind,
        this.humidity,
        this.pressure,
        this.clouds,
        this.description,
        this.icon,
        this.type,
        this.metric,
        this.current,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        fixtureId: json["fixture_id"] ?? "",
        venueId: json["venue_id"] ?? "",
        temperature: FeelsLike.fromJson(json["temperature"] ?? {}),
        feelsLike: FeelsLike.fromJson(json["feels_like"] ?? {}),
        wind: Wind.fromJson(json["wind"] ?? {}),
        humidity: json["humidity"] ?? "",
        pressure: json["pressure"] ?? "",
        clouds: json["clouds"] ?? "",
        description: json["description"] ?? "" ,
        icon: json["icon"] ?? "",
        type: json["type"] ?? "",
        metric: json["metric"] ?? "",
        current: json["current"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fixture_id": fixtureId,
        "venue_id": venueId,
        "temperature": temperature?.toJson(),
        "feels_like": feelsLike?.toJson(),
        "wind": wind?.toJson(),
        "humidity": humidity,
        "pressure": pressure,
        "clouds": clouds,
        "description": description,
        "icon": icon,
        "type": type,
        "metric": metric,
        "current": current,
    };
}

class FeelsLike {
    double? day;
    double? morning;
    double? evening;
    double? night;

    FeelsLike({
        this.day,
        this.morning,
        this.evening,
        this.night,
    });

    factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"]?.toDouble() ?? 0.0,
        morning: json["morning"]?.toDouble() ?? 0.0,
        evening: json["evening"]?.toDouble() ?? 0.0,
        night: json["night"]?.toDouble() ?? 0.0,
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "morning": morning,
        "evening": evening,
        "night": night,
    };
}

class Wind {
    double? speed;
    num? direction;

    Wind({
        this.speed,
        this.direction,
    });

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble() ?? 0.0,
        direction: json["direction"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "direction": direction,
    };
}

class Metadata {
    String? requestLimit;
    String? requestRemaining;
    String? requestResetMessage;

    Metadata({
        this.requestLimit,
        this.requestRemaining,
        this.requestResetMessage,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        requestLimit: json["request_limit"] ?? "",
        requestRemaining: json["request_remaining"] ?? "",
        requestResetMessage: json["request_reset_message"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "request_limit": requestLimit,
        "request_remaining": requestRemaining,
        "request_reset_message": requestResetMessage,
    };
}

class Pager {
    num? currentPage;
    num? maxPage;
    num? resultsPerPage;
    num? totalResults;

    Pager({
        this.currentPage,
        this.maxPage,
        this.resultsPerPage,
        this.totalResults,
    });

    factory Pager.fromJson(Map<String, dynamic> json) => Pager(
        currentPage: json["current_page"],
        maxPage: json["max_page"],
        resultsPerPage: json["results_per_page"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "max_page": maxPage,
        "results_per_page": resultsPerPage,
        "total_results": totalResults,
    };
}

T? _parseMap<T>(dynamic value, T Function(Map<String, dynamic>) parser) {
  if (value is Map<String, dynamic>) return parser(value);
  return null;
}

List<dynamic> _toList(dynamic value) => value is List ? value : <dynamic>[];

List<String> _toStringList(dynamic value) =>
    value is List ? value.map((e) => e?.toString() ?? "").toList() : <String>[];

Map<String, int> _parseIntMap(dynamic value) {
  if (value is Map) {
    return value.map((key, v) {
      if (v is int) return MapEntry(key.toString(), v);
      if (v is num) return MapEntry(key.toString(), v.toInt());
      // if it's something else (string/null), treat as 0 or skip
      return MapEntry(key.toString(), 0);
    });
  }
  return <String, int>{};
}