import 'package:bevatel_task/features/travels/domain/model/travel_model.dart';

abstract class ITravelRepo {
  Future<List<TravelModel>> getTravels();
  Future<void> addTravel(TravelModel travel);
  Future<void> updateTravel(TravelModel travel);
  Future<void> deleteTravel(String travelId);
}
