import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/controllers/ai_assistant_controller.dart';
import 'package:game_grid/view/screens/gpt/gpt_drawer.dart';
import 'package:game_grid/view/screens/gpt/select_casino.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_dialog_widget.dart';
import 'package:game_grid/view/widget/custom_switch_tile_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class GptChatScreen extends StatefulWidget {
  const GptChatScreen({super.key});

  @override
  State<GptChatScreen> createState() => _GptChatScreenState();
}

class _GptChatScreenState extends State<GptChatScreen> {
  final TextEditingController _controller = TextEditingController();
  late final AiAssistantController _aiController;

  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _aiController = Get.put(AiAssistantController());
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    _controller.clear();
    _aiController.sendMessage(text);
  }

  @override
  void dispose() {
    _controller.dispose();
    Get.delete<AiAssistantController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        key: _key,
        drawer: GptDrawer(),
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(
          title: 'AI Assistant',
          leadingWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _key.currentState?.openDrawer();
                },
                child: Image.asset(Assets.imagesGptDrawer, height: 40),
              ),
            ],
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(Assets.imagesClose, height: 24),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                final messages = _aiController.messages;
                final isSending = _aiController.isSending.value;
                final itemCount = messages.length + (isSending ? 1 : 0);
                return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: AppSizes.DEFAULT,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index >= messages.length) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(right: 60, bottom: 12),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1.0,
                              color: kSecondaryColor,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 14,
                                width: 14,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: kPrimaryColor,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Analyzing football stats...',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 14,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    final msg = messages[index];
                    final isUser = msg.role == ChatRole.user;
                    return Align(
                      alignment: isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                          isUser ? 60 : 0,
                          0,
                          isUser ? 0 : 60,
                          12,
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isUser ? kFillColor : kSecondaryColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1.0,
                            color: isUser ? kBorderColor : kSecondaryColor,
                          ),
                        ),
                        child: Text(
                          msg.text,
                          style: TextStyle(
                            color: isUser ? kTertiaryColor : kPrimaryColor,
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Obx(() {
              final error = _aiController.error.value;
              if (error.isEmpty) return SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  error,
                  style: TextStyle(
                    color: kRedColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                spacing: 8,
                children: List.generate(2, (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        index == 0
                            ? Get.bottomSheet(
                                _NotifyMe(),
                                isScrollControlled: true,
                              )
                            : Get.to(() => SelectCasino());
                      },
                      child: Container(
                        height: 42,
                        decoration: BoxDecoration(
                          color: index == 1
                              ? kSecondaryColor.withValues(alpha: 0.1)
                              : kFillColor,
                          border: Border.all(
                            width: 1.0,
                            color: index == 1 ? kSecondaryColor : kBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: MyText(
                            text: index == 0 ? 'Notify me' : 'Place it',
                            color: index == 1
                                ? kSecondaryColor
                                : kTertiaryColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Container(
              padding: AppSizes.DEFAULT,
              decoration: BoxDecoration(
                color: kFillColor,
                border: Border(
                  top: BorderSide(color: kBorderColor, width: 1.0),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kFillColor,
                        border: Border.all(width: 1.0, color: kBorderColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: _controller,
                        cursorColor: kTertiaryColor,
                        style: TextStyle(
                          color: kTertiaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.Satoshi,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type here...',
                          hintStyle: TextStyle(
                            color: kTertiaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.Satoshi,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,

                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Image.asset(Assets.imagesSend, height: 44),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotifyMe extends StatefulWidget {
  @override
  State<_NotifyMe> createState() => _NotifyMeState();
}

class _NotifyMeState extends State<_NotifyMe> {
  bool notifyGame = true;
  bool notifyPlayer = false;
  bool notifyAllGames = true;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      image: Assets.imagesEnableNotifications,
      title: 'Enable Notifications',
      subTitle:
          'Do you want to enable notifications for this match. This will set a reminder for you when the match starts.',
      actionButtons: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          CustomSwitchTile(
            title: 'Enable Notifications for this game',
            value: notifyGame,
            onChanged: (value) {
              setState(() {
                notifyGame = value;
              });
            },
          ),
          Container(
            height: 1,
            color: kBorderColor,
            margin: EdgeInsets.symmetric(vertical: 14),
          ),
          CustomSwitchTile(
            title: 'Enable Notifications for Lamine Yamal',
            value: notifyPlayer,
            onChanged: (value) {
              setState(() {
                notifyPlayer = value;
              });
            },
          ),
          Container(
            height: 1,
            color: kBorderColor,
            margin: EdgeInsets.symmetric(vertical: 14),
          ),
          CustomSwitchTile(
            title: 'Enable Notifications for every game',
            value: notifyAllGames,
            onChanged: (value) {
              setState(() {
                notifyAllGames = value;
              });
            },
          ),
          Container(
            height: 1,
            color: kBorderColor,
            margin: EdgeInsets.symmetric(vertical: 14),
          ),
          MyButton(
            buttonText: 'Done',
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
