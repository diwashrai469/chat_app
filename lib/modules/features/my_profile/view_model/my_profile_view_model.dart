import 'dart:io';

import 'package:chat_app/core/services/toast_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyProfileViewModel {
  final ToastService _toastService;
  MyProfileViewModel(this._toastService);
  final firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  File? galleryFile;
  final picker = ImagePicker();

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    if (xfilePick != null) {
      galleryFile = File(pickedFile!.path);
      cropImage(galleryFile);
    } else {
      print('No image is selected');
    }
  }

  Future cropImage(File? imageFile) async {
    if (imageFile != null) {
      CroppedFile? cropped = await ImageCropper()
          .cropImage(sourcePath: imageFile.path, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ], uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop',
            cropGridColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(title: 'Crop')
      ]);

      if (cropped != null) {
        var collection = firebaseFirestore.collection('users');
        String documentId = await getCurrentUserDocumentId();

        Reference ref = FirebaseStorage.instance
            .ref()
            .child('profile_pictures/${DateTime.now().toString()}');
        UploadTask uploadTask = ref.putFile(File(cropped.path));

        await uploadTask.then((res) {
          res.ref.getDownloadURL().then((downloadUrl) {
            collection
                .doc(documentId)
                .update({'profile_picture': downloadUrl})
                .then((_) =>
                    _toastService.s("Profile picture changed sucessfully!"))
                .catchError((error) => _toastService.s(error));
          });
        });
      }
    }
  }

  Future<String> getCurrentUserDocumentId() async {
    CollectionReference collectionRef = firebaseFirestore.collection('users');

    QuerySnapshot querySnapshot = await collectionRef.get();

    List allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final filterdata = allData
        .where((element) => element['id'] == _firebaseAuth.currentUser?.uid)
        .toList();
    return filterdata.first['documentId'];
  }

  Future<List<dynamic>> getUserData() async {
    CollectionReference collectionRef = firebaseFirestore.collection('users');

    QuerySnapshot querySnapshot = await collectionRef.get();

    List allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    final filterdata = allData
        .where((element) => element['id'] == _firebaseAuth.currentUser?.uid)
        .toList();
    return filterdata;
  }
}
