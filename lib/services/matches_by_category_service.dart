import 'package:dio/dio.dart';
import 'package:game_grid/model/soccer_model.dart';
import 'package:xml/xml.dart';
import 'package:game_grid/config/helper/global_functions.dart';
import 'package:game_grid/config/helper/logger.dart';


class ApiServiceForCategory {
  static final ApiServiceForCategory instance =
      ApiServiceForCategory._internal();
  ApiServiceForCategory._internal();

  final Dio _dio = Dio();

  Future<ScoresResponse> getMatches({required String endpoint}) async {
    try {
      final response = await _dio.get("${GlobalFunctions.baseUrl}$endpoint");

      if (response.statusCode != 200) {
        throw Exception("Failed with status: ${response.statusCode}");
      }

      final rawXml = response.data.toString();
      final document = XmlDocument.parse(rawXml);
      final scoresResponse = ScoresResponse.fromXml(document);

    
      return scoresResponse;
    } catch (e) {
      prettyLogger("Error parsing XML: $e");
      throw Exception("Error fetching matches: $e");
    }
  }
}
