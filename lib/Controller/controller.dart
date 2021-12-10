
import 'package:bunyaad/View/Model/view_variables.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:html' as web;

import 'package:image_whisperer/image_whisperer.dart';

class Controller{


  static Future<String> saveImage(web.File? temp, String name) async {
      String link = "";
     // storageRef = firebase.storage().ref();
     // FirebaseStorage fs = FirebaseStorage.instance;
      Reference storageReference = FirebaseStorage.instance.ref();
      Reference pictureFolderReference =
          storageReference.child("Pictures").child(name);
      // String base64Image=Base64Encoder().convert(temp);
      await pictureFolderReference.putBlob(temp).whenComplete(() async {
        link = await pictureFolderReference.getDownloadURL();
      });
      print("hello");
      return link;
    }
  // static Future<void> deleteImage(String oldLink) async {
  //     if (oldLink != ViewVariables.defaultImageLink) {
  //       Reference pictureReference = FirebaseStorage.instance.refFromURL(oldLink);
  //       await pictureReference.delete();
  //     }
  //   }

  static Future<void> selectImageFile({required int uploadType}) async {
    ViewVariables.file = null;
    web.FileUploadInputElement input = web.FileUploadInputElement()
      ..accept = 'image/*';
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = web.FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        ViewVariables.file = file;
        BlobImage blobImage = new BlobImage(file, name: file.name);
        if (uploadType == 1) {
          print("image uploaded blob ${blobImage.url}");
          ViewVariables.servicesImageFile = Image.network(blobImage.url);
          print(ViewVariables.servicesImageFile!.width);
        }
        // else if (uploadType == 2) {
        //   ViewVariables.addCustomerBuildingImageFile =
        //       Image.network(blobImage.url);
        //   ViewVariables.addCustomerEmployeeImageLink =
        //       blobImage.url;
        // } else if (uploadType == 3) {
        //   ViewVariables.addCustomerEmployeeImageFile =
        //       Image.network(blobImage.url);
        //   ViewVariables.addCustomerEmployeeImageLink =
        //       blobImage.url;
        // } else if (uploadType == 4) {
        //   ViewVariables.addObjectTypeImageFile = Image.network(blobImage.url);
        // }

        // ViewVariables.homeScreenRefresh!.call();
      });
    });
  }
}