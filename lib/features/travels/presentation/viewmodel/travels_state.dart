import 'package:equatable/equatable.dart';
import '../../domain/model/travel_model.dart';

abstract class TravelState extends Equatable {
  const TravelState();

  @override
  List<Object> get props => [];
}

class TravelInitial extends TravelState {}

class TravelLoading extends TravelState {}

class TravelLoaded extends TravelState {
  final List<TravelModel> travels;

  const TravelLoaded(this.travels);

  @override
  List<Object> get props => [travels];
}

class TravelAdding extends TravelState {}

class TravelAdded extends TravelState {}

class TravelUpdating extends TravelState {}

class TravelUpdated extends TravelState {}

class TravelError extends TravelState {
  final String message;

  const TravelError(this.message);

  @override
  List<Object> get props => [message];
}
