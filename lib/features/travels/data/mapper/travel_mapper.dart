import 'package:bevatel_task/features/travels/data/entities/travel_entity.dart';
import 'package:bevatel_task/features/travels/domain/model/travel_model.dart';

class TravelMapper {
  TravelModel? transformTravelEntityToModel(TravelEntity? input) {
    if (input == null) {
      return null;
    }
    final id = input.id;
    final title = input.title;
    final description = input.description;
    final to = input.to;
    final from = input.from;
    final numberOfPersons = input.numberOfPersons;
    if (id == null ||
        title == null ||
        description == null ||
        to == null ||
        from == null ||
        numberOfPersons == null) {
      return null;
    }

    return TravelModel(
        id: id,
        title: title,
        description: description,
        from: from,
        to: to,
        numberOfPersons: numberOfPersons);
  }

  TravelEntity transformTravelModelToEntity(TravelModel input) {
    return TravelEntity(
      id: input.id,
      title: input.title,
      description: input.description,
      from: input.from,
      to: input.to,
      numberOfPersons: input.numberOfPersons,
    );
  }
}
