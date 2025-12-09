import 'package:game_grid/config/helper/logger.dart';
import 'package:game_grid/model/player_details_model.dart';
import 'package:game_grid/services/api_services.dart';
import 'package:get/get.dart';

class PlayerDetailsController extends GetxController {
  final ApiService _apiService = ApiService();

  final Rxn<PlayerDetailsModel> playerDetails = Rxn<PlayerDetailsModel>();
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  Future<void> fetchPlayerDetails(String playerId) async {
    isLoading.value = true;
    error.value = '';
    playerDetails.value = null;
    try {
      final response = await _apiService.fetchPlayerDetails(playerId);
      playerDetails.value = response;
      if (response?.data == null) {
        error.value = response?.message ?? 'Player data unavailable';
      }
    } catch (e) {
      error.value = e.toString();
      playerDetails.value = null;
      prettyLogger(e);
    } finally {
      isLoading.value = false;
    }
  }
}
