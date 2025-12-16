import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/controllers/auth_controllers.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/model/auth_model.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/heading_tile_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_field_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final AuthController authController = Get.find();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  Worker? _userListener;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();

    _fillControllers(authController.currentUser.value);
    _userListener =
        ever<AuthModel?>(authController.currentUser, _fillControllers);
    authController.loadCurrentUserDetails();
  }

  @override
  void dispose() {
    _userListener?.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    authController.clearProfileImage();
    super.dispose();
  }

  void _fillControllers(AuthModel? user) {
    if (user == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final nameParts = (user.name ?? '').trim().split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : '';
      final lastName =
          nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      _firstNameController.text = firstName;
      _lastNameController.text = lastName;
      _emailController.text = user.email;
    });
  }

  Future<void> _updateProfile() async {
    await authController.updateProfile(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: "Edit Profile"),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            HeadingTile(title: 'Avatar'),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kFillColor,
                border: Border.all(width: 1.0, color: kBorderColor),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.0, color: kTertiaryColor),
                    ),
                    child: Obx(() {
                      final imageFile = authController.profileImage.value;
                      final user = authController.currentUser.value;
                      final imageUrl =
                          user?.photoUrl?.isNotEmpty == true ? user!.photoUrl : null;
                      return CommonImageView(
                        height: 50,
                        width: 50,
                        radius: 100.0,
                        file: imageFile,
                        url: imageFile == null ? (imageUrl ?? dummyImg) : null,
                      );
                    }),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: "Profile Photo",
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                        MyText(
                          paddingTop: 4,
                          text: "Maximum size 20kb",
                          size: 14,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 66,
                    child: MyButton(
                      height: 32,
                      buttonText: '',
                      onTap: () {
                        authController.pickProfileImage();
                      },
                      radius: 8,
                      customChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.imagesEditIcon, height: 16),
                          MyText(
                            paddingLeft: 4,
                            paddingRight: 4,
                            text: "Edit",
                            size: 14,
                            color: kPrimaryColor,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            HeadingTile(title: 'Personal Information'),
            SizedBox(height: 12),
            MyTextField(
              controller: _firstNameController,
              labelText: "First Name",
              hintText: 'Kevin',
            ),
            MyTextField(
              controller: _lastNameController,
              labelText: "Last Name",
              hintText: 'Backer',
            ),
            MyTextField(
              controller: _emailController,
              labelText: "Email Address",
              hintText: 'Kevinbacker234@gmail.com',
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Obx(
            () => MyButton(
              buttonText: "Update",
              isLoading: authController.isUpdatingProfile.value,
              onTap: _updateProfile,
            ),
          ),
        ),
      ),
    );
  }
}
