part of 'services.dart';

class UserServices{

  static CollectionReference userCollection = FirebaseFirestore.instance.collection("userC");
  static DocumentReference userCDoc;
  static Reference ref;
  static UploadTask uploadTask;
  static String imageUrl;

  static Future<void> updateUser(UserC userC) async{
    userCollection.doc(userC.uid).set(
      {
        'uid': userC.uid,
        'email': userC.email,
        'namaC': userC.namaC,
        'lokasi': userC.lokasi,
        'profileCompany': userC.profileCompany??""
      }
    );
  }
  static Future updateProfileCompany(String uid, PickedFile imageFile) async{
    String fileName = uid + ".png";
    ref = FirebaseStorage.instance
        .ref()
        .child('assets/profileCompany')
        .child(fileName);
    uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(
      () => ref.getDownloadURL().then((value) => imageUrl = value));
    return userCollection
        .doc(uid)
        .update({'profileCompany':imageUrl,})
        .then((value) => true)
        .catchError((onError) => false);
  }
}