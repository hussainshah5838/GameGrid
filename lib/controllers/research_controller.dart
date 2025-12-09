import 'package:game_grid/config/helper/logger.dart';
import 'package:get/get.dart';
import 'package:game_grid/model/match_details_model.dart';
import 'package:game_grid/model/todays_matches_model.dart';
import 'package:game_grid/services/api_services.dart';

class ResearchController extends GetxController {
  final ApiService _apiService = ApiService();

  final RxList<Datum> matches = <Datum>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final Rxn<MatchDetailsModel> matchDetails = Rxn<MatchDetailsModel>();
  final RxBool isDetailsLoading = false.obs;
  final RxString detailsError = ''.obs;
  final RxSet<int> favoriteMatchIds = <int>{}.obs;

  @override
  void onInit() async {
    super.onInit();
   await fetchTodayMatches();
  
  }

  Future<void> fetchTodayMatches() async {
    isLoading.value = true;
    error.value = '';
    try {
      final response = await _apiService.fetchTodayMatches('todays-matches');
      final data = response?.data ?? [];
      matches.assignAll(data);
    } catch (e) {
      error.value = e.toString();
      matches.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMatchDetails({
    required String endpoint,
    required String matchId,
  }) async {
    isDetailsLoading.value = true;
    detailsError.value = '';
    matchDetails.value = null;
    try {
      final response = await _apiService.fetchMatchDetails(endpoint, matchId);
      matchDetails.value = response;
    } catch (e) {
      prettyLogger(e);
      detailsError.value = e.toString();
      matchDetails.value = null;
    } finally {
      isDetailsLoading.value = false;
    }
  }

  bool isFavorite(int matchId) => favoriteMatchIds.contains(matchId);

  void toggleFavorite(Datum match) {
    if (favoriteMatchIds.contains(match.id)) {
      favoriteMatchIds.remove(match.id);
    } else {
      favoriteMatchIds.add(match.id);
    }
    favoriteMatchIds.refresh();
  }

  List<Datum> get favoriteMatches =>
      matches.where((m) => favoriteMatchIds.contains(m.id)).toList();
}
