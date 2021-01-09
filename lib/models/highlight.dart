import 'package:equatable/equatable.dart';

class Highlight extends Equatable {
  final String id;
  final String judul;
  final String gaji;
  final String code;
  final String deskripsi;
  final String kontak;
  final String penempatan;
  final String image;

  Highlight(this.code, this.id, this.judul, this.deskripsi, this.kontak,
      this.gaji, this.penempatan, this.image);

  @override
  List<Object> get props =>
      [code, id, judul, deskripsi, kontak, gaji, penempatan, image];
}
