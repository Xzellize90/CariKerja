part of 'servicesC.dart';

class AuthCServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Reference ref;
  static UploadTask uploadTask;

  static DocumentReference userDoc;

  Future<String> getCurrentUID() async {
    return (auth.currentUser).uid;
  }

  static Future<String> signUp(
      String email, String password, String namaC, String lokasi) async {
    await Firebase.initializeApp();
    String msg = "";
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserC userC = result.user
          .convertToUser(namaC: namaC, lokasi: lokasi, role: "2");

      auth.signOut();
      await UserCServices.updateUser(userC);
      msg = "success";
    } catch (e) {
      msg = e.toString();
    }

    return msg;
  }

  static Future<bool> addUserC(String email, String password) async {
    await Firebase.initializeApp();

    userDoc = await FirebaseFirestore.instance.collection("userAuth").add(
      {'uid': "", 'email': email, 'password': password, 'role': "2"},
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
      DocumentSnapshot snapshot = await UserCServices.getUser(uid);
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
