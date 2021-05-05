import 'dart:io';

import 'package:carikerja/models/modelsC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class JobServices {
  static Reference ref;
  static UploadTask uploadTask;
  static String imgUrl;
  static CollectionReference joblistCollection =
      FirebaseFirestore.instance.collection("joblist");
  static DocumentReference jobDoc;

  final uid = FirebaseAuth.instance.currentUser.uid;
  final db = FirebaseFirestore.instance;

  User _auth = FirebaseAuth.instance.currentUser;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("userA");
  String id,
      email,
      name,
      hobby,
      lokai,
      agama,
      kerja,
      pendidikan,
      ttl,
      skill,
      images;

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      id = event.data()['uid'];
      email = event.data()['email'];
      images = event.data()['profileApplicant'];
      name = event.data()['namaA'];
      lokai = event.data()['lokasi'];
      ttl = event.data()['ttlahir'];
      agama = event.data()['agama'];
      hobby = event.data()['hobby'];
      pendidikan = event.data()['spendidikan'];
      skill = event.data()['skills'];
      kerja = event.data()['pbekerja'];
    });
  }

  static Future<bool> editJoblist(Joblist joblist) async {
    await Firebase.initializeApp();

    await joblistCollection.doc(joblist.id).update(
      {
        'judul': joblist.judul,
        'deskripsi': joblist.deskripsi,
        'gaji': joblist.gaji
      },
    );

    return true;
  }

  static Future<bool> highlightJobList(Joblist joblist) async {
    await Firebase.initializeApp();

    await joblistCollection.doc(joblist.id).update(
      {'highlight': "1", 'code': joblist.code},
    );

    return true;
  }

  static Future<bool> addjoblist(Joblist joblist, PickedFile imgFile) async {
    await Firebase.initializeApp();

    jobDoc = await joblistCollection.add(
      {
        'id': "",
        'judul': joblist.judul,
        'gaji': joblist.gaji,
        'deskripsi': joblist.deskripsi,
        'kontak': joblist.kontak,
        'penempatan': joblist.penempatan,
        'image': "",
        'owner': FirebaseAuth.instance.currentUser.uid,
        'highlight': "0",
        'code': "",
        'imageH': "",
      },
    );

    if (jobDoc.id != null) {
      //upload foto
      ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(jobDoc.id + ".png");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(
        () => ref.getDownloadURL().then(
              (value) => imgUrl = value,
            ),
      );

      joblistCollection.doc(jobDoc.id).update({
        'id': jobDoc.id,
        'image': imgUrl,
      });

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteJoblist(Joblist joblist) async {
    await Firebase.initializeApp();

    await joblistCollection.doc(joblist.id).delete();

    return true;
  }
}
