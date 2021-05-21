part of 'servicesA.dart';

class UserAServices {
  static CollectionReference userAollection =
      FirebaseFirestore.instance.collection("userA");
  static DocumentReference userADoc;
  static Reference ref;
  static UploadTask uploadTask;
  static String imageUrl;

  static Future<void> updateUser(UserA userA) async {
    userAollection.doc(userA.uid).set({
      'uid': userA.uid,
      'email': userA.email,
      'namaA': userA.namaA,
      'lokasi': userA.lokasi,
      'ttlahir': userA.ttlahir,
      'gender': userA.gender,
      'agama': userA.agama,
      'hobby': userA.hobby,
      'spendidikan': userA.spendidikan,
      'skills': userA.skills,
      'pbekerja': userA.pbekerja,
      'profileApplicant': userA.profileApplicant,
      'role' : userA.role,
    });
  }

  static Future<bool> editApplicant(UserA user) async {
    await Firebase.initializeApp();
    await userAollection.doc(user.uid).update({
      'namaA': user.namaA,
      'lokasi': user.lokasi,
      'ttlahir': user.ttlahir,
      'gender': user.gender,
      'agama': user.agama,
      'hobby': user.hobby,
      'spendidikan': user.spendidikan,
      'skills': user.skills,
      'pbekerja': user.pbekerja,
      'profileApplicant': user.profileApplicant ?? "",
    });
    return true;
  }

  static Future updateProfileApplicant(String uid, PickedFile imageFile) async {
    String fileName = uid + ".png";

    ref = FirebaseStorage.instance
        .ref()
        .child('assets/profileApplicant')
        .child(fileName);
    uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(
        () => ref.getDownloadURL().then((value) => imageUrl = value));
    return userAollection
        .doc(uid)
        .update({
          'profileApplicant': imageUrl,
        })
        .then((value) => true)
        .catchError((onError) => false);
  }

  static Future<DocumentSnapshot> getUser(String uid) async{
    await Firebase.initializeApp();
    DocumentSnapshot snapshot;
    var data = await UserAServices.userAollection.doc(uid).get();
    snapshot = data;
    return snapshot;
  }
}
