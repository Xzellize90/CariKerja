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
      'agama': userA.agama,
      'hobby': userA.hobby,
      'spendidikan': userA.spendidikan,
      'skills': userA.skills,
      'pbekerja': userA.pbekerja,
      'profileApplicant': userA.profileApplicant ?? ""
    });
  }

  static Future<bool> editProduct(UserA user) async {
    await Firebase.initializeApp();
    await userAollection.doc(user.uid).update({
      'namaA': user.namaA,
    });
    return true;
  }

  static Future updateProfileCompany(String uid, PickedFile imageFile) async {
    String fileName = uid + ".png";
    ref = FirebaseStorage.instance
        .ref()
        .child('assets/profileCompany')
        .child(fileName);
    uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(
        () => ref.getDownloadURL().then((value) => imageUrl = value));
    return userAollection
        .doc(uid)
        .update({
          'profileCompany': imageUrl,
        })
        .then((value) => true)
        .catchError((onError) => false);
  }
}
