part of 'modelsA.dart';

class UserA extends Equatable {
  final String uid;
  final String namaA;
  final String email;
  final String lokasi;
  final String ttlahir;
  final String gender;
  final String agama;
  final String hobby;
  final String spendidikan;
  final String skills;
  final String pbekerja;
  final String role;
  final String profileApplicant;

  UserA(
      this.uid,
      this.email,
      this.namaA,
      this.lokasi,
      this.ttlahir,
      this.gender,
      this.agama,
      this.hobby,
      this.spendidikan,
      this.skills,
      this.pbekerja,
      this.profileApplicant,
      {this.role});

  @override
  List<Object> get props => [
        uid,
        namaA,
        email,
        lokasi,
        ttlahir,
        gender,
        agama,
        hobby,
        spendidikan,
        skills,
        pbekerja,
        role,
        profileApplicant
      ];
}
