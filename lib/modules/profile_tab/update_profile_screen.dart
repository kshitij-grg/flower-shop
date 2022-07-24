import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/widgets/text_field.dart';
import '../../widgets/custom_button.dart';
import 'profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              InputTextField(
                  textEditingController: controller.nameController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name),
              const SizedBox(
                height: 30,
              ),
              InputTextField(
                  textEditingController: controller.emailController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 30,
              ),
              InputTextField(
                  textEditingController: controller.ageController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number),
              const SizedBox(
                height: 30,
              ),
              InputTextField(
                  textEditingController: controller.phnController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.phone),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                label: "Update Profile",
                onPress: controller.updateProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
