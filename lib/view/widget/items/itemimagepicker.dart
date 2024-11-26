import 'package:ecommerceadmin/controller/items/additems_controller.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ItemImagePicker extends StatelessWidget {
  ItemImagePicker({super.key});
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    AddItemsController addItemsController = Get.find();
    return Column(
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundColor: AppColor.grey,
          backgroundImage: addItemsController.file != null
              ? FileImage(addItemsController.file!)
              : null,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
                onPressed: () {
                  addItemsController.chooseImageCamera();
                },
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Add Image\nfrom Camera',
                    textAlign: TextAlign.center)),
            TextButton.icon(
                onPressed: () {
                  addItemsController.chooseImageGallery();
                },
                icon: const Icon(Icons.image),
                label: const Text('Add Image\nfrom Gallery',
                    textAlign: TextAlign.center)),
          ],
        )
      ],
    );
  }
}
