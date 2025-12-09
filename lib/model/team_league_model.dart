// To parse this JSON data, do
//
//     final leagueDetailsModel = leagueDetailsModelFromJson(jsonString);

import 'dart:convert';

LeagueDetailsModel leagueDetailsModelFromJson(String str) =>
    LeagueDetailsModel.fromJson(json.decode(str));

String leagueDetailsModelToJson(LeagueDetailsModel data) =>
    json.encode(data.toJson());

class LeagueDetailsModel {
  bool success;
  Pager pager;
  Metadata metadata;
  Data data;
  String message;

  LeagueDetailsModel({
    required this.success,
    required this.pager,
    required this.metadata,
    required this.data,
    required this.message,
  });

  factory LeagueDetailsModel.fromJson(Map<String, dynamic> json) =>
      LeagueDetailsModel(
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
  DbEnglishName name;
  DbEnglishName englishName;
  String nameJp;
  String nameTr;
  String nameKr;
  DbEnglishName namePt;
  String nameRu;
  DbEnglishName nameEs;
  DbEnglishName nameSe;
  DbEnglishName nameDe;
  String nameZht;
  DbEnglishName nameNl;
  DbEnglishName nameIt;
  DbEnglishName nameFr;
  DbEnglishName nameId;
  DbEnglishName namePl;
  String nameGr;
  DbEnglishName nameDk;
  String nameTh;
  String nameHr;
  DbEnglishName nameRo;
  String nameIn;
  DbEnglishName nameNo;
  String nameHu;
  DbEnglishName nameCz;
  String nameCn;
  String nameAra;
  dynamic nameSi;
  String nameVn;
  String nameMy;
  DbEnglishName nameSk;
  String nameRs;
  dynamic nameUa;
  String nameBg;
  dynamic nameLv;
  dynamic nameGe;
  dynamic nameSwa;
  dynamic nameKur;
  dynamic nameEe;
  dynamic nameLt;
  dynamic nameBa;
  dynamic nameBy;
  String nameFi;
  String country;
  int domesticScale;
  int internationalScale;
  String status;
  Format format;
  int division;
  dynamic noHomeAway;
  int startingYear;
  int endingYear;
  int women;
  Continent continent;
  int compMasterId;
  String image;
  int clubNum;
  Season season;
  int goalTimingDisabled;
  int totalMatches;
  int matchesCompleted;
  int canceledMatchesNum;
  int gameWeek;
  int totalGameWeek;
  int round;
  int progress;
  int totalGoals;
  int homeTeamsGoals;
  int homeTeamsConceded;
  int awayTeamsGoals;
  int awayTeamsConceded;
  double seasonAvgOverall;
  double seasonAvgHome;
  double seasonAvgAway;
  int bttsMatches;
  int seasonBttsPercentage;
  int seasonCsPercentage;
  int homeTeamsCleanSheets;
  int awayTeamsCleanSheets;
  int homeTeamsFailedToScore;
  int awayTeamsFailedToScore;
  int riskNum;
  int homeAttackAdvantagePercentage;
  int homeDefenceAdvantagePercentage;
  int homeOverallAdvantage;
  double cornersAvgOverall;
  double cornersAvgHome;
  double cornersAvgAway;
  int cornersTotalOverall;
  int cornersTotalHome;
  int cornersTotalAway;
  double cardsAvgOverall;
  double cardsAvgHome;
  double cardsAvgAway;
  int cardsTotalOverall;
  int cardsTotalHome;
  int cardsTotalAway;
  int foulsTotalOverall;
  int foulsTotalHome;
  int foulsTotalAway;
  double foulsAvgOverall;
  double foulsAvgHome;
  double foulsAvgAway;
  int shotsTotalOverall;
  int shotsTotalHome;
  int shotsTotalAway;
  double shotsAvgOverall;
  double shotsAvgHome;
  double shotsAvgAway;
  int offsidesTotalOverall;
  int offsidesTotalHome;
  int offsidesTotalAway;
  double offsidesAvgOverall;
  double offsidesAvgHome;
  double offsidesAvgAway;
  int offsidesOver05Overall;
  int offsidesOver15Overall;
  int offsidesOver25Overall;
  int offsidesOver35Overall;
  int offsidesOver45Overall;
  int offsidesOver55Overall;
  int offsidesOver65Overall;
  int over05OffsidesPercentageOverall;
  int over15OffsidesPercentageOverall;
  int over25OffsidesPercentageOverall;
  int over35OffsidesPercentageOverall;
  int over45OffsidesPercentageOverall;
  int over55OffsidesPercentageOverall;
  int over65OffsidesPercentageOverall;
  int seasonOver05PercentageOverall;
  int seasonOver15PercentageOverall;
  int seasonOver25PercentageOverall;
  int seasonOver35PercentageOverall;
  int seasonOver45PercentageOverall;
  int seasonOver55PercentageOverall;
  int seasonUnder05PercentageOverall;
  int seasonUnder15PercentageOverall;
  int seasonUnder25PercentageOverall;
  int seasonUnder35PercentageOverall;
  int seasonUnder45PercentageOverall;
  int seasonUnder55PercentageOverall;
  int cornersRecordedMatches;
  int cardsRecordedMatches;
  int offsidesRecordedMatches;
  int over65CornersOverall;
  int over75CornersOverall;
  int over85CornersOverall;
  int over95CornersOverall;
  int over105CornersOverall;
  int over115CornersOverall;
  int over125CornersOverall;
  int over135CornersOverall;
  int over145CornersOverall;
  int over65CornersPercentageOverall;
  int over75CornersPercentageOverall;
  int over85CornersPercentageOverall;
  int over95CornersPercentageOverall;
  int over105CornersPercentageOverall;
  int over115CornersPercentageOverall;
  int over125CornersPercentageOverall;
  int over135CornersPercentageOverall;
  int over145CornersPercentageOverall;
  int over05CardsOverall;
  int over15CardsOverall;
  int over25CardsOverall;
  int over35CardsOverall;
  int over45CardsOverall;
  int over55CardsOverall;
  int over65CardsOverall;
  int over75CardsOverall;
  int over05CardsPercentageOverall;
  int over15CardsPercentageOverall;
  int over25CardsPercentageOverall;
  int over35CardsPercentageOverall;
  int over45CardsPercentageOverall;
  int over55CardsPercentageOverall;
  int over65CardsPercentageOverall;
  int over75CardsPercentageOverall;
  int homeWins;
  int draws;
  int awayWins;
  int homeWinPercentage;
  int drawPercentage;
  int awayWinPercentage;
  int shotsRecordedMatches;
  int foulsRecordedMatches;
  int failedToScoreTotal;
  int cleanSheetsTotal;
  int roundFormat;
  int goalsMin0To10;
  int goalsMin11To20;
  int goalsMin21To30;
  int goalsMin31To40;
  int goalsMin41To50;
  int goalsMin51To60;
  int goalsMin61To70;
  int goalsMin71To80;
  int goalsMin81To90;
  int goalsMin0To15;
  int goalsMin16To30;
  int goalsMin31To45;
  int goalsMin46To60;
  int goalsMin61To75;
  int goalsMin76To90;
  int playerCount;
  int over05FhgNum;
  int over15FhgNum;
  int over25FhgNum;
  int over35FhgNum;
  int over05FhgPercentage;
  int over15FhgPercentage;
  int over25FhgPercentage;
  int over35FhgPercentage;
  int over052HgNum;
  int over152HgNum;
  int over252HgNum;
  int over352HgNum;
  int over052HgPercentage;
  int over152HgPercentage;
  int over252HgPercentage;
  int over352HgPercentage;
  int goalTimingsRecordedNum;
  int averageAttendance;
  int cornerTimingRecordedMatches;
  int cornersFhNum;
  int corners2HNum;
  double cornersFhAvg;
  double corners2HAvg;
  int cornersFhOver4Num;
  int corners2HOver4Num;
  int cornersFhOver4Percentage;
  int corners2HOver4Percentage;
  int cornersFhOver5Num;
  int corners2HOver5Num;
  int cornersFhOver5Percentage;
  int corners2HOver5Percentage;
  int cornersFhOver6Num;
  int corners2HOver6Num;
  int cornersFhOver6Percentage;
  int corners2HOver6Percentage;
  int attackNumRecodedMatches;
  int dangerousAttacksNum;
  int attacksNum;
  double dangerousAttacksAvg;
  double attacksAvg;
  double xgAvg;
  int possessionsRecordedMatches;
  int seasonOver05Num;
  int seasonOver15Num;
  int seasonOver25Num;
  int seasonOver35Num;
  int seasonOver45Num;
  int seasonOver55Num;
  int seasonUnder05Num;
  int seasonUnder15Num;
  int seasonUnder25Num;
  int seasonUnder35Num;
  int seasonUnder45Num;
  int seasonUnder55Num;
  String shortHand;
  DbEnglishName dbEnglishName;
  String iso;
  Format type;
  String footystatsUrl;
  List<String> seasonGoalsScoredHomeTeams;
  List<String> seasonGoalsScoredAwayTeams;
  List<String> seasonConcededHomeTeams;
  List<String> seasonConcededAwayTeams;
  List<Top> topScorers;
  List<Top> topAssists;
  List<Top> topCleanSheets;

  Data({
    required this.id,
    required this.name,
    required this.englishName,
    required this.nameJp,
    required this.nameTr,
    required this.nameKr,
    required this.namePt,
    required this.nameRu,
    required this.nameEs,
    required this.nameSe,
    required this.nameDe,
    required this.nameZht,
    required this.nameNl,
    required this.nameIt,
    required this.nameFr,
    required this.nameId,
    required this.namePl,
    required this.nameGr,
    required this.nameDk,
    required this.nameTh,
    required this.nameHr,
    required this.nameRo,
    required this.nameIn,
    required this.nameNo,
    required this.nameHu,
    required this.nameCz,
    required this.nameCn,
    required this.nameAra,
    required this.nameSi,
    required this.nameVn,
    required this.nameMy,
    required this.nameSk,
    required this.nameRs,
    required this.nameUa,
    required this.nameBg,
    required this.nameLv,
    required this.nameGe,
    required this.nameSwa,
    required this.nameKur,
    required this.nameEe,
    required this.nameLt,
    required this.nameBa,
    required this.nameBy,
    required this.nameFi,
    required this.country,
    required this.domesticScale,
    required this.internationalScale,
    required this.status,
    required this.format,
    required this.division,
    required this.noHomeAway,
    required this.startingYear,
    required this.endingYear,
    required this.women,
    required this.continent,
    required this.compMasterId,
    required this.image,
    required this.clubNum,
    required this.season,
    required this.goalTimingDisabled,
    required this.totalMatches,
    required this.matchesCompleted,
    required this.canceledMatchesNum,
    required this.gameWeek,
    required this.totalGameWeek,
    required this.round,
    required this.progress,
    required this.totalGoals,
    required this.homeTeamsGoals,
    required this.homeTeamsConceded,
    required this.awayTeamsGoals,
    required this.awayTeamsConceded,
    required this.seasonAvgOverall,
    required this.seasonAvgHome,
    required this.seasonAvgAway,
    required this.bttsMatches,
    required this.seasonBttsPercentage,
    required this.seasonCsPercentage,
    required this.homeTeamsCleanSheets,
    required this.awayTeamsCleanSheets,
    required this.homeTeamsFailedToScore,
    required this.awayTeamsFailedToScore,
    required this.riskNum,
    required this.homeAttackAdvantagePercentage,
    required this.homeDefenceAdvantagePercentage,
    required this.homeOverallAdvantage,
    required this.cornersAvgOverall,
    required this.cornersAvgHome,
    required this.cornersAvgAway,
    required this.cornersTotalOverall,
    required this.cornersTotalHome,
    required this.cornersTotalAway,
    required this.cardsAvgOverall,
    required this.cardsAvgHome,
    required this.cardsAvgAway,
    required this.cardsTotalOverall,
    required this.cardsTotalHome,
    required this.cardsTotalAway,
    required this.foulsTotalOverall,
    required this.foulsTotalHome,
    required this.foulsTotalAway,
    required this.foulsAvgOverall,
    required this.foulsAvgHome,
    required this.foulsAvgAway,
    required this.shotsTotalOverall,
    required this.shotsTotalHome,
    required this.shotsTotalAway,
    required this.shotsAvgOverall,
    required this.shotsAvgHome,
    required this.shotsAvgAway,
    required this.offsidesTotalOverall,
    required this.offsidesTotalHome,
    required this.offsidesTotalAway,
    required this.offsidesAvgOverall,
    required this.offsidesAvgHome,
    required this.offsidesAvgAway,
    required this.offsidesOver05Overall,
    required this.offsidesOver15Overall,
    required this.offsidesOver25Overall,
    required this.offsidesOver35Overall,
    required this.offsidesOver45Overall,
    required this.offsidesOver55Overall,
    required this.offsidesOver65Overall,
    required this.over05OffsidesPercentageOverall,
    required this.over15OffsidesPercentageOverall,
    required this.over25OffsidesPercentageOverall,
    required this.over35OffsidesPercentageOverall,
    required this.over45OffsidesPercentageOverall,
    required this.over55OffsidesPercentageOverall,
    required this.over65OffsidesPercentageOverall,
    required this.seasonOver05PercentageOverall,
    required this.seasonOver15PercentageOverall,
    required this.seasonOver25PercentageOverall,
    required this.seasonOver35PercentageOverall,
    required this.seasonOver45PercentageOverall,
    required this.seasonOver55PercentageOverall,
    required this.seasonUnder05PercentageOverall,
    required this.seasonUnder15PercentageOverall,
    required this.seasonUnder25PercentageOverall,
    required this.seasonUnder35PercentageOverall,
    required this.seasonUnder45PercentageOverall,
    required this.seasonUnder55PercentageOverall,
    required this.cornersRecordedMatches,
    required this.cardsRecordedMatches,
    required this.offsidesRecordedMatches,
    required this.over65CornersOverall,
    required this.over75CornersOverall,
    required this.over85CornersOverall,
    required this.over95CornersOverall,
    required this.over105CornersOverall,
    required this.over115CornersOverall,
    required this.over125CornersOverall,
    required this.over135CornersOverall,
    required this.over145CornersOverall,
    required this.over65CornersPercentageOverall,
    required this.over75CornersPercentageOverall,
    required this.over85CornersPercentageOverall,
    required this.over95CornersPercentageOverall,
    required this.over105CornersPercentageOverall,
    required this.over115CornersPercentageOverall,
    required this.over125CornersPercentageOverall,
    required this.over135CornersPercentageOverall,
    required this.over145CornersPercentageOverall,
    required this.over05CardsOverall,
    required this.over15CardsOverall,
    required this.over25CardsOverall,
    required this.over35CardsOverall,
    required this.over45CardsOverall,
    required this.over55CardsOverall,
    required this.over65CardsOverall,
    required this.over75CardsOverall,
    required this.over05CardsPercentageOverall,
    required this.over15CardsPercentageOverall,
    required this.over25CardsPercentageOverall,
    required this.over35CardsPercentageOverall,
    required this.over45CardsPercentageOverall,
    required this.over55CardsPercentageOverall,
    required this.over65CardsPercentageOverall,
    required this.over75CardsPercentageOverall,
    required this.homeWins,
    required this.draws,
    required this.awayWins,
    required this.homeWinPercentage,
    required this.drawPercentage,
    required this.awayWinPercentage,
    required this.shotsRecordedMatches,
    required this.foulsRecordedMatches,
    required this.failedToScoreTotal,
    required this.cleanSheetsTotal,
    required this.roundFormat,
    required this.goalsMin0To10,
    required this.goalsMin11To20,
    required this.goalsMin21To30,
    required this.goalsMin31To40,
    required this.goalsMin41To50,
    required this.goalsMin51To60,
    required this.goalsMin61To70,
    required this.goalsMin71To80,
    required this.goalsMin81To90,
    required this.goalsMin0To15,
    required this.goalsMin16To30,
    required this.goalsMin31To45,
    required this.goalsMin46To60,
    required this.goalsMin61To75,
    required this.goalsMin76To90,
    required this.playerCount,
    required this.over05FhgNum,
    required this.over15FhgNum,
    required this.over25FhgNum,
    required this.over35FhgNum,
    required this.over05FhgPercentage,
    required this.over15FhgPercentage,
    required this.over25FhgPercentage,
    required this.over35FhgPercentage,
    required this.over052HgNum,
    required this.over152HgNum,
    required this.over252HgNum,
    required this.over352HgNum,
    required this.over052HgPercentage,
    required this.over152HgPercentage,
    required this.over252HgPercentage,
    required this.over352HgPercentage,
    required this.goalTimingsRecordedNum,
    required this.averageAttendance,
    required this.cornerTimingRecordedMatches,
    required this.cornersFhNum,
    required this.corners2HNum,
    required this.cornersFhAvg,
    required this.corners2HAvg,
    required this.cornersFhOver4Num,
    required this.corners2HOver4Num,
    required this.cornersFhOver4Percentage,
    required this.corners2HOver4Percentage,
    required this.cornersFhOver5Num,
    required this.corners2HOver5Num,
    required this.cornersFhOver5Percentage,
    required this.corners2HOver5Percentage,
    required this.cornersFhOver6Num,
    required this.corners2HOver6Num,
    required this.cornersFhOver6Percentage,
    required this.corners2HOver6Percentage,
    required this.attackNumRecodedMatches,
    required this.dangerousAttacksNum,
    required this.attacksNum,
    required this.dangerousAttacksAvg,
    required this.attacksAvg,
    required this.xgAvg,
    required this.possessionsRecordedMatches,
    required this.seasonOver05Num,
    required this.seasonOver15Num,
    required this.seasonOver25Num,
    required this.seasonOver35Num,
    required this.seasonOver45Num,
    required this.seasonOver55Num,
    required this.seasonUnder05Num,
    required this.seasonUnder15Num,
    required this.seasonUnder25Num,
    required this.seasonUnder35Num,
    required this.seasonUnder45Num,
    required this.seasonUnder55Num,
    required this.shortHand,
    required this.dbEnglishName,
    required this.iso,
    required this.type,
    required this.footystatsUrl,
    required this.seasonGoalsScoredHomeTeams,
    required this.seasonGoalsScoredAwayTeams,
    required this.seasonConcededHomeTeams,
    required this.seasonConcededAwayTeams,
    required this.topScorers,
    required this.topAssists,
    required this.topCleanSheets,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: _safeDbName(json["name"]),
        englishName: _safeDbName(json["english_name"]),
        nameJp: _s(json["name_jp"]),
        nameTr: _s(json["name_tr"]),
        nameKr: _s(json["name_kr"]),
        namePt: _safeDbName(json["name_pt"]),
        nameRu: _s(json["name_ru"]),
        nameEs: _safeDbName(json["name_es"]),
        nameSe: _safeDbName(json["name_se"]),
        nameDe: _safeDbName(json["name_de"]),
        nameZht: json["name_zht"],
        nameNl: _safeDbName(json["name_nl"]),
        nameIt: _safeDbName(json["name_it"]),
        nameFr: _safeDbName(json["name_fr"]),
        nameId: _safeDbName(json["name_id"]),
        namePl: _safeDbName(json["name_pl"]),
        nameGr: _s(json["name_gr"]),
        nameDk: _safeDbName(json["name_dk"]),
        nameTh: _s(json["name_th"]),
        nameHr: _s(json["name_hr"]),
        nameRo: _safeDbName(json["name_ro"]),
        nameIn: _s(json["name_in"]),
        nameNo: _safeDbName(json["name_no"]),
        nameHu: _s(json["name_hu"]),
        nameCz: _safeDbName(json["name_cz"]),
        nameCn: _s(json["name_cn"]),
        nameAra: _s(json["name_ara"]),
        nameSi: _s(json["name_si"]),
        nameVn: _s(json["name_vn"]),
        nameMy: _s(json["name_my"]),
        nameSk: _safeDbName(json["name_sk"]),
        nameRs: _s(json["name_rs"]),
        nameUa: _s(json["name_ua"]),
        nameBg: _s(json["name_bg"]),
        nameLv: _s(json["name_lv"]),
        nameGe: _s(json["name_ge"]),
        nameSwa: _s(json["name_swa"]),
        nameKur: _s(json["name_kur"]),
        nameEe: _s(json["name_ee"]),
        nameLt: _s(json["name_lt"]),
        nameBa: _s(json["name_ba"]),
        nameBy: _s(json["name_by"]),
        nameFi: _s(json["name_fi"]),
        country: _s(json["country"]),
        domesticScale: json["domestic_scale"] ?? 0,
        internationalScale: json["international_scale"] ?? 0,
        status: _s(json["status"]),
        format: formatValues.map[json["format"]] ?? Format.DOMESTIC_LEAGUE,
        division: json["division"],
        noHomeAway: json["no_home_away"],
        startingYear: json["starting_year"] ?? 0,
        endingYear: json["ending_year"] ?? 0,
        women: json["women"],
        continent: continentValues.map[json["continent"]] ?? Continent.EU,
        compMasterId: json["comp_master_id"],
        image: _s(json["image"]),
        clubNum: json["clubNum"],
        season: seasonValues.map[json["season"]] ?? Season.THE_20172018,
        goalTimingDisabled: json["goalTimingDisabled"],
        totalMatches: json["totalMatches"],
        matchesCompleted: json["matchesCompleted"],
        canceledMatchesNum: json["canceledMatchesNum"],
        gameWeek: json["game_week"],
        totalGameWeek: json["total_game_week"],
        round: json["round"],
        progress: json["progress"],
        totalGoals: json["total_goals"],
        homeTeamsGoals: json["home_teams_goals"],
        homeTeamsConceded: json["home_teams_conceded"],
        awayTeamsGoals: json["away_teams_goals"],
        awayTeamsConceded: json["away_teams_conceded"],
        seasonAvgOverall: json["seasonAVG_overall"]?.toDouble(),
        seasonAvgHome: json["seasonAVG_home"]?.toDouble(),
        seasonAvgAway: json["seasonAVG_away"]?.toDouble(),
        bttsMatches: json["btts_matches"],
        seasonBttsPercentage: json["seasonBTTSPercentage"],
        seasonCsPercentage: json["seasonCSPercentage"],
        homeTeamsCleanSheets: json["home_teams_clean_sheets"],
        awayTeamsCleanSheets: json["away_teams_clean_sheets"],
        homeTeamsFailedToScore: json["home_teams_failed_to_score"],
        awayTeamsFailedToScore: json["away_teams_failed_to_score"],
        riskNum: json["riskNum"],
        homeAttackAdvantagePercentage: json["homeAttackAdvantagePercentage"],
        homeDefenceAdvantagePercentage: json["homeDefenceAdvantagePercentage"],
        homeOverallAdvantage: json["homeOverallAdvantage"],
        cornersAvgOverall: json["cornersAVG_overall"]?.toDouble(),
        cornersAvgHome: json["cornersAVG_home"]?.toDouble(),
        cornersAvgAway: json["cornersAVG_away"]?.toDouble(),
        cornersTotalOverall: json["cornersTotal_overall"],
        cornersTotalHome: json["cornersTotal_home"],
        cornersTotalAway: json["cornersTotal_away"],
        cardsAvgOverall: json["cardsAVG_overall"]?.toDouble(),
        cardsAvgHome: json["cardsAVG_home"]?.toDouble(),
        cardsAvgAway: json["cardsAVG_away"]?.toDouble(),
        cardsTotalOverall: json["cardsTotal_overall"],
        cardsTotalHome: json["cardsTotal_home"],
        cardsTotalAway: json["cardsTotal_away"],
        foulsTotalOverall: json["foulsTotal_overall"],
        foulsTotalHome: json["foulsTotal_home"],
        foulsTotalAway: json["foulsTotal_away"],
        foulsAvgOverall: json["foulsAVG_overall"]?.toDouble(),
        foulsAvgHome: json["foulsAVG_home"]?.toDouble(),
        foulsAvgAway: json["foulsAVG_away"]?.toDouble(),
        shotsTotalOverall: json["shotsTotal_overall"],
        shotsTotalHome: json["shotsTotal_home"],
        shotsTotalAway: json["shotsTotal_away"],
        shotsAvgOverall: json["shotsAVG_overall"]?.toDouble(),
        shotsAvgHome: json["shotsAVG_home"]?.toDouble(),
        shotsAvgAway: json["shotsAVG_away"]?.toDouble(),
        offsidesTotalOverall: json["offsidesTotal_overall"],
        offsidesTotalHome: json["offsidesTotal_home"],
        offsidesTotalAway: json["offsidesTotal_away"],
        offsidesAvgOverall: json["offsidesAVG_overall"]?.toDouble(),
        offsidesAvgHome: json["offsidesAVG_home"]?.toDouble(),
        offsidesAvgAway: json["offsidesAVG_away"]?.toDouble(),
        offsidesOver05Overall: json["offsidesOver05_overall"],
        offsidesOver15Overall: json["offsidesOver15_overall"],
        offsidesOver25Overall: json["offsidesOver25_overall"],
        offsidesOver35Overall: json["offsidesOver35_overall"],
        offsidesOver45Overall: json["offsidesOver45_overall"],
        offsidesOver55Overall: json["offsidesOver55_overall"],
        offsidesOver65Overall: json["offsidesOver65_overall"],
        over05OffsidesPercentageOverall:
            json["over05OffsidesPercentage_overall"],
        over15OffsidesPercentageOverall:
            json["over15OffsidesPercentage_overall"],
        over25OffsidesPercentageOverall:
            json["over25OffsidesPercentage_overall"],
        over35OffsidesPercentageOverall:
            json["over35OffsidesPercentage_overall"],
        over45OffsidesPercentageOverall:
            json["over45OffsidesPercentage_overall"],
        over55OffsidesPercentageOverall:
            json["over55OffsidesPercentage_overall"],
        over65OffsidesPercentageOverall:
            json["over65OffsidesPercentage_overall"],
        seasonOver05PercentageOverall: json["seasonOver05Percentage_overall"],
        seasonOver15PercentageOverall: json["seasonOver15Percentage_overall"],
        seasonOver25PercentageOverall: json["seasonOver25Percentage_overall"],
        seasonOver35PercentageOverall: json["seasonOver35Percentage_overall"],
        seasonOver45PercentageOverall: json["seasonOver45Percentage_overall"],
        seasonOver55PercentageOverall: json["seasonOver55Percentage_overall"],
        seasonUnder05PercentageOverall: json["seasonUnder05Percentage_overall"],
        seasonUnder15PercentageOverall: json["seasonUnder15Percentage_overall"],
        seasonUnder25PercentageOverall: json["seasonUnder25Percentage_overall"],
        seasonUnder35PercentageOverall: json["seasonUnder35Percentage_overall"],
        seasonUnder45PercentageOverall: json["seasonUnder45Percentage_overall"],
        seasonUnder55PercentageOverall: json["seasonUnder55Percentage_overall"],
        cornersRecordedMatches: json["cornersRecorded_matches"],
        cardsRecordedMatches: json["cardsRecorded_matches"],
        offsidesRecordedMatches: json["offsidesRecorded_matches"],
        over65CornersOverall: json["over65Corners_overall"],
        over75CornersOverall: json["over75Corners_overall"],
        over85CornersOverall: json["over85Corners_overall"],
        over95CornersOverall: json["over95Corners_overall"],
        over105CornersOverall: json["over105Corners_overall"],
        over115CornersOverall: json["over115Corners_overall"],
        over125CornersOverall: json["over125Corners_overall"],
        over135CornersOverall: json["over135Corners_overall"],
        over145CornersOverall: json["over145Corners_overall"],
        over65CornersPercentageOverall: json["over65CornersPercentage_overall"],
        over75CornersPercentageOverall: json["over75CornersPercentage_overall"],
        over85CornersPercentageOverall: json["over85CornersPercentage_overall"],
        over95CornersPercentageOverall: json["over95CornersPercentage_overall"],
        over105CornersPercentageOverall:
            json["over105CornersPercentage_overall"],
        over115CornersPercentageOverall:
            json["over115CornersPercentage_overall"],
        over125CornersPercentageOverall:
            json["over125CornersPercentage_overall"],
        over135CornersPercentageOverall:
            json["over135CornersPercentage_overall"],
        over145CornersPercentageOverall:
            json["over145CornersPercentage_overall"],
        over05CardsOverall: json["over05Cards_overall"],
        over15CardsOverall: json["over15Cards_overall"],
        over25CardsOverall: json["over25Cards_overall"],
        over35CardsOverall: json["over35Cards_overall"],
        over45CardsOverall: json["over45Cards_overall"],
        over55CardsOverall: json["over55Cards_overall"],
        over65CardsOverall: json["over65Cards_overall"],
        over75CardsOverall: json["over75Cards_overall"],
        over05CardsPercentageOverall: json["over05CardsPercentage_overall"],
        over15CardsPercentageOverall: json["over15CardsPercentage_overall"],
        over25CardsPercentageOverall: json["over25CardsPercentage_overall"],
        over35CardsPercentageOverall: json["over35CardsPercentage_overall"],
        over45CardsPercentageOverall: json["over45CardsPercentage_overall"],
        over55CardsPercentageOverall: json["over55CardsPercentage_overall"],
        over65CardsPercentageOverall: json["over65CardsPercentage_overall"],
        over75CardsPercentageOverall: json["over75CardsPercentage_overall"],
        homeWins: json["homeWins"],
        draws: json["draws"],
        awayWins: json["awayWins"],
        homeWinPercentage: json["homeWinPercentage"],
        drawPercentage: json["drawPercentage"],
        awayWinPercentage: json["awayWinPercentage"],
        shotsRecordedMatches: json["shotsRecorded_matches"],
        foulsRecordedMatches: json["foulsRecorded_matches"],
        failedToScoreTotal: json["failed_to_score_total"],
        cleanSheetsTotal: json["clean_sheets_total"],
        roundFormat: json["round_format"],
        goalsMin0To10: json["goals_min_0_to_10"],
        goalsMin11To20: json["goals_min_11_to_20"],
        goalsMin21To30: json["goals_min_21_to_30"],
        goalsMin31To40: json["goals_min_31_to_40"],
        goalsMin41To50: json["goals_min_41_to_50"],
        goalsMin51To60: json["goals_min_51_to_60"],
        goalsMin61To70: json["goals_min_61_to_70"],
        goalsMin71To80: json["goals_min_71_to_80"],
        goalsMin81To90: json["goals_min_81_to_90"],
        goalsMin0To15: json["goals_min_0_to_15"],
        goalsMin16To30: json["goals_min_16_to_30"],
        goalsMin31To45: json["goals_min_31_to_45"],
        goalsMin46To60: json["goals_min_46_to_60"],
        goalsMin61To75: json["goals_min_61_to_75"],
        goalsMin76To90: json["goals_min_76_to_90"],
        playerCount: json["player_count"],
        over05FhgNum: json["over05_fhg_num"],
        over15FhgNum: json["over15_fhg_num"],
        over25FhgNum: json["over25_fhg_num"],
        over35FhgNum: json["over35_fhg_num"],
        over05FhgPercentage: json["over05_fhg_percentage"],
        over15FhgPercentage: json["over15_fhg_percentage"],
        over25FhgPercentage: json["over25_fhg_percentage"],
        over35FhgPercentage: json["over35_fhg_percentage"],
        over052HgNum: json["over05_2hg_num"],
        over152HgNum: json["over15_2hg_num"],
        over252HgNum: json["over25_2hg_num"],
        over352HgNum: json["over35_2hg_num"],
        over052HgPercentage: json["over05_2hg_percentage"],
        over152HgPercentage: json["over15_2hg_percentage"],
        over252HgPercentage: json["over25_2hg_percentage"],
        over352HgPercentage: json["over35_2hg_percentage"],
        goalTimingsRecordedNum: json["goalTimingsRecorded_num"],
        averageAttendance: json["averageAttendance"],
        cornerTimingRecordedMatches: json["cornerTimingRecorded_matches"],
        cornersFhNum: json["corners_fh_num"],
        corners2HNum: json["corners_2h_num"],
        cornersFhAvg: json["corners_fh_avg"]?.toDouble(),
        corners2HAvg: json["corners_2h_avg"]?.toDouble(),
        cornersFhOver4Num: json["corners_fh_over4_num"],
        corners2HOver4Num: json["corners_2h_over4_num"],
        cornersFhOver4Percentage: json["corners_fh_over4_percentage"],
        corners2HOver4Percentage: json["corners_2h_over4_percentage"],
        cornersFhOver5Num: json["corners_fh_over5_num"],
        corners2HOver5Num: json["corners_2h_over5_num"],
        cornersFhOver5Percentage: json["corners_fh_over5_percentage"],
        corners2HOver5Percentage: json["corners_2h_over5_percentage"],
        cornersFhOver6Num: json["corners_fh_over6_num"],
        corners2HOver6Num: json["corners_2h_over6_num"],
        cornersFhOver6Percentage: json["corners_fh_over6_percentage"],
        corners2HOver6Percentage: json["corners_2h_over6_percentage"],
        attackNumRecodedMatches: json["attack_num_recoded_matches"],
        dangerousAttacksNum: json["dangerous_attacks_num"],
        attacksNum: json["attacks_num"],
        dangerousAttacksAvg: json["dangerous_attacks_avg"]?.toDouble(),
        attacksAvg: json["attacks_avg"]?.toDouble(),
        xgAvg: json["xg_avg"]?.toDouble(),
        possessionsRecordedMatches: json["possessions_recorded_matches"],
        seasonOver05Num: json["seasonOver05_num"],
        seasonOver15Num: json["seasonOver15_num"],
        seasonOver25Num: json["seasonOver25_num"],
        seasonOver35Num: json["seasonOver35_num"],
        seasonOver45Num: json["seasonOver45_num"],
        seasonOver55Num: json["seasonOver55_num"],
        seasonUnder05Num: json["seasonUnder05_num"],
        seasonUnder15Num: json["seasonUnder15_num"],
        seasonUnder25Num: json["seasonUnder25_num"],
        seasonUnder35Num: json["seasonUnder35_num"],
        seasonUnder45Num: json["seasonUnder45_num"],
        seasonUnder55Num: json["seasonUnder55_num"],
        shortHand: _s(json["shortHand"]),
        dbEnglishName: _safeDbName(json["db_english_name"]),
        iso: _s(json["iso"]),
        type: formatValues.map[json["type"]] ?? Format.DOMESTIC_LEAGUE,
        footystatsUrl: _s(json["footystats_url"]),
        seasonGoalsScoredHomeTeams: List<String>.from(
            json["seasonGoalsScored_home_teams"].map((x) => x)),
        seasonGoalsScoredAwayTeams: List<String>.from(
            json["seasonGoalsScored_away_teams"].map((x) => x)),
        seasonConcededHomeTeams:
            List<String>.from(json["seasonConceded_home_teams"].map((x) => x)),
        seasonConcededAwayTeams:
            List<String>.from(json["seasonConceded_away_teams"].map((x) => x)),
        topScorers:
            List<Top>.from(json["top_scorers"].map((x) => Top.fromJson(x))),
        topAssists:
            List<Top>.from(json["top_assists"].map((x) => Top.fromJson(x))),
        topCleanSheets: List<Top>.from(
            json["top_clean_sheets"].map((x) => Top.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": dbEnglishNameValues.reverse[name],
        "english_name": dbEnglishNameValues.reverse[englishName],
        "name_jp": nameJp,
        "name_tr": nameTr,
        "name_kr": nameKr,
        "name_pt": dbEnglishNameValues.reverse[namePt],
        "name_ru": nameRu,
        "name_es": dbEnglishNameValues.reverse[nameEs],
        "name_se": dbEnglishNameValues.reverse[nameSe],
        "name_de": dbEnglishNameValues.reverse[nameDe],
        "name_zht": nameZht,
        "name_nl": dbEnglishNameValues.reverse[nameNl],
        "name_it": dbEnglishNameValues.reverse[nameIt],
        "name_fr": dbEnglishNameValues.reverse[nameFr],
        "name_id": dbEnglishNameValues.reverse[nameId],
        "name_pl": dbEnglishNameValues.reverse[namePl],
        "name_gr": nameGr,
        "name_dk": dbEnglishNameValues.reverse[nameDk],
        "name_th": nameTh,
        "name_hr": nameHr,
        "name_ro": dbEnglishNameValues.reverse[nameRo],
        "name_in": nameIn,
        "name_no": dbEnglishNameValues.reverse[nameNo],
        "name_hu": nameHu,
        "name_cz": dbEnglishNameValues.reverse[nameCz],
        "name_cn": nameCn,
        "name_ara": nameAra,
        "name_si": nameSi,
        "name_vn": nameVn,
        "name_my": nameMy,
        "name_sk": dbEnglishNameValues.reverse[nameSk],
        "name_rs": nameRs,
        "name_ua": nameUa,
        "name_bg": nameBg,
        "name_lv": nameLv,
        "name_ge": nameGe,
        "name_swa": nameSwa,
        "name_kur": nameKur,
        "name_ee": nameEe,
        "name_lt": nameLt,
        "name_ba": nameBa,
        "name_by": nameBy,
        "name_fi": nameFi,
        "country": country,
        "domestic_scale": domesticScale,
        "international_scale": internationalScale,
        "status": status,
        "format": formatValues.reverse[format],
        "division": division,
        "no_home_away": noHomeAway,
        "starting_year": startingYear,
        "ending_year": endingYear,
        "women": women,
        "continent": continentValues.reverse[continent],
        "comp_master_id": compMasterId,
        "image": image,
        "clubNum": clubNum,
        "season": seasonValues.reverse[season],
        "goalTimingDisabled": goalTimingDisabled,
        "totalMatches": totalMatches,
        "matchesCompleted": matchesCompleted,
        "canceledMatchesNum": canceledMatchesNum,
        "game_week": gameWeek,
        "total_game_week": totalGameWeek,
        "round": round,
        "progress": progress,
        "total_goals": totalGoals,
        "home_teams_goals": homeTeamsGoals,
        "home_teams_conceded": homeTeamsConceded,
        "away_teams_goals": awayTeamsGoals,
        "away_teams_conceded": awayTeamsConceded,
        "seasonAVG_overall": seasonAvgOverall,
        "seasonAVG_home": seasonAvgHome,
        "seasonAVG_away": seasonAvgAway,
        "btts_matches": bttsMatches,
        "seasonBTTSPercentage": seasonBttsPercentage,
        "seasonCSPercentage": seasonCsPercentage,
        "home_teams_clean_sheets": homeTeamsCleanSheets,
        "away_teams_clean_sheets": awayTeamsCleanSheets,
        "home_teams_failed_to_score": homeTeamsFailedToScore,
        "away_teams_failed_to_score": awayTeamsFailedToScore,
        "riskNum": riskNum,
        "homeAttackAdvantagePercentage": homeAttackAdvantagePercentage,
        "homeDefenceAdvantagePercentage": homeDefenceAdvantagePercentage,
        "homeOverallAdvantage": homeOverallAdvantage,
        "cornersAVG_overall": cornersAvgOverall,
        "cornersAVG_home": cornersAvgHome,
        "cornersAVG_away": cornersAvgAway,
        "cornersTotal_overall": cornersTotalOverall,
        "cornersTotal_home": cornersTotalHome,
        "cornersTotal_away": cornersTotalAway,
        "cardsAVG_overall": cardsAvgOverall,
        "cardsAVG_home": cardsAvgHome,
        "cardsAVG_away": cardsAvgAway,
        "cardsTotal_overall": cardsTotalOverall,
        "cardsTotal_home": cardsTotalHome,
        "cardsTotal_away": cardsTotalAway,
        "foulsTotal_overall": foulsTotalOverall,
        "foulsTotal_home": foulsTotalHome,
        "foulsTotal_away": foulsTotalAway,
        "foulsAVG_overall": foulsAvgOverall,
        "foulsAVG_home": foulsAvgHome,
        "foulsAVG_away": foulsAvgAway,
        "shotsTotal_overall": shotsTotalOverall,
        "shotsTotal_home": shotsTotalHome,
        "shotsTotal_away": shotsTotalAway,
        "shotsAVG_overall": shotsAvgOverall,
        "shotsAVG_home": shotsAvgHome,
        "shotsAVG_away": shotsAvgAway,
        "offsidesTotal_overall": offsidesTotalOverall,
        "offsidesTotal_home": offsidesTotalHome,
        "offsidesTotal_away": offsidesTotalAway,
        "offsidesAVG_overall": offsidesAvgOverall,
        "offsidesAVG_home": offsidesAvgHome,
        "offsidesAVG_away": offsidesAvgAway,
        "offsidesOver05_overall": offsidesOver05Overall,
        "offsidesOver15_overall": offsidesOver15Overall,
        "offsidesOver25_overall": offsidesOver25Overall,
        "offsidesOver35_overall": offsidesOver35Overall,
        "offsidesOver45_overall": offsidesOver45Overall,
        "offsidesOver55_overall": offsidesOver55Overall,
        "offsidesOver65_overall": offsidesOver65Overall,
        "over05OffsidesPercentage_overall": over05OffsidesPercentageOverall,
        "over15OffsidesPercentage_overall": over15OffsidesPercentageOverall,
        "over25OffsidesPercentage_overall": over25OffsidesPercentageOverall,
        "over35OffsidesPercentage_overall": over35OffsidesPercentageOverall,
        "over45OffsidesPercentage_overall": over45OffsidesPercentageOverall,
        "over55OffsidesPercentage_overall": over55OffsidesPercentageOverall,
        "over65OffsidesPercentage_overall": over65OffsidesPercentageOverall,
        "seasonOver05Percentage_overall": seasonOver05PercentageOverall,
        "seasonOver15Percentage_overall": seasonOver15PercentageOverall,
        "seasonOver25Percentage_overall": seasonOver25PercentageOverall,
        "seasonOver35Percentage_overall": seasonOver35PercentageOverall,
        "seasonOver45Percentage_overall": seasonOver45PercentageOverall,
        "seasonOver55Percentage_overall": seasonOver55PercentageOverall,
        "seasonUnder05Percentage_overall": seasonUnder05PercentageOverall,
        "seasonUnder15Percentage_overall": seasonUnder15PercentageOverall,
        "seasonUnder25Percentage_overall": seasonUnder25PercentageOverall,
        "seasonUnder35Percentage_overall": seasonUnder35PercentageOverall,
        "seasonUnder45Percentage_overall": seasonUnder45PercentageOverall,
        "seasonUnder55Percentage_overall": seasonUnder55PercentageOverall,
        "cornersRecorded_matches": cornersRecordedMatches,
        "cardsRecorded_matches": cardsRecordedMatches,
        "offsidesRecorded_matches": offsidesRecordedMatches,
        "over65Corners_overall": over65CornersOverall,
        "over75Corners_overall": over75CornersOverall,
        "over85Corners_overall": over85CornersOverall,
        "over95Corners_overall": over95CornersOverall,
        "over105Corners_overall": over105CornersOverall,
        "over115Corners_overall": over115CornersOverall,
        "over125Corners_overall": over125CornersOverall,
        "over135Corners_overall": over135CornersOverall,
        "over145Corners_overall": over145CornersOverall,
        "over65CornersPercentage_overall": over65CornersPercentageOverall,
        "over75CornersPercentage_overall": over75CornersPercentageOverall,
        "over85CornersPercentage_overall": over85CornersPercentageOverall,
        "over95CornersPercentage_overall": over95CornersPercentageOverall,
        "over105CornersPercentage_overall": over105CornersPercentageOverall,
        "over115CornersPercentage_overall": over115CornersPercentageOverall,
        "over125CornersPercentage_overall": over125CornersPercentageOverall,
        "over135CornersPercentage_overall": over135CornersPercentageOverall,
        "over145CornersPercentage_overall": over145CornersPercentageOverall,
        "over05Cards_overall": over05CardsOverall,
        "over15Cards_overall": over15CardsOverall,
        "over25Cards_overall": over25CardsOverall,
        "over35Cards_overall": over35CardsOverall,
        "over45Cards_overall": over45CardsOverall,
        "over55Cards_overall": over55CardsOverall,
        "over65Cards_overall": over65CardsOverall,
        "over75Cards_overall": over75CardsOverall,
        "over05CardsPercentage_overall": over05CardsPercentageOverall,
        "over15CardsPercentage_overall": over15CardsPercentageOverall,
        "over25CardsPercentage_overall": over25CardsPercentageOverall,
        "over35CardsPercentage_overall": over35CardsPercentageOverall,
        "over45CardsPercentage_overall": over45CardsPercentageOverall,
        "over55CardsPercentage_overall": over55CardsPercentageOverall,
        "over65CardsPercentage_overall": over65CardsPercentageOverall,
        "over75CardsPercentage_overall": over75CardsPercentageOverall,
        "homeWins": homeWins,
        "draws": draws,
        "awayWins": awayWins,
        "homeWinPercentage": homeWinPercentage,
        "drawPercentage": drawPercentage,
        "awayWinPercentage": awayWinPercentage,
        "shotsRecorded_matches": shotsRecordedMatches,
        "foulsRecorded_matches": foulsRecordedMatches,
        "failed_to_score_total": failedToScoreTotal,
        "clean_sheets_total": cleanSheetsTotal,
        "round_format": roundFormat,
        "goals_min_0_to_10": goalsMin0To10,
        "goals_min_11_to_20": goalsMin11To20,
        "goals_min_21_to_30": goalsMin21To30,
        "goals_min_31_to_40": goalsMin31To40,
        "goals_min_41_to_50": goalsMin41To50,
        "goals_min_51_to_60": goalsMin51To60,
        "goals_min_61_to_70": goalsMin61To70,
        "goals_min_71_to_80": goalsMin71To80,
        "goals_min_81_to_90": goalsMin81To90,
        "goals_min_0_to_15": goalsMin0To15,
        "goals_min_16_to_30": goalsMin16To30,
        "goals_min_31_to_45": goalsMin31To45,
        "goals_min_46_to_60": goalsMin46To60,
        "goals_min_61_to_75": goalsMin61To75,
        "goals_min_76_to_90": goalsMin76To90,
        "player_count": playerCount,
        "over05_fhg_num": over05FhgNum,
        "over15_fhg_num": over15FhgNum,
        "over25_fhg_num": over25FhgNum,
        "over35_fhg_num": over35FhgNum,
        "over05_fhg_percentage": over05FhgPercentage,
        "over15_fhg_percentage": over15FhgPercentage,
        "over25_fhg_percentage": over25FhgPercentage,
        "over35_fhg_percentage": over35FhgPercentage,
        "over05_2hg_num": over052HgNum,
        "over15_2hg_num": over152HgNum,
        "over25_2hg_num": over252HgNum,
        "over35_2hg_num": over352HgNum,
        "over05_2hg_percentage": over052HgPercentage,
        "over15_2hg_percentage": over152HgPercentage,
        "over25_2hg_percentage": over252HgPercentage,
        "over35_2hg_percentage": over352HgPercentage,
        "goalTimingsRecorded_num": goalTimingsRecordedNum,
        "averageAttendance": averageAttendance,
        "cornerTimingRecorded_matches": cornerTimingRecordedMatches,
        "corners_fh_num": cornersFhNum,
        "corners_2h_num": corners2HNum,
        "corners_fh_avg": cornersFhAvg,
        "corners_2h_avg": corners2HAvg,
        "corners_fh_over4_num": cornersFhOver4Num,
        "corners_2h_over4_num": corners2HOver4Num,
        "corners_fh_over4_percentage": cornersFhOver4Percentage,
        "corners_2h_over4_percentage": corners2HOver4Percentage,
        "corners_fh_over5_num": cornersFhOver5Num,
        "corners_2h_over5_num": corners2HOver5Num,
        "corners_fh_over5_percentage": cornersFhOver5Percentage,
        "corners_2h_over5_percentage": corners2HOver5Percentage,
        "corners_fh_over6_num": cornersFhOver6Num,
        "corners_2h_over6_num": corners2HOver6Num,
        "corners_fh_over6_percentage": cornersFhOver6Percentage,
        "corners_2h_over6_percentage": corners2HOver6Percentage,
        "attack_num_recoded_matches": attackNumRecodedMatches,
        "dangerous_attacks_num": dangerousAttacksNum,
        "attacks_num": attacksNum,
        "dangerous_attacks_avg": dangerousAttacksAvg,
        "attacks_avg": attacksAvg,
        "xg_avg": xgAvg,
        "possessions_recorded_matches": possessionsRecordedMatches,
        "seasonOver05_num": seasonOver05Num,
        "seasonOver15_num": seasonOver15Num,
        "seasonOver25_num": seasonOver25Num,
        "seasonOver35_num": seasonOver35Num,
        "seasonOver45_num": seasonOver45Num,
        "seasonOver55_num": seasonOver55Num,
        "seasonUnder05_num": seasonUnder05Num,
        "seasonUnder15_num": seasonUnder15Num,
        "seasonUnder25_num": seasonUnder25Num,
        "seasonUnder35_num": seasonUnder35Num,
        "seasonUnder45_num": seasonUnder45Num,
        "seasonUnder55_num": seasonUnder55Num,
        "shortHand": shortHand,
        "db_english_name": dbEnglishNameValues.reverse[dbEnglishName],
        "iso": iso,
        "type": formatValues.reverse[type],
        "footystats_url": footystatsUrl,
        "seasonGoalsScored_home_teams":
            List<dynamic>.from(seasonGoalsScoredHomeTeams.map((x) => x)),
        "seasonGoalsScored_away_teams":
            List<dynamic>.from(seasonGoalsScoredAwayTeams.map((x) => x)),
        "seasonConceded_home_teams":
            List<dynamic>.from(seasonConcededHomeTeams.map((x) => x)),
        "seasonConceded_away_teams":
            List<dynamic>.from(seasonConcededAwayTeams.map((x) => x)),
        "top_scorers": List<dynamic>.from(topScorers.map((x) => x.toJson())),
        "top_assists": List<dynamic>.from(topAssists.map((x) => x.toJson())),
        "top_clean_sheets":
            List<dynamic>.from(topCleanSheets.map((x) => x.toJson())),
      };
}

enum Continent { EU }

final continentValues = EnumValues({"eu": Continent.EU});

enum DbEnglishName { PREMIER_LEAGUE }

final dbEnglishNameValues =
    EnumValues({"Premier League": DbEnglishName.PREMIER_LEAGUE});

enum Format { DOMESTIC_LEAGUE }

final formatValues = EnumValues({"Domestic League": Format.DOMESTIC_LEAGUE});

enum Season { THE_20172018 }

final seasonValues = EnumValues({"2017/2018": Season.THE_20172018});

DbEnglishName _safeDbName(dynamic key) {
  return dbEnglishNameValues.map[key] ?? DbEnglishName.PREMIER_LEAGUE;
}

String _s(dynamic value) => value?.toString() ?? '';

class Top {
  int? id;
  int? competitionId;
  String? fullName;
  String? firstName;
  String? lastName;
  String? knownAs;
  String? shorthand;
  int? age;
  int? height;
  int? weight;
  DbEnglishName? league;
  Format? leagueType;
  Season? season;
  int? startingYear;
  int? endingYear;
  String? url;
  int? clubTeamId;
  int? clubTeam2Id;
  int? nationalTeamId;
  Position? position;
  int? minutesPlayedOverall;
  int? minutesPlayedHome;
  int? minutesPlayedAway;
  int? birthday;
  String? nationality;
  Continent? continent;
  int? appearancesOverall;
  int? appearancesHome;
  int? appearancesAway;
  int? goalsOverall;
  int? goalsHome;
  int? goalsAway;
  int? cleanSheetsHome;
  int? cleanSheetsAway;
  int? cleanSheetsOverall;
  int? concededOverall;
  int? concededHome;
  int? concededAway;
  int? assistsOverall;
  int? assistsHome;
  int? assistsAway;
  int? penaltyGoals;
  int? penaltyMisses;
  int? penaltySuccess;
  double? goalsInvolvedPer90Overall;
  double? assistsPer90Overall;
  double? goalsPer90Overall;
  int? cleanSheetsPerOverall;
  double? goalsPer90Home;
  double? goalsPer90Away;
  int? minPerGoalOverall;
  double? concededPer90Overall;
  int? minPerConcededOverall;
  int? cardsOverall;
  int? yellowCardsOverall;
  int? redCardsOverall;
  int? minPerMatch;
  int? minPerCardOverall;
  int? minPerAssistOverall;
  double? cardsPer90Overall;
  int? rankInLeagueTopAttackers;
  int? rankInLeagueTopMidfielders;
  int? rankInLeagueTopDefenders;
  int? rankInClubTopScorer;
  int? lastMatchTimestamp;

  Top({
    this.id,
    this.competitionId,
    this.fullName,
    this.firstName,
    this.lastName,
    this.knownAs,
    this.shorthand,
    this.age,
    this.height,
    this.weight,
    this.league,
    this.leagueType,
    this.season,
    this.startingYear,
    this.endingYear,
    this.url,
    this.clubTeamId,
    this.clubTeam2Id,
    this.nationalTeamId,
    this.position,
    this.minutesPlayedOverall,
    this.minutesPlayedHome,
    this.minutesPlayedAway,
    this.birthday,
    this.nationality,
    this.continent,
    this.appearancesOverall,
    this.appearancesHome,
    this.appearancesAway,
    this.goalsOverall,
    this.goalsHome,
    this.goalsAway,
    this.cleanSheetsHome,
    this.cleanSheetsAway,
    this.cleanSheetsOverall,
    this.concededOverall,
    this.concededHome,
    this.concededAway,
    this.assistsOverall,
    this.assistsHome,
    this.assistsAway,
    this.penaltyGoals,
    this.penaltyMisses,
    this.penaltySuccess,
    this.goalsInvolvedPer90Overall,
    this.assistsPer90Overall,
    this.goalsPer90Overall,
    this.cleanSheetsPerOverall,
    this.goalsPer90Home,
    this.goalsPer90Away,
    this.minPerGoalOverall,
    this.concededPer90Overall,
    this.minPerConcededOverall,
    this.cardsOverall,
    this.yellowCardsOverall,
    this.redCardsOverall,
    this.minPerMatch,
    this.minPerCardOverall,
    this.minPerAssistOverall,
    this.cardsPer90Overall,
    this.rankInLeagueTopAttackers,
    this.rankInLeagueTopMidfielders,
    this.rankInLeagueTopDefenders,
    this.rankInClubTopScorer,
    this.lastMatchTimestamp,
  });

  factory Top.fromJson(Map<String, dynamic> json) => Top(
        id: json["id"],
        competitionId: json["competition_id"],
        fullName: _s(json["full_name"]),
        firstName: _s(json["first_name"]),
        lastName: _s(json["last_name"]),
        knownAs: _s(json["known_as"]),
        shorthand: _s(json["shorthand"]),
        age: json["age"],
        height: json["height"],
        weight: json["weight"],
        league: _safeDbName(json["league"]),
        leagueType:
            formatValues.map[json["league_type"]] ?? Format.DOMESTIC_LEAGUE,
        season: seasonValues.map[json["season"]],
        startingYear: json["starting_year"],
        endingYear: json["ending_year"],
        url: _s(json["url"]),
        clubTeamId: json["club_team_id"],
        clubTeam2Id: json["club_team_2_id"],
        nationalTeamId: json["national_team_id"],
        position: positionValues.map[json["position"]],
        minutesPlayedOverall: json["minutes_played_overall"],
        minutesPlayedHome: json["minutes_played_home"],
        minutesPlayedAway: json["minutes_played_away"],
        birthday: json["birthday"],
        nationality: _s(json["nationality"]),
        continent: continentValues.map[json["continent"]],
        appearancesOverall: json["appearances_overall"],
        appearancesHome: json["appearances_home"],
        appearancesAway: json["appearances_away"],
        goalsOverall: json["goals_overall"],
        goalsHome: json["goals_home"],
        goalsAway: json["goals_away"],
        cleanSheetsHome: json["clean_sheets_home"],
        cleanSheetsAway: json["clean_sheets_away"],
        cleanSheetsOverall: json["clean_sheets_overall"],
        concededOverall: json["conceded_overall"],
        concededHome: json["conceded_home"],
        concededAway: json["conceded_away"],
        assistsOverall: json["assists_overall"],
        assistsHome: json["assists_home"],
        assistsAway: json["assists_away"],
        penaltyGoals: json["penalty_goals"],
        penaltyMisses: json["penalty_misses"],
        penaltySuccess: json["penalty_success"],
        goalsInvolvedPer90Overall:
            json["goals_involved_per_90_overall"]?.toDouble(),
        assistsPer90Overall: json["assists_per_90_overall"]?.toDouble(),
        goalsPer90Overall: json["goals_per_90_overall"]?.toDouble(),
        cleanSheetsPerOverall: json["clean_sheets_per_overall"],
        goalsPer90Home: json["goals_per_90_home"]?.toDouble(),
        goalsPer90Away: json["goals_per_90_away"]?.toDouble(),
        minPerGoalOverall: json["min_per_goal_overall"],
        concededPer90Overall: json["conceded_per_90_overall"]?.toDouble(),
        minPerConcededOverall: json["min_per_conceded_overall"],
        cardsOverall: json["cards_overall"],
        yellowCardsOverall: json["yellow_cards_overall"],
        redCardsOverall: json["red_cards_overall"],
        minPerMatch: json["min_per_match"],
        minPerCardOverall: json["min_per_card_overall"],
        minPerAssistOverall: json["min_per_assist_overall"],
        cardsPer90Overall: json["cards_per_90_overall"]?.toDouble(),
        rankInLeagueTopAttackers: json["rank_in_league_top_attackers"],
        rankInLeagueTopMidfielders: json["rank_in_league_top_midfielders"],
        rankInLeagueTopDefenders: json["rank_in_league_top_defenders"],
        rankInClubTopScorer: json["rank_in_club_top_scorer"],
        lastMatchTimestamp: json["last_match_timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "competition_id": competitionId,
        "full_name": fullName,
        "first_name": firstName,
        "last_name": lastName,
        "known_as": knownAs,
        "shorthand": shorthand,
        "age": age,
        "height": height,
        "weight": weight,
        "league": league != null ? dbEnglishNameValues.reverse[league] : null,
        "league_type":
            leagueType != null ? formatValues.reverse[leagueType] : null,
        "season": season != null ? seasonValues.reverse[season] : null,
        "starting_year": startingYear,
        "ending_year": endingYear,
        "url": url,
        "club_team_id": clubTeamId,
        "club_team_2_id": clubTeam2Id,
        "national_team_id": nationalTeamId,
        "position": position != null ? positionValues.reverse[position] : null,
        "minutes_played_overall": minutesPlayedOverall,
        "minutes_played_home": minutesPlayedHome,
        "minutes_played_away": minutesPlayedAway,
        "birthday": birthday,
        "nationality": nationality,
        "continent":
            continent != null ? continentValues.reverse[continent] : null,
        "appearances_overall": appearancesOverall,
        "appearances_home": appearancesHome,
        "appearances_away": appearancesAway,
        "goals_overall": goalsOverall,
        "goals_home": goalsHome,
        "goals_away": goalsAway,
        "clean_sheets_home": cleanSheetsHome,
        "clean_sheets_away": cleanSheetsAway,
        "clean_sheets_overall": cleanSheetsOverall,
        "conceded_overall": concededOverall,
        "conceded_home": concededHome,
        "conceded_away": concededAway,
        "assists_overall": assistsOverall,
        "assists_home": assistsHome,
        "assists_away": assistsAway,
        "penalty_goals": penaltyGoals,
        "penalty_misses": penaltyMisses,
        "penalty_success": penaltySuccess,
        "goals_involved_per_90_overall": goalsInvolvedPer90Overall,
        "assists_per_90_overall": assistsPer90Overall,
        "goals_per_90_overall": goalsPer90Overall,
        "clean_sheets_per_overall": cleanSheetsPerOverall,
        "goals_per_90_home": goalsPer90Home,
        "goals_per_90_away": goalsPer90Away,
        "min_per_goal_overall": minPerGoalOverall,
        "conceded_per_90_overall": concededPer90Overall,
        "min_per_conceded_overall": minPerConcededOverall,
        "cards_overall": cardsOverall,
        "yellow_cards_overall": yellowCardsOverall,
        "red_cards_overall": redCardsOverall,
        "min_per_match": minPerMatch,
        "min_per_card_overall": minPerCardOverall,
        "min_per_assist_overall": minPerAssistOverall,
        "cards_per_90_overall": cardsPer90Overall,
        "rank_in_league_top_attackers": rankInLeagueTopAttackers,
        "rank_in_league_top_midfielders": rankInLeagueTopMidfielders,
        "rank_in_league_top_defenders": rankInLeagueTopDefenders,
        "rank_in_club_top_scorer": rankInClubTopScorer,
        "last_match_timestamp": lastMatchTimestamp,
      };
}

enum Position { DEFENDER, FORWARD, GOALKEEPER, MIDFIELDER }

final positionValues = EnumValues({
  "Defender": Position.DEFENDER,
  "Forward": Position.FORWARD,
  "Goalkeeper": Position.GOALKEEPER,
  "Midfielder": Position.MIDFIELDER
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
