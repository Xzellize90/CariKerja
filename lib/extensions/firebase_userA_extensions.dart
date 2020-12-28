import 'package:carikerja/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserAExtension on User {
  UserA convertToUser(
          {String namaA = "No Name",
          String lokasi = "No Location",
          String ttlahir = "No Data",
          String agama = "No Data",
          String hobby = "No Data",
          String spndidikan = "No Data",
          String skills = "No Data",
          String pbekerja = "No Data"}) =>
      UserA(this.uid, this.email,
          namaA: namaA,
          lokasi: lokasi,
          ttlahir: ttlahir,
          agama: agama,
          hobby: hobby,
          spendidikan: spndidikan,
          skills: skills,
          pbekerja: pbekerja);
}
