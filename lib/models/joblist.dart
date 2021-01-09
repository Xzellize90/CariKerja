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
  final String highlights;
  final String code;

  Joblist(
    this.id,
    this.judul,
    this.deskripsi,
    this.kontak,
    this.gaji,
    this.penempatan,
    this.image,
    this.owner,
    this.highlights,
    this.code,
  );

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
        highlights,
        code
      ];
}
