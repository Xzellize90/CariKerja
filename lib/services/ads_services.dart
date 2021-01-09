import 'dart:io';

import 'package:carikerja/models/adslist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AdsService {
  static CollectionReference adsCollection =
      FirebaseFirestore.instance.collection("adss");
  static DocumentReference adsDoc;

  //setup firestore storage
  static Reference ref;
  static UploadTask uploadTask;

  static String imgUrl;

  static Future<bool> addads(AdsList ads, PickedFile imgFile) async {
    await Firebase.initializeApp();
    adsDoc = await adsCollection.add({
      'id': "",
      'name': ads.name,
      'description': ads.description,
      'link': ads.link,
      'image': "",
    });

    if (adsDoc.id != null) {
      ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(adsDoc.id + ".png");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(() => ref.getDownloadURL().then(
            (value) => imgUrl = value,
          ));

      adsCollection.doc(adsDoc.id).update({
        'id': adsDoc.id,
        'image': imgUrl,
      });
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> editads(AdsList ads) async {
    await Firebase.initializeApp();

    await adsCollection.doc(ads.id).update(
      {
        'name': ads.name,
        'description': ads.description,
        'link': ads.link
      },
    );

    return true;
  }

  static Future<bool> deleteads(AdsList ads) async {
    await Firebase.initializeApp();

    await adsCollection.doc(ads.id).delete();

    return true;
  }
}