part of 'servicesA.dart';

class AuthAServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Reference ref;
  static UploadTask uploadTask;
  static DocumentReference userDoc;

  static Future<String> signUp(
      String email,
      String password,
      String namaA,
      String lokasi,
      String ttlahir,
      String gender,
      String agama,
      String hobby,
      String spendidikan,
      String skills,
      String pbekerja) async {
    await Firebase.initializeApp();
    String msg = "";
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserA userA = result.user.convertToUser(
          namaA: namaA,
          lokasi: lokasi,
          ttlahir: ttlahir,
          gender: gender,
          agama: agama,
          hobby: hobby,
          spndidikan: spendidikan,
          skills: skills,
          pbekerja: pbekerja,
          role: "1");

      auth.signOut();
      await UserAServices.updateUser(userA);
      msg = "success";
    } catch (e) {
      msg = e.toString();
    }

    return msg;
  }

  static Future<bool> addUserA(String email, String password) async {
    await Firebase.initializeApp();

    userDoc = await FirebaseFirestore.instance.collection("userAuth").add(
      {'uid': "", 'email': email, 'password': password, 'role': "1"},
    );

    if (userDoc.id != null) {
      FirebaseFirestore.instance.collection("userAuth").doc(userDoc.id).update({
        'uid': userDoc.id,
      });

      return true;
    } else {
      return false;
    }
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();

    String msg = "";
    String uid;
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      uid = result.user.uid;
      DocumentSnapshot snapshot = await UserAServices.getUser(uid);
      msg = snapshot.data()['role'].toString();
    } catch (e) {
      msg = "No Permission";
    }
    return msg;
  }

  static Future<bool> signout() async {
    bool result = false;
    await auth.signOut().whenComplete(
          () => result = true,
        );
    return result;
  }
}
