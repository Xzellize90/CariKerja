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
  final String imageH;

  Joblist(
      this.id,
      this.judul,
      this.deskripsi,
      this.kontak,
      this.gaji,
      this.penempatan,
      this.image,
      this.owner,
      this.highlight,
      this.code,
      this.imageH);

  @override
  List<Object> get props => [
        id,
        judul,
        deskripsi,
        kontak,
        gaji,
        penempatan,
        image,
        owner,
        highlight,
        code,
        imageH
      ];
}
