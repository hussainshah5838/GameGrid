// To parse this JSON data, do
//
//     final matchDetailsModel = matchDetailsModelFromJson(jsonString);

import 'dart:convert';

MatchDetailsModel matchDetailsModelFromJson(String str) => MatchDetailsModel.fromJson(json.decode(str));

String matchDetailsModelToJson(MatchDetailsModel data) => json.encode(data.toJson());

class MatchDetailsModel {
    bool success;
    Pager pager;
    Metadata metadata;
    Data data;
    String message;

    MatchDetailsModel({
        required this.success,
        required this.pager,
        required this.metadata,
        required this.data,
        required this.message,
    });

    factory MatchDetailsModel.fromJson(Map<String, dynamic> json) => MatchDetailsModel(
        success: json["success"],
        pager: Pager.fromJson(json["pager"]),
        metadata: Metadata.fromJson(json["metadata"]),
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "pager": pager.toJson(),
        "metadata": metadata.toJson(),
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    int id;
    int homeId;
    int awayId;
    String season;
    String status;
    int roundId;
    int gameWeek;
    int revisedGameWeek;
    List<dynamic> homeGoals;
    List<dynamic> awayGoals;
    int homeGoalCount;
    int awayGoalCount;
    int totalGoalCount;
    int teamACorners;
    int teamBCorners;
    int totalCornerCount;
    int teamAOffsides;
    int teamBOffsides;
    int teamAYellowCards;
    int teamBYellowCards;
    int teamARedCards;
    int teamBRedCards;
    int teamAShotsOnTarget;
    int teamBShotsOnTarget;
    int teamAShotsOffTarget;
    int teamBShotsOffTarget;
    int teamAShots;
    int teamBShots;
    int teamAFouls;
    int teamBFouls;
    int teamAPossession;
    int teamBPossession;
    dynamic refereeId;
    int coachAId;
    int coachBId;
    String stadiumName;
    String stadiumLocation;
    int teamACardsNum;
    int teamBCardsNum;
    double oddsFt1;
    double oddsFtX;
    double oddsFt2;
    double oddsFtOver05;
    double oddsFtOver15;
    double oddsFtOver25;
    double oddsFtOver35;
    double oddsFtOver45;
    double oddsFtUnder05;
    double oddsFtUnder15;
    double oddsFtUnder25;
    double oddsFtUnder35;
    double oddsFtUnder45;
    double oddsBttsYes;
    double oddsBttsNo;
    int oddsTeamACsYes;
    int oddsTeamACsNo;
    int oddsTeamBCsYes;
    int oddsTeamBCsNo;
    double oddsDoublechance1X;
    double oddsDoublechance12;
    double oddsDoublechanceX2;
    double odds1StHalfResult1;
    double odds1StHalfResultX;
    double odds1StHalfResult2;
    double odds2NdHalfResult1;
    double odds2NdHalfResultX;
    double odds2NdHalfResult2;
    double oddsDnb1;
    int oddsDnb2;
    double oddsCornersOver75;
    double oddsCornersOver85;
    double oddsCornersOver95;
    double oddsCornersOver105;
    double oddsCornersOver115;
    double oddsCornersUnder75;
    double oddsCornersUnder85;
    double oddsCornersUnder95;
    double oddsCornersUnder105;
    double oddsCornersUnder115;
    double oddsCorners1;
    double oddsCornersX;
    double oddsCorners2;
    double oddsTeamToScoreFirst1;
    double oddsTeamToScoreFirstX;
    int oddsTeamToScoreFirst2;
    int oddsWinToNil1;
    double oddsWinToNil2;
    double odds1StHalfOver05;
    double odds1StHalfOver15;
    double odds1StHalfOver25;
    int odds1StHalfOver35;
    double odds1StHalfUnder05;
    double odds1StHalfUnder15;
    double odds1StHalfUnder25;
    double odds1StHalfUnder35;
    double odds2NdHalfOver05;
    double odds2NdHalfOver15;
    double odds2NdHalfOver25;
    int odds2NdHalfOver35;
    int odds2NdHalfUnder05;
    double odds2NdHalfUnder15;
    double odds2NdHalfUnder25;
    double odds2NdHalfUnder35;
    int oddsBtts1StHalfYes;
    int oddsBtts1StHalfNo;
    int oddsBtts2NdHalfYes;
    int oddsBtts2NdHalfNo;
    int overallGoalCount;
    int htGoalsTeamA;
    int htGoalsTeamB;
    int goals2HgTeamA;
    int goals2HgTeamB;
    int goalCount2Hg;
    int htGoalCount;
    int dateUnix;
    int winningTeam;
    int noHomeAway;
    int bttsPotential;
    int bttsFhgPotential;
    int btts2HgPotential;
    int goalTimingDisabled;
    int attendance;
    int cornerTimingsRecorded;
    int cardTimingsRecorded;
    int teamAFhCorners;
    int teamBFhCorners;
    int teamA2HCorners;
    int teamB2HCorners;
    int cornerFhCount;
    int corner2HCount;
    int teamAFhCards;
    int teamBFhCards;
    int teamA2HCards;
    int teamB2HCards;
    int totalFhCards;
    int total2HCards;
    int attacksRecorded;
    int teamADangerousAttacks;
    int teamBDangerousAttacks;
    int teamAAttacks;
    int teamBAttacks;
    int teamAXg;
    int teamBXg;
    int totalXg;
    int teamAPenaltiesWon;
    int teamBPenaltiesWon;
    int teamAPenaltyGoals;
    int teamBPenaltyGoals;
    int teamAPenaltyMissed;
    int teamBPenaltyMissed;
    int pensRecorded;
    int goalTimingsRecorded;
    int teamA010MinGoals;
    int teamB010MinGoals;
    int teamACorners010Min;
    int teamBCorners010Min;
    int teamACards010Min;
    int teamBCards010Min;
    int throwinsRecorded;
    int teamAThrowins;
    int teamBThrowins;
    int freekicksRecorded;
    int teamAFreekicks;
    int teamBFreekicks;
    int goalkicksRecorded;
    int teamAGoalkicks;
    int teamBGoalkicks;
    int o45Potential;
    int o35Potential;
    int o25Potential;
    int o15Potential;
    int o05Potential;
    int o15HtPotential;
    int o05HtPotential;
    int o052HPotential;
    int o152HPotential;
    double cornersPotential;
    double offsidesPotential;
    double cardsPotential;
    double avgPotential;
    String homeUrl;
    String homeImage;
    String homeName;
    String awayUrl;
    String awayImage;
    String awayName;
    int homePpg;
    double awayPpg;
    int preMatchHomePpg;
    double preMatchAwayPpg;
    int preMatchTeamAOverallPpg;
    double preMatchTeamBOverallPpg;
    int u45Potential;
    int u35Potential;
    int u25Potential;
    int u15Potential;
    int u05Potential;
    int cornersO85Potential;
    int cornersO95Potential;
    int cornersO105Potential;
    double teamAXgPrematch;
    double teamBXgPrematch;
    double totalXgPrematch;
    String matchUrl;
    int competitionId;
    int matchesCompletedMinimum;
    Bench lineups;
    Bench bench;
    List<dynamic> teamAGoalDetails;
    List<dynamic> teamBGoalDetails;
    dynamic trends;
    List<dynamic> homeGoalsTimings;
    List<dynamic> awayGoalsTimings;
    List<dynamic> teamACardDetails;
    List<dynamic> teamBCardDetails;
    H2H h2H;
    List<String> tvStations;
    Weather weather;
    String gptEn;
    GptInt gptInt;
    OddsComparison oddsComparison;

    Data({
        required this.id,
        required this.homeId,
        required this.awayId,
        required this.season,
        required this.status,
        required this.roundId,
        required this.gameWeek,
        required this.revisedGameWeek,
        required this.homeGoals,
        required this.awayGoals,
        required this.homeGoalCount,
        required this.awayGoalCount,
        required this.totalGoalCount,
        required this.teamACorners,
        required this.teamBCorners,
        required this.totalCornerCount,
        required this.teamAOffsides,
        required this.teamBOffsides,
        required this.teamAYellowCards,
        required this.teamBYellowCards,
        required this.teamARedCards,
        required this.teamBRedCards,
        required this.teamAShotsOnTarget,
        required this.teamBShotsOnTarget,
        required this.teamAShotsOffTarget,
        required this.teamBShotsOffTarget,
        required this.teamAShots,
        required this.teamBShots,
        required this.teamAFouls,
        required this.teamBFouls,
        required this.teamAPossession,
        required this.teamBPossession,
        required this.refereeId,
        required this.coachAId,
        required this.coachBId,
        required this.stadiumName,
        required this.stadiumLocation,
        required this.teamACardsNum,
        required this.teamBCardsNum,
        required this.oddsFt1,
        required this.oddsFtX,
        required this.oddsFt2,
        required this.oddsFtOver05,
        required this.oddsFtOver15,
        required this.oddsFtOver25,
        required this.oddsFtOver35,
        required this.oddsFtOver45,
        required this.oddsFtUnder05,
        required this.oddsFtUnder15,
        required this.oddsFtUnder25,
        required this.oddsFtUnder35,
        required this.oddsFtUnder45,
        required this.oddsBttsYes,
        required this.oddsBttsNo,
        required this.oddsTeamACsYes,
        required this.oddsTeamACsNo,
        required this.oddsTeamBCsYes,
        required this.oddsTeamBCsNo,
        required this.oddsDoublechance1X,
        required this.oddsDoublechance12,
        required this.oddsDoublechanceX2,
        required this.odds1StHalfResult1,
        required this.odds1StHalfResultX,
        required this.odds1StHalfResult2,
        required this.odds2NdHalfResult1,
        required this.odds2NdHalfResultX,
        required this.odds2NdHalfResult2,
        required this.oddsDnb1,
        required this.oddsDnb2,
        required this.oddsCornersOver75,
        required this.oddsCornersOver85,
        required this.oddsCornersOver95,
        required this.oddsCornersOver105,
        required this.oddsCornersOver115,
        required this.oddsCornersUnder75,
        required this.oddsCornersUnder85,
        required this.oddsCornersUnder95,
        required this.oddsCornersUnder105,
        required this.oddsCornersUnder115,
        required this.oddsCorners1,
        required this.oddsCornersX,
        required this.oddsCorners2,
        required this.oddsTeamToScoreFirst1,
        required this.oddsTeamToScoreFirstX,
        required this.oddsTeamToScoreFirst2,
        required this.oddsWinToNil1,
        required this.oddsWinToNil2,
        required this.odds1StHalfOver05,
        required this.odds1StHalfOver15,
        required this.odds1StHalfOver25,
        required this.odds1StHalfOver35,
        required this.odds1StHalfUnder05,
        required this.odds1StHalfUnder15,
        required this.odds1StHalfUnder25,
        required this.odds1StHalfUnder35,
        required this.odds2NdHalfOver05,
        required this.odds2NdHalfOver15,
        required this.odds2NdHalfOver25,
        required this.odds2NdHalfOver35,
        required this.odds2NdHalfUnder05,
        required this.odds2NdHalfUnder15,
        required this.odds2NdHalfUnder25,
        required this.odds2NdHalfUnder35,
        required this.oddsBtts1StHalfYes,
        required this.oddsBtts1StHalfNo,
        required this.oddsBtts2NdHalfYes,
        required this.oddsBtts2NdHalfNo,
        required this.overallGoalCount,
        required this.htGoalsTeamA,
        required this.htGoalsTeamB,
        required this.goals2HgTeamA,
        required this.goals2HgTeamB,
        required this.goalCount2Hg,
        required this.htGoalCount,
        required this.dateUnix,
        required this.winningTeam,
        required this.noHomeAway,
        required this.bttsPotential,
        required this.bttsFhgPotential,
        required this.btts2HgPotential,
        required this.goalTimingDisabled,
        required this.attendance,
        required this.cornerTimingsRecorded,
        required this.cardTimingsRecorded,
        required this.teamAFhCorners,
        required this.teamBFhCorners,
        required this.teamA2HCorners,
        required this.teamB2HCorners,
        required this.cornerFhCount,
        required this.corner2HCount,
        required this.teamAFhCards,
        required this.teamBFhCards,
        required this.teamA2HCards,
        required this.teamB2HCards,
        required this.totalFhCards,
        required this.total2HCards,
        required this.attacksRecorded,
        required this.teamADangerousAttacks,
        required this.teamBDangerousAttacks,
        required this.teamAAttacks,
        required this.teamBAttacks,
        required this.teamAXg,
        required this.teamBXg,
        required this.totalXg,
        required this.teamAPenaltiesWon,
        required this.teamBPenaltiesWon,
        required this.teamAPenaltyGoals,
        required this.teamBPenaltyGoals,
        required this.teamAPenaltyMissed,
        required this.teamBPenaltyMissed,
        required this.pensRecorded,
        required this.goalTimingsRecorded,
        required this.teamA010MinGoals,
        required this.teamB010MinGoals,
        required this.teamACorners010Min,
        required this.teamBCorners010Min,
        required this.teamACards010Min,
        required this.teamBCards010Min,
        required this.throwinsRecorded,
        required this.teamAThrowins,
        required this.teamBThrowins,
        required this.freekicksRecorded,
        required this.teamAFreekicks,
        required this.teamBFreekicks,
        required this.goalkicksRecorded,
        required this.teamAGoalkicks,
        required this.teamBGoalkicks,
        required this.o45Potential,
        required this.o35Potential,
        required this.o25Potential,
        required this.o15Potential,
        required this.o05Potential,
        required this.o15HtPotential,
        required this.o05HtPotential,
        required this.o052HPotential,
        required this.o152HPotential,
        required this.cornersPotential,
        required this.offsidesPotential,
        required this.cardsPotential,
        required this.avgPotential,
        required this.homeUrl,
        required this.homeImage,
        required this.homeName,
        required this.awayUrl,
        required this.awayImage,
        required this.awayName,
        required this.homePpg,
        required this.awayPpg,
        required this.preMatchHomePpg,
        required this.preMatchAwayPpg,
        required this.preMatchTeamAOverallPpg,
        required this.preMatchTeamBOverallPpg,
        required this.u45Potential,
        required this.u35Potential,
        required this.u25Potential,
        required this.u15Potential,
        required this.u05Potential,
        required this.cornersO85Potential,
        required this.cornersO95Potential,
        required this.cornersO105Potential,
        required this.teamAXgPrematch,
        required this.teamBXgPrematch,
        required this.totalXgPrematch,
        required this.matchUrl,
        required this.competitionId,
        required this.matchesCompletedMinimum,
        required this.lineups,
        required this.bench,
        required this.teamAGoalDetails,
        required this.teamBGoalDetails,
        required this.trends,
        required this.homeGoalsTimings,
        required this.awayGoalsTimings,
        required this.teamACardDetails,
        required this.teamBCardDetails,
        required this.h2H,
        required this.tvStations,
        required this.weather,
        required this.gptEn,
        required this.gptInt,
        required this.oddsComparison,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        homeId: json["homeID"],
        awayId: json["awayID"],
        season: json["season"],
        status: json["status"],
        roundId: json["roundID"],
        gameWeek: json["game_week"],
        revisedGameWeek: json["revised_game_week"],
        homeGoals: List<dynamic>.from(json["homeGoals"].map((x) => x)),
        awayGoals: List<dynamic>.from(json["awayGoals"].map((x) => x)),
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
        stadiumName: json["stadium_name"],
        stadiumLocation: json["stadium_location"],
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
        odds2NdHalfUnder35: json["odds_2nd_half_under35"]?.toDouble(),
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
        homeUrl: json["home_url"],
        homeImage: json["home_image"],
        homeName: json["home_name"],
        awayUrl: json["away_url"],
        awayImage: json["away_image"],
        awayName: json["away_name"],
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
        teamAXgPrematch: json["team_a_xg_prematch"]?.toDouble(),
        teamBXgPrematch: json["team_b_xg_prematch"]?.toDouble(),
        totalXgPrematch: json["total_xg_prematch"]?.toDouble(),
        matchUrl: json["match_url"],
        competitionId: json["competition_id"],
        matchesCompletedMinimum: json["matches_completed_minimum"],
        lineups: Bench.fromJson(json["lineups"]),
        bench: Bench.fromJson(json["bench"]),
        teamAGoalDetails: List<dynamic>.from(json["team_a_goal_details"].map((x) => x)),
        teamBGoalDetails: List<dynamic>.from(json["team_b_goal_details"].map((x) => x)),
        trends: json["trends"],
        homeGoalsTimings: List<dynamic>.from(json["homeGoals_timings"].map((x) => x)),
        awayGoalsTimings: List<dynamic>.from(json["awayGoals_timings"].map((x) => x)),
        teamACardDetails: List<dynamic>.from(json["team_a_card_details"].map((x) => x)),
        teamBCardDetails: List<dynamic>.from(json["team_b_card_details"].map((x) => x)),
        h2H: H2H.fromJson(json["h2h"]),
        tvStations: List<String>.from(json["tv_stations"].map((x) => x)),
        weather: Weather.fromJson(json["weather"]),
        gptEn: json["gpt_en"],
        gptInt: GptInt.fromJson(json["gpt_int"]),
        oddsComparison: OddsComparison.fromJson(json["odds_comparison"]),
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
        "homeGoals": List<dynamic>.from(homeGoals.map((x) => x)),
        "awayGoals": List<dynamic>.from(awayGoals.map((x) => x)),
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
        "lineups": lineups.toJson(),
        "bench": bench.toJson(),
        "team_a_goal_details": List<dynamic>.from(teamAGoalDetails.map((x) => x)),
        "team_b_goal_details": List<dynamic>.from(teamBGoalDetails.map((x) => x)),
        "trends": trends,
        "homeGoals_timings": List<dynamic>.from(homeGoalsTimings.map((x) => x)),
        "awayGoals_timings": List<dynamic>.from(awayGoalsTimings.map((x) => x)),
        "team_a_card_details": List<dynamic>.from(teamACardDetails.map((x) => x)),
        "team_b_card_details": List<dynamic>.from(teamBCardDetails.map((x) => x)),
        "h2h": h2H.toJson(),
        "tv_stations": List<dynamic>.from(tvStations.map((x) => x)),
        "weather": weather.toJson(),
        "gpt_en": gptEn,
        "gpt_int": gptInt.toJson(),
        "odds_comparison": oddsComparison.toJson(),
    };
}

class Bench {
    List<dynamic> teamA;
    List<dynamic> teamB;

    Bench({
        required this.teamA,
        required this.teamB,
    });

    factory Bench.fromJson(Map<String, dynamic> json) => Bench(
        teamA: List<dynamic>.from(json["team_a"].map((x) => x)),
        teamB: List<dynamic>.from(json["team_b"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "team_a": List<dynamic>.from(teamA.map((x) => x)),
        "team_b": List<dynamic>.from(teamB.map((x) => x)),
    };
}

class GptInt {
    String es;
    String pt;
    String tr;
    String de;
    String fr;
    String ja;
    String it;
    String se;
    String ru;
    String kr;
    String nl;
    String dk;
    String no;
    String cz;
    String gr;
    String pl;
    String ro;
    String id;
    String hr;
    String th;
    String fi;
    String vn;
    String zht;
    String cn;
    String bg;

    GptInt({
        required this.es,
        required this.pt,
        required this.tr,
        required this.de,
        required this.fr,
        required this.ja,
        required this.it,
        required this.se,
        required this.ru,
        required this.kr,
        required this.nl,
        required this.dk,
        required this.no,
        required this.cz,
        required this.gr,
        required this.pl,
        required this.ro,
        required this.id,
        required this.hr,
        required this.th,
        required this.fi,
        required this.vn,
        required this.zht,
        required this.cn,
        required this.bg,
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
    int teamAId;
    int teamBId;
    Map<String, int> previousMatchesResults;
    Map<String, int> bettingStats;
    List<dynamic> previousMatchesIds;

    H2H({
        required this.teamAId,
        required this.teamBId,
        required this.previousMatchesResults,
        required this.bettingStats,
        required this.previousMatchesIds,
    });

    factory H2H.fromJson(Map<String, dynamic> json) => H2H(
        teamAId: json["team_a_id"],
        teamBId: json["team_b_id"],
        previousMatchesResults: Map.from(json["previous_matches_results"]).map((k, v) => MapEntry<String, int>(k, v)),
        bettingStats: Map.from(json["betting_stats"]).map((k, v) => MapEntry<String, int>(k, v)),
        previousMatchesIds: List<dynamic>.from(json["previous_matches_ids"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "team_a_id": teamAId,
        "team_b_id": teamBId,
        "previous_matches_results": Map.from(previousMatchesResults).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "betting_stats": Map.from(bettingStats).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "previous_matches_ids": List<dynamic>.from(previousMatchesIds.map((x) => x)),
    };
}

class OddsComparison {
    The2NdHalfGoals the2NdHalfGoals;
    GoalsOverUnder goalsOverUnder;
    SecondHalfResult secondHalfResult;
    FtResult ftResult;
    BothTeamsToScore bothTeamsToScore;
    Corners corners;
    The1StHalfGoals the1StHalfGoals;
    HalfTimeResult halfTimeResult;
    Corners1X2 corners1X2;
    BothTeamsToScoreInHalf bothTeamsToScoreIn1StHalf;
    DoubleChance doubleChance;
    BothTeamsToScoreInHalf bothTeamsToScoreIn2NdHalf;
    Map<String, CornerMatchBet> cornerMatchBet;

    OddsComparison({
        required this.the2NdHalfGoals,
        required this.goalsOverUnder,
        required this.secondHalfResult,
        required this.ftResult,
        required this.bothTeamsToScore,
        required this.corners,
        required this.the1StHalfGoals,
        required this.halfTimeResult,
        required this.corners1X2,
        required this.bothTeamsToScoreIn1StHalf,
        required this.doubleChance,
        required this.bothTeamsToScoreIn2NdHalf,
        required this.cornerMatchBet,
    });

    factory OddsComparison.fromJson(Map<String, dynamic> json) => OddsComparison(
        the2NdHalfGoals: The2NdHalfGoals.fromJson(json["2nd Half Goals"]),
        goalsOverUnder: GoalsOverUnder.fromJson(json["Goals Over/Under"]),
        secondHalfResult: SecondHalfResult.fromJson(json["Second Half Result"]),
        ftResult: FtResult.fromJson(json["FT Result"]),
        bothTeamsToScore: BothTeamsToScore.fromJson(json["Both Teams To Score"]),
        corners: Corners.fromJson(json["Corners"]),
        the1StHalfGoals: The1StHalfGoals.fromJson(json["1st Half Goals"]),
        halfTimeResult: HalfTimeResult.fromJson(json["Half Time Result"]),
        corners1X2: Corners1X2.fromJson(json["Corners 1X2"]),
        bothTeamsToScoreIn1StHalf: BothTeamsToScoreInHalf.fromJson(json["Both Teams to Score in 1st Half"]),
        doubleChance: DoubleChance.fromJson(json["Double Chance"]),
        bothTeamsToScoreIn2NdHalf: BothTeamsToScoreInHalf.fromJson(json["Both Teams to Score in 2nd Half"]),
        cornerMatchBet: Map.from(json["Corner Match Bet"]).map((k, v) => MapEntry<String, CornerMatchBet>(k, CornerMatchBet.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "2nd Half Goals": the2NdHalfGoals.toJson(),
        "Goals Over/Under": goalsOverUnder.toJson(),
        "Second Half Result": secondHalfResult.toJson(),
        "FT Result": ftResult.toJson(),
        "Both Teams To Score": bothTeamsToScore.toJson(),
        "Corners": corners.toJson(),
        "1st Half Goals": the1StHalfGoals.toJson(),
        "Half Time Result": halfTimeResult.toJson(),
        "Corners 1X2": corners1X2.toJson(),
        "Both Teams to Score in 1st Half": bothTeamsToScoreIn1StHalf.toJson(),
        "Double Chance": doubleChance.toJson(),
        "Both Teams to Score in 2nd Half": bothTeamsToScoreIn2NdHalf.toJson(),
        "Corner Match Bet": Map.from(cornerMatchBet).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class BothTeamsToScore {
    AwayClass no;
    AwayClass yes;

    BothTeamsToScore({
        required this.no,
        required this.yes,
    });

    factory BothTeamsToScore.fromJson(Map<String, dynamic> json) => BothTeamsToScore(
        no: AwayClass.fromJson(json["No"]),
        yes: AwayClass.fromJson(json["Yes"]),
    );

    Map<String, dynamic> toJson() => {
        "No": no.toJson(),
        "Yes": yes.toJson(),
    };
}

class AwayClass {
    String bet365;
    String the888Sport;
    String williamHill;
    String unibet;
    String the188Bet;
    String pinnacle;
    String the10Bet;
    String? the1Xbet;
    String? sbo;

    AwayClass({
        required this.bet365,
        required this.the888Sport,
        required this.williamHill,
        required this.unibet,
        required this.the188Bet,
        required this.pinnacle,
        required this.the10Bet,
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
    BothTeamsToScoreIn1StHalfNo yes;
    BothTeamsToScoreIn1StHalfNo no;

    BothTeamsToScoreInHalf({
        required this.yes,
        required this.no,
    });

    factory BothTeamsToScoreInHalf.fromJson(Map<String, dynamic> json) => BothTeamsToScoreInHalf(
        yes: BothTeamsToScoreIn1StHalfNo.fromJson(json["Yes"]),
        no: BothTeamsToScoreIn1StHalfNo.fromJson(json["No"]),
    );

    Map<String, dynamic> toJson() => {
        "Yes": yes.toJson(),
        "No": no.toJson(),
    };
}

class BothTeamsToScoreIn1StHalfNo {
    String the10Bet;
    String bet365;

    BothTeamsToScoreIn1StHalfNo({
        required this.the10Bet,
        required this.bet365,
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
    String bet365;

    CornerMatchBet({
        required this.bet365,
    });

    factory CornerMatchBet.fromJson(Map<String, dynamic> json) => CornerMatchBet(
        bet365: json["bet365"],
    );

    Map<String, dynamic> toJson() => {
        "bet365": bet365,
    };
}

class Corners {
    Over115 over75;
    Over105 over85;
    Over105 under85;
    Over105 over95;
    Over105 under95;
    Over105 over105;
    Over105 under105;
    Over115 under75;
    Over115 over115;
    Over115 under115;

    Corners({
        required this.over75,
        required this.over85,
        required this.under85,
        required this.over95,
        required this.under95,
        required this.over105,
        required this.under105,
        required this.under75,
        required this.over115,
        required this.under115,
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
        "Over 7.5": over75.toJson(),
        "Over 8.5": over85.toJson(),
        "Under 8.5": under85.toJson(),
        "Over 9.5": over95.toJson(),
        "Under 9.5": under95.toJson(),
        "Over 10.5": over105.toJson(),
        "Under 10.5": under105.toJson(),
        "Under 7.5": under75.toJson(),
        "Over 11.5": over115.toJson(),
        "Under 11.5": under115.toJson(),
    };
}

class Over105 {
    String the1Xbet;
    String unibet;
    String pinnacle;

    Over105({
        required this.the1Xbet,
        required this.unibet,
        required this.pinnacle,
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
    String the1Xbet;
    String unibet;

    Over115({
        required this.the1Xbet,
        required this.unibet,
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
    Over115 away;
    Over115 home;
    Over115 draw;

    Corners1X2({
        required this.away,
        required this.home,
        required this.draw,
    });

    factory Corners1X2.fromJson(Map<String, dynamic> json) => Corners1X2(
        away: Over115.fromJson(json["Away"]),
        home: Over115.fromJson(json["Home"]),
        draw: Over115.fromJson(json["Draw"]),
    );

    Map<String, dynamic> toJson() => {
        "Away": away.toJson(),
        "Home": home.toJson(),
        "Draw": draw.toJson(),
    };
}

class DoubleChance {
    DrawAway homeDraw;
    DrawAway homeAway;
    DrawAway drawAway;

    DoubleChance({
        required this.homeDraw,
        required this.homeAway,
        required this.drawAway,
    });

    factory DoubleChance.fromJson(Map<String, dynamic> json) => DoubleChance(
        homeDraw: DrawAway.fromJson(json["Home/Draw"]),
        homeAway: DrawAway.fromJson(json["Home/Away"]),
        drawAway: DrawAway.fromJson(json["Draw/Away"]),
    );

    Map<String, dynamic> toJson() => {
        "Home/Draw": homeDraw.toJson(),
        "Home/Away": homeAway.toJson(),
        "Draw/Away": drawAway.toJson(),
    };
}

class DrawAway {
    String williamHill;
    String unibet;
    String the1Xbet;
    String pinnacle;
    String the888Sport;
    String the10Bet;
    String sbo;

    DrawAway({
        required this.williamHill,
        required this.unibet,
        required this.the1Xbet,
        required this.pinnacle,
        required this.the888Sport,
        required this.the10Bet,
        required this.sbo,
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
    Away away;
    Away home;
    Away draw;

    FtResult({
        required this.away,
        required this.home,
        required this.draw,
    });

    factory FtResult.fromJson(Map<String, dynamic> json) => FtResult(
        away: Away.fromJson(json["Away"]),
        home: Away.fromJson(json["Home"]),
        draw: Away.fromJson(json["Draw"]),
    );

    Map<String, dynamic> toJson() => {
        "Away": away.toJson(),
        "Home": home.toJson(),
        "Draw": draw.toJson(),
    };
}

class Away {
    String ladbrokes;
    String williamHill;
    String unibet;
    String hkjc;
    String melBet;
    String pinnacle;
    String interwetten;
    String mansionBet;
    String betfair;
    String dafabet;
    String sbo;
    String bwin;
    String the1Xbet;
    String the10Bet;
    String the188Bet;
    String cloudBet;
    String the888Sport;
    String bet365;

    Away({
        required this.ladbrokes,
        required this.williamHill,
        required this.unibet,
        required this.hkjc,
        required this.melBet,
        required this.pinnacle,
        required this.interwetten,
        required this.mansionBet,
        required this.betfair,
        required this.dafabet,
        required this.sbo,
        required this.bwin,
        required this.the1Xbet,
        required this.the10Bet,
        required this.the188Bet,
        required this.cloudBet,
        required this.the888Sport,
        required this.bet365,
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
    Over25 over45;
    Over25 over35;
    Over25 under45;
    Over25 under35;
    Over over15;
    Over25 under15;
    Over25 over25;
    Over25 under25;
    Over over05;
    Over25 under05;

    GoalsOverUnder({
        required this.over45,
        required this.over35,
        required this.under45,
        required this.under35,
        required this.over15,
        required this.under15,
        required this.over25,
        required this.under25,
        required this.over05,
        required this.under05,
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
        "Over 4.5": over45.toJson(),
        "Over 3.5": over35.toJson(),
        "Under 4.5": under45.toJson(),
        "Under 3.5": under35.toJson(),
        "Over 1.5": over15.toJson(),
        "Under 1.5": under15.toJson(),
        "Over 2.5": over25.toJson(),
        "Under 2.5": under25.toJson(),
        "Over 0.5": over05.toJson(),
        "Under 0.5": under05.toJson(),
    };
}

class Over {
    String the888Sport;
    String the1Xbet;
    String the10Bet;
    String? unibet;

    Over({
        required this.the888Sport,
        required this.the1Xbet,
        required this.the10Bet,
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
    String the888Sport;
    String the1Xbet;
    String? pinnacle;
    String the10Bet;
    String? bet365;
    String? williamHill;

    Over25({
        this.unibet,
        required this.the888Sport,
        required this.the1Xbet,
        this.pinnacle,
        required this.the10Bet,
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
    AwayClass home;
    AwayClass draw;
    AwayClass away;

    HalfTimeResult({
        required this.home,
        required this.draw,
        required this.away,
    });

    factory HalfTimeResult.fromJson(Map<String, dynamic> json) => HalfTimeResult(
        home: AwayClass.fromJson(json["Home"]),
        draw: AwayClass.fromJson(json["Draw"]),
        away: AwayClass.fromJson(json["Away"]),
    );

    Map<String, dynamic> toJson() => {
        "Home": home.toJson(),
        "Draw": draw.toJson(),
        "Away": away.toJson(),
    };
}

class SecondHalfResult {
    Over25 home;
    Over25 draw;
    Over25 away;

    SecondHalfResult({
        required this.home,
        required this.draw,
        required this.away,
    });

    factory SecondHalfResult.fromJson(Map<String, dynamic> json) => SecondHalfResult(
        home: Over25.fromJson(json["Home"]),
        draw: Over25.fromJson(json["Draw"]),
        away: Over25.fromJson(json["Away"]),
    );

    Map<String, dynamic> toJson() => {
        "Home": home.toJson(),
        "Draw": draw.toJson(),
        "Away": away.toJson(),
    };
}

class The1StHalfGoals {
    The1StHalfGoalsOver05 under15;
    The1StHalfGoalsOver05 over25;
    The1StHalfGoalsOver05 under25;
    The1StHalfGoalsOver05 over15;
    The1StHalfGoalsOver05 over05;
    The1StHalfGoalsOver05 under05;

    The1StHalfGoals({
        required this.under15,
        required this.over25,
        required this.under25,
        required this.over15,
        required this.over05,
        required this.under05,
    });

    factory The1StHalfGoals.fromJson(Map<String, dynamic> json) => The1StHalfGoals(
        under15: The1StHalfGoalsOver05.fromJson(json["Under 1.5"]),
        over25: The1StHalfGoalsOver05.fromJson(json["Over 2.5"]),
        under25: The1StHalfGoalsOver05.fromJson(json["Under 2.5"]),
        over15: The1StHalfGoalsOver05.fromJson(json["Over 1.5"]),
        over05: The1StHalfGoalsOver05.fromJson(json["Over 0.5"]),
        under05: The1StHalfGoalsOver05.fromJson(json["Under 0.5"]),
    );

    Map<String, dynamic> toJson() => {
        "Under 1.5": under15.toJson(),
        "Over 2.5": over25.toJson(),
        "Under 2.5": under25.toJson(),
        "Over 1.5": over15.toJson(),
        "Over 0.5": over05.toJson(),
        "Under 0.5": under05.toJson(),
    };
}

class The1StHalfGoalsOver05 {
    String the1Xbet;
    String? the10Bet;
    String williamHill;
    String? unibet;

    The1StHalfGoalsOver05({
        required this.the1Xbet,
        this.the10Bet,
        required this.williamHill,
        this.unibet,
    });

    factory The1StHalfGoalsOver05.fromJson(Map<String, dynamic> json) => The1StHalfGoalsOver05(
        the1Xbet: json["1xbet"],
        the10Bet: json["10Bet"],
        williamHill: json["WilliamHill"],
        unibet: json["Unibet"],
    );

    Map<String, dynamic> toJson() => {
        "1xbet": the1Xbet,
        "10Bet": the10Bet,
        "WilliamHill": williamHill,
        "Unibet": unibet,
    };
}

class The2NdHalfGoals {
    The2NdHalfGoalsOver05 over25;
    The2NdHalfGoalsOver05 under25;
    The2NdHalfGoalsOver05 over05;
    The2NdHalfGoalsOver05 under15;
    The2NdHalfGoalsOver05 under05;
    The2NdHalfGoalsOver05 over15;

    The2NdHalfGoals({
        required this.over25,
        required this.under25,
        required this.over05,
        required this.under15,
        required this.under05,
        required this.over15,
    });

    factory The2NdHalfGoals.fromJson(Map<String, dynamic> json) => The2NdHalfGoals(
        over25: The2NdHalfGoalsOver05.fromJson(json["Over 2.5"]),
        under25: The2NdHalfGoalsOver05.fromJson(json["Under 2.5"]),
        over05: The2NdHalfGoalsOver05.fromJson(json["Over 0.5"]),
        under15: The2NdHalfGoalsOver05.fromJson(json["Under 1.5"]),
        under05: The2NdHalfGoalsOver05.fromJson(json["Under 0.5"]),
        over15: The2NdHalfGoalsOver05.fromJson(json["Over 1.5"]),
    );

    Map<String, dynamic> toJson() => {
        "Over 2.5": over25.toJson(),
        "Under 2.5": under25.toJson(),
        "Over 0.5": over05.toJson(),
        "Under 1.5": under15.toJson(),
        "Under 0.5": under05.toJson(),
        "Over 1.5": over15.toJson(),
    };
}

class The2NdHalfGoalsOver05 {
    String williamHill;
    String the1Xbet;
    String the888Sport;
    String? unibet;

    The2NdHalfGoalsOver05({
        required this.williamHill,
        required this.the1Xbet,
        required this.the888Sport,
        this.unibet,
    });

    factory The2NdHalfGoalsOver05.fromJson(Map<String, dynamic> json) => The2NdHalfGoalsOver05(
        williamHill: json["WilliamHill"],
        the1Xbet: json["1xbet"],
        the888Sport: json["888Sport"],
        unibet: json["Unibet"],
    );

    Map<String, dynamic> toJson() => {
        "WilliamHill": williamHill,
        "1xbet": the1Xbet,
        "888Sport": the888Sport,
        "Unibet": unibet,
    };
}

class Weather {
    int id;
    int fixtureId;
    int venueId;
    FeelsLike temperature;
    FeelsLike feelsLike;
    Wind wind;
    String humidity;
    int pressure;
    String clouds;
    String description;
    String icon;
    String type;
    String metric;
    dynamic current;

    Weather({
        required this.id,
        required this.fixtureId,
        required this.venueId,
        required this.temperature,
        required this.feelsLike,
        required this.wind,
        required this.humidity,
        required this.pressure,
        required this.clouds,
        required this.description,
        required this.icon,
        required this.type,
        required this.metric,
        required this.current,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        fixtureId: json["fixture_id"],
        venueId: json["venue_id"],
        temperature: FeelsLike.fromJson(json["temperature"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        wind: Wind.fromJson(json["wind"]),
        humidity: json["humidity"],
        pressure: json["pressure"],
        clouds: json["clouds"],
        description: json["description"],
        icon: json["icon"],
        type: json["type"],
        metric: json["metric"],
        current: json["current"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fixture_id": fixtureId,
        "venue_id": venueId,
        "temperature": temperature.toJson(),
        "feels_like": feelsLike.toJson(),
        "wind": wind.toJson(),
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
    double day;
    double morning;
    double evening;
    double night;

    FeelsLike({
        required this.day,
        required this.morning,
        required this.evening,
        required this.night,
    });

    factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"]?.toDouble(),
        morning: json["morning"]?.toDouble(),
        evening: json["evening"]?.toDouble(),
        night: json["night"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "morning": morning,
        "evening": evening,
        "night": night,
    };
}

class Wind {
    double speed;
    int direction;

    Wind({
        required this.speed,
        required this.direction,
    });

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        direction: json["direction"],
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "direction": direction,
    };
}

class Metadata {
    String requestLimit;
    String requestRemaining;
    String requestResetMessage;

    Metadata({
        required this.requestLimit,
        required this.requestRemaining,
        required this.requestResetMessage,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        requestLimit: json["request_limit"],
        requestRemaining: json["request_remaining"],
        requestResetMessage: json["request_reset_message"],
    );

    Map<String, dynamic> toJson() => {
        "request_limit": requestLimit,
        "request_remaining": requestRemaining,
        "request_reset_message": requestResetMessage,
    };
}

class Pager {
    int currentPage;
    int maxPage;
    int resultsPerPage;
    int totalResults;

    Pager({
        required this.currentPage,
        required this.maxPage,
        required this.resultsPerPage,
        required this.totalResults,
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