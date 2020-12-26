part of 'models.dart';

class UserC extends Equatable{

  final String uid;
  final String email;
  final String namaC;
  final String lokasi;
  final String profileCompany;

  UserC(this.uid, this.email, {this.namaC, this.lokasi, this.profileCompany});

  @override
  List<Object> get props => [uid, email, namaC, lokasi, profileCompany];
}