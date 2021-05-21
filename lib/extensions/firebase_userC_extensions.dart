import 'package:carikerja/models/modelsC.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserCExtension on User {
  UserC convertToUser(
          {String namaC = "No Name", String lokasi = "No Location", String role = "2"}) =>
      UserC(this.uid, this.email, namaC: namaC, lokasi: lokasi, role: role);
}
