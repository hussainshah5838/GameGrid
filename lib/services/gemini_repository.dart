import 'package:game_grid/config/helper/logger.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiRepository {
  GeminiRepository({GenerativeModel? model})
      : _model = model ??
            GenerativeModel(
              model: _defaultModel,
              apiKey: _apiKey,
              generationConfig:  GenerationConfig(
                maxOutputTokens: 512,
                temperature: 0.35,
              ),
            );

  static const String _apiKey =
      'AIzaSyBY3HXHhHSC3ed29oxHw9S3scK2S_oS_xc';
  static const String _defaultModel = 'gemini-2.5-flash';

  final GenerativeModel _model;
  ChatSession? _chat;

  Future<String> askForFootballStats(String prompt) async {
    final cleaned = prompt.trim();
    if (cleaned.isEmpty) {
      throw Exception('Prompt is empty');
    }

    try {
      final chat = _chat ??= _model.startChat(
        history: [
          Content.text(_systemPrompt),
        ],
      );

      final response = await chat.sendMessage(
        Content.text(_userPrompt(cleaned)),
      );

      final text = _extractText(response);
      if (text == null || text.isEmpty) {
        throw Exception('Empty response from Gemini');
      }
      return text;
    } catch (e, st) {
      prettyLogger('Gemini error: $e\n$st');
      rethrow;
    }
  }

  void resetConversation() {
    _chat = null;
  }

  static const String _systemPrompt = '''
You are GG, an assistant dedicated to football (soccer) statistics and betting insights.
If a user asks about anything outside football/soccer, politely decline and remind them you only cover football data.
Keep replies concise and focused on stats, recent form, probabilities, and match context. Avoid filler or unrelated topics.
If you lack data, say what you would need instead of guessing.''';

  static String _userPrompt(String prompt) => '''
User question: $prompt

Answer using football/soccer stats or trends only. Keep it tight (under ~120 words) and mention leagues/teams/players when helpful.''';

  String? _extractText(GenerateContentResponse response) {
    final raw = response.text?.trim();
    if (raw != null && raw.isNotEmpty) return raw;

    final candidates = response.candidates;
    if (candidates == null || candidates.isEmpty) return null;
    final candidate = candidates.first;
    if (candidate.content.parts.isEmpty) return null;

    final buffer = StringBuffer();
    for (final part in candidate.content.parts) {
      if (part is TextPart) {
        final text = part.text;
        if (text.trim().isNotEmpty) {
          buffer.write(text.trim());
          buffer.write(' ');
        }
      }
    }
    return buffer.toString().trim();
  }
}
