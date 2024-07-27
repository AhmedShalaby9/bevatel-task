import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class TravelModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String from;
  final String to;
  final int numberOfPersons;

  const TravelModel({
    required this.id,
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    required this.numberOfPersons,
  });

  @override
  List<Object> get props => [id, title, description, from, to, numberOfPersons];
}
