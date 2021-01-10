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
  final String highlight;
  final String code;

  Joblist(this.id, this.judul, this.deskripsi, this.kontak, this.gaji,
      this.penempatan, this.image, this.owner, this.highlight, this.code);

  @override
  List<Object> get props =>
      [id, judul, deskripsi, kontak, gaji, penempatan, image, owner, highlight, code];
}
