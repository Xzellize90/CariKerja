part of 'modelsA.dart';

class Status extends Equatable {
  final String applianceId;
  final String id;
  final String posisi;

  final String status;

  Status(this.applianceId, this.id, this.posisi, this.status);

  @override
  List<Object> get props => [applianceId, id, posisi, status];
}
