import 'package:game_grid/config/helper/logger.dart';
import 'package:game_grid/model/league_list_model.dart';
import 'package:game_grid/model/league_team_model.dart';
import 'package:game_grid/model/team_league_model.dart';
import 'package:game_grid/services/api_services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TrendsController extends GetxController {
  final ApiService _apiService = ApiService();

  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  /// 👇 make sure this is the *response* type, not just `Data`
  final Rxn<LeagueDetailsModel> leagueDetails = Rxn<LeagueDetailsModel>();

  final RxList<LeagueListItem> leagues = <LeagueListItem>[].obs;
  final Rxn<LeagueListItem> selectedLeague = Rxn<LeagueListItem>();
  final RxString selectedSeasonId = ''.obs;
  final RxList<LeagueTeam> leagueTeams = <LeagueTeam>[].obs;

  num? _asNum(dynamic value) {
    if (value == null) return null;
    if (value is num) return value;
    if (value is String) return num.tryParse(value);
    return null;
  }

  Future<void> fetchLeagues({String? country}) async {
    error.value = '';
    try {
      final result = await _apiService.fetchLeagueList(country: country);

      if (result == null || result.data == null) {
        error.value = result?.message ?? 'No leagues found';
        leagues.clear();
        return;
      }

      leagues.assignAll(result.data);

      if (leagues.isNotEmpty) {
        selectLeague(leagues.first);
      } else {
        error.value = result.message ?? 'No leagues found';
      }
    } catch (e, st) {
      error.value = 'Something went wrong while loading leagues';
      prettyLogger('fetchLeagues error: $e\n$st');
    }
  }

  void selectLeague(LeagueListItem league, {int? seasonIndex}) {
    selectedLeague.value = league;

    final seasons = league.seasons;
    if (seasons.isEmpty) {
      selectedSeasonId.value = '';
      leagueDetails.value = null;
      return;
    }

    final index =
        seasonIndex != null && seasonIndex >= 0 && seasonIndex < seasons.length
            ? seasonIndex
            : 0;

    final id = seasons[index].id?.toString() ?? '';
    selectedSeasonId.value = id;

    if (id.isNotEmpty) {
      fetchLeagueSeason(id);
      fetchLeagueTeams(id);
    } else {
      leagueDetails.value = null;
      leagueTeams.clear();
    }
  }

  Future<void> fetchLeagueSeason(String seasonId) async {
    if (seasonId.isEmpty) {
      error.value = 'Season id missing';
      return;
    }

    isLoading.value = true;
    error.value = '';
    leagueDetails.value = null;

    try {
      final result = await _apiService.fetchLeagueSeason(seasonId);

      // ⭐️ main fixes here
      if (result == null) {
        error.value = 'No response received from server';
        return;
      }

      if (result.data == null) {
        error.value = result.message ?? 'No league data returned';
        return;
      }

      // Only assign if data is present
      leagueDetails.value = result;
    } catch (e, st) {
      error.value = 'Something went wrong while loading league data';
      prettyLogger('fetchLeagueSeason error: $e\n$st');
      leagueDetails.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchLeagueTeams(String seasonId) async {
    if (seasonId.isEmpty) {
      return;
    }
    try {
      final result = await _apiService.fetchLeagueTeams(seasonId);
      final teams = result?.data ?? [];
      leagueTeams.assignAll(teams);
      await _hydrateTeamStats();
    } catch (e, st) {
      prettyLogger('fetchLeagueTeams error: $e\n$st');
      leagueTeams.clear();
    }
  }

  Future<void> _hydrateTeamStats() async {
    if (leagueTeams.isEmpty) return;

    final List<LeagueTeam> enriched = [];
    // Only pull for the first few to avoid hammering the API.
    final targets = leagueTeams.take(8).toList();

    for (final team in targets) {
      var updated = team;
      final id = team.id;
      if (id != null) {
        try {
          final payload = await _apiService.fetchTeamStats(id);
          final stats = payload?['stats'] as Map<String, dynamic>?;
          if (stats != null) {
            updated = team.copyWith(
              h2h: _asNum(stats['winPercentage_overall']),
              l5: _asNum(stats['seasonOver05Percentage_overall']),
              l10: _asNum(stats['seasonOver15Percentage_overall']),
              l20: _asNum(stats['seasonOver25Percentage_overall']),
              over2425: _asNum(stats['seasonOver35Percentage_overall']),
              over2325: _asNum(stats['seasonOver45Percentage_overall']),
            );
          }
        } catch (e, st) {
          prettyLogger('hydrateTeamStats error for $id: $e\n$st');
        }
      }
      enriched.add(updated);
    }

    // Preserve ordering; append any remaining teams that weren't hydrated.
    if (leagueTeams.length > enriched.length) {
      enriched.addAll(leagueTeams.skip(enriched.length));
    }
    leagueTeams.assignAll(enriched);
  }
}
