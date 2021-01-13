import 'package:carikerja/models/modelsA.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserAExtension on User {
  UserA convertToUser(
          {String namaA = "No Name",
          String lokasi = "No Location",
          String ttlahir = "No Data",
          String gender = "No Data",
          String agama = "No Data",
          String hobby = "No Data",
          String spndidikan = "No Data",
          String skills = "No Data",
          String pbekerja = "No Data",
          String status = "Applicant",
          String images = "No image"}) =>
      UserA(
          this.uid,
          this.email,
          this.displayName,
          this.displayName,
          this.displayName,
          this.displayName,
          this.displayName,
          this.displayName,
          this.displayName,
          this.displayName,
          this.displayName,
          status: status,
          gender: gender
          );
}
