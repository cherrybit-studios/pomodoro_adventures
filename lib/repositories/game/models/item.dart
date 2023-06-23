import 'package:equatable/equatable.dart';

abstract class Item extends Equatable {
  const Item({
    required this.name,
    required this.description,
    required this.icon,
  });

  final String name;
  final String description;
  final String icon;

  @override
  List<Object?> get props => [name, description, icon];
}
