part of 'services.dart';

class AuthCServices{

  static FirebaseAuth auth = FirebaseAuth.instance;
  static Reference ref;
  static UploadTask uploadTask;

  static Future<String> signUp(String email, String password, String namaC, String lokasi) async{
    await Firebase.initializeApp();
    String msg = "";
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);

      UserC userC = result.user.convertToUser();

      auth.signOut();
      await UserServices.updateUser(userC);
      msg = "success";

    }catch(e){
      msg = e.toString();
    }

    return msg;
  }

}