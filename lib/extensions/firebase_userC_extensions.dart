import 'package:carikerja/models/modelsC.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserCExtension on User {
  UserC convertToUser(
          {String namaC = "No Name", String lokasi = "No Location", String status = "Company"}) =>
      UserC(this.uid, this.email, namaC: namaC, lokasi: lokasi, status: status);
}
