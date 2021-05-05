part of 'servicesC.dart';

class HighlightsServices {
  static Reference ref;
  static UploadTask uploadTask;
  static String imgUrl;
  static CollectionReference joblistCollection =
      FirebaseFirestore.instance.collection("joblist");
  static DocumentReference jobDoc;
  static String imageUrl;

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

  static Future updateHighlight(String uid, PickedFile imageFile) async {
    String fileName = uid + ".png";

    ref = FirebaseStorage.instance
        .ref()
        .child('assets/profileApplicant')
        .child(fileName);
    uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(
        () => ref.getDownloadURL().then((value) => imageUrl = value));
    return joblistCollection
        .doc(uid)
        .update({
          'profileApplicant': imageUrl,
        })
        .then((value) => true)
        .catchError((onError) => false);
  }
}
