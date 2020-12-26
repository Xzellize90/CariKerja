part of 'models.dart';

class UserA extends Equatable{

  final String uid;
  final String email;
  final String namaA;
  final String lokasi;
  final String ttlahir;
  final String agama;
  final String hobby;
  final String spendidikan;
  final String skills;
  final String pbekerja;
  final String profileApplicant;

  UserA(this.uid, this.email, {this.namaA, this.lokasi, this.ttlahir, this.agama, this.hobby, this.spendidikan, this.skills, this.pbekerja, this.profileApplicant});

  @override
  List<Object> get props => [uid, email, namaA, lokasi, ttlahir, agama, hobby, spendidikan, skills, pbekerja, profileApplicant];
}