import 'package:equatable/equatable.dart';

class AdsList extends Equatable {
  final String id;
  final String name;
  final String description;
  final String link;
  final String image;

  AdsList(this.id, this.name, this.description, this.link, this.image,);

  @override
  List<Object> get props =>
      [id, name, description, link, image];
}