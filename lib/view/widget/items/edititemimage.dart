// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceadmin/controller/items/edititems_controller.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class EditItemImagePicker extends StatelessWidget {
  final String oldimage;
  EditItemImagePicker({super.key, required this.oldimage});
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    EditItemsController editItemsController = Get.find();
    return Column(
      children: [
        editItemsController.file != null
            ? CircleAvatar(
                radius: 40.0,
                backgroundColor: AppColor.grey,
                backgroundImage: FileImage(editItemsController.file!))
            : CircleAvatar(
                radius: 40.0,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imagesItems}/${oldimage}",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
                onPressed: () {
                  editItemsController.chooseImageCamera();
                },
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Add Image\nfrom Camera',
                    textAlign: TextAlign.center)),
            TextButton.icon(
                onPressed: () {
                  editItemsController.chooseImageGallery();
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
