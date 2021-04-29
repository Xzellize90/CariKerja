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
          .convertToUser(namaC: namaC, lokasi: lokasi, status: "Company");

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

    await FirebaseFirestore.instance.collection("userAuth").doc(email).set(
      {'email': email, 'password': password, 'role': "1"},
    );
    return true;
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();

    print(FirebaseFirestore.instance.collection("userAuth").get());

    String msg = "Success";
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => msg = "success",
          );
    } catch (e) {
      msg = e.toString();
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
