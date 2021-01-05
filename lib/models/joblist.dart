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

  Joblist(this.id, this.judul, this.gaji, this.deskripsi, this.image,
      {this.kontak, this.penempatan, this.owner});

  @override
  List<Object> get props =>
      [id, judul, deskripsi, kontak, gaji, penempatan, image, owner];
}
