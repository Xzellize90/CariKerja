part of 'modelsA.dart';

class Status extends Equatable {
  final String applianceId;
  final String id;
  final String posisi;
  final String gaji;
  final String status;
  final String deskripsi;
  final String kontak;
  final String image;

  Status(this.applianceId, this.id, this.posisi, this.gaji, this.status,
      this.deskripsi, this.kontak, this.image);

  @override
  List<Object> get props =>
      [applianceId, id, posisi, gaji, status, deskripsi, kontak, image];
}
