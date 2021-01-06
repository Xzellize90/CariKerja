part of 'modelsC.dart';

class Joblist extends Equatable {
  final String id;
  final String judul;
  final String gaji;

  final String deskripsi;
  final String kontak;
  final String penempatan;
  final String image;
  final String owner;

  Joblist(this.id, this.judul, this.deskripsi, this.kontak, this.gaji,
      this.penempatan, this.image, this.owner);

  @override
  List<Object> get props =>
      [id, judul, deskripsi, kontak, gaji, penempatan, image, owner];
}
