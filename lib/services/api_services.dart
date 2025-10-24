
import 'package:http/http.dart' as http;

import '../model/football_scores_model.dart';

class ApiService {
  // Base URL for all API calls
  static const String _baseUrl = "http://www.goalserve.com/getfeed/f21daf115aeb4dbc39ed08ddad4f0258";


  Future<FootballApiResponse> fetchFootballScores() async {
    // Construct the final URL
    final String endpoint = "/football/d-2?json=1";
    final Uri url = Uri.parse(_baseUrl + endpoint);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        return footballApiResponseFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception that the UI can catch.
        throw Exception('Failed to load scores. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any network or parsing errors
      throw Exception('Failed to fetch data: $e');
    }
  }
}