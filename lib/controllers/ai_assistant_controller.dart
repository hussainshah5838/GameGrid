import 'package:game_grid/services/gemini_repository.dart';
import 'package:get/get.dart';

enum ChatRole { user, assistant }

class AiMessage {
  AiMessage({required this.role, required this.text});
  final ChatRole role;
  final String text;
}

class AiAssistantController extends GetxController {
  AiAssistantController({GeminiRepository? repository})
      : _repository = repository ?? GeminiRepository();

  final GeminiRepository _repository;
  final RxList<AiMessage> messages = <AiMessage>[
    AiMessage(
      role: ChatRole.assistant,
      text:
          'I am GG. Ask me about football stats, recent form, or betting angles.',
    ),
  ].obs;

  final RxBool isSending = false.obs;
  final RxString error = ''.obs;

  Future<void> sendMessage(String value) async {
    final prompt = value.trim();
    if (prompt.isEmpty || isSending.value) return;

    messages.add(AiMessage(role: ChatRole.user, text: prompt));
    isSending.value = true;
    error.value = '';

    try {
      final reply = await _repository.askForFootballStats(prompt);
      messages.add(AiMessage(role: ChatRole.assistant, text: reply));
    } catch (e) {
      error.value = e.toString();
      messages.add(
        AiMessage(
          role: ChatRole.assistant,
          text:
              'I hit a snag fetching the stats. Please try again in a moment.',
        ),
      );
    } finally {
      isSending.value = false;
    }
  }

  void resetConversation() {
    _repository.resetConversation();
    messages.assignAll([
      AiMessage(
        role: ChatRole.assistant,
        text:
            'I am GG. Ask me about football stats, recent form, or betting angles.',
      ),
    ]);
  }
}
