import 'dart:io';

import 'package:carikerja/models/modelsC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class JobServices {
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("joblist");
  static DocumentReference productDoc;

  static Reference ref;
  static UploadTask uploadTask;

  static String imgUrl;

  static Future<bool> addjoblist(Joblist joblist, PickedFile imgFile) async {
    await Firebase.initializeApp();

    productDoc = await productCollection.add(
      {
        'id': "",
        'judul': joblist.judul,
        'deskripsi': joblist.deskripsi,
        'kontak': joblist.kontak,
        'gaji': joblist.gaji,
        'penempatan': joblist.penempatan,
        'image': "",
      },
    );

    if (productDoc.id != null) {
      //upload foto
      ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(productDoc.id + ".png");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(
        () => ref.getDownloadURL().then(
              (value) => imgUrl = value,
            ),
      );

      productCollection.doc(productDoc.id).update({
        'id': productDoc.id,
        'image': imgUrl,
      });

      return true;
    } else {
      return false;
    }
  }
}
