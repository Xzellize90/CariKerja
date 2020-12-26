part of 'servicesA.dart';

class AuthAServices{

  static FirebaseAuth auth = FirebaseAuth.instance;
  static Reference ref;
  static UploadTask uploadTask;

  static Future<String> signUp(String email, String password, String namaA, String lokasi, String ttlahir, String agama, String hobby, String spendidikan, String skills, String pbekerja) async{
    await Firebase.initializeApp();
    String msg = "";
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);

      UserA userA = result.user.convertToUser(namaA: namaA, lokasi: lokasi, ttlahir: ttlahir, agama: agama, hobby: hobby, spndidikan: spendidikan, skills: skills, pbekerja: pbekerja);

      auth.signOut();
      await UserAServices.updateUser(userA);
      msg = "success";

    }catch(e){
      msg = e.toString();
    }

    return msg;
  }

  static Future<String> signIn(String email, String password) async{
    await Firebase.initializeApp();
    String msg = "Success";
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password).whenComplete(() => msg = "success",);
    }catch(e){
      msg=e.toString();
    }
    return msg;
  }

  static Future<bool> signout() async{
    bool result = false;
    await auth.signOut().whenComplete(() => 
      result = true,
    );
    return result;
  }

}
