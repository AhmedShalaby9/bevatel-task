import 'package:equatable/equatable.dart';
import '../../domain/model/travel_model.dart';

abstract class TravelEvent extends Equatable {
  const TravelEvent();

  @override
  List<Object> get props => [];
}

class LoadTravels extends TravelEvent {}

class AddTravel extends TravelEvent {
  final TravelModel travel;

  const AddTravel(this.travel);

  @override
  List<Object> get props => [travel];
}

class UpdateTravel extends TravelEvent {
  final TravelModel travel;

  const UpdateTravel(this.travel);

  @override
  List<Object> get props => [travel];
}

class DeleteTravel extends TravelEvent {
  final String travelId;

  const DeleteTravel(this.travelId);

  @override
  List<Object> get props => [travelId];
}
