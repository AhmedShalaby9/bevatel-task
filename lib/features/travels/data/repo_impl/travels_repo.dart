import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/model/travel_model.dart';
import '../../domain/repo/travels_repo.dart';
import '../entities/travel_entity.dart';
import '../mapper/travel_mapper.dart';

class TravelsRepoImpl extends ITravelRepo {
  final FirebaseFirestore firestore;
  final TravelMapper travelMapper;

  TravelsRepoImpl(this.firestore) : travelMapper = TravelMapper();

  @override
  Future<List<TravelModel>> getTravels() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('travels').get();
      final entities = snapshot.docs.map((doc) {
        return TravelEntity.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return entities
          .map((entity) => travelMapper.transformTravelEntityToModel(entity)!)
          .toList();
    } catch (e) {
      throw Exception('Error getting travels: $e');
    }
  }

  @override
  Future<void> addTravel(TravelModel travel) async {
    try {
      final entity = travelMapper.transformTravelModelToEntity(travel);
      await firestore.collection('travels').add(entity.toJson());
    } catch (e) {
      throw Exception('Error adding travel: $e');
    }
  }

  @override
  Future<void> updateTravel(TravelModel travel) async {
    try {
      final entity = travelMapper.transformTravelModelToEntity(travel);
      await firestore.collection('travels').doc(entity.id).update(entity.toJson());
    } catch (e) {
      throw Exception('Error updating travel: $e');
    }
  }

  @override
  Future<void> deleteTravel(String travelId) async {
    try {
      await firestore.collection('travels').doc(travelId).delete();
    } catch (e) {
      throw Exception('Error deleting travel: $e');
    }
  }
}
