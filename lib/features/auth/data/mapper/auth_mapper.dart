import '../../domain/model/user_model.dart';
import '../entities/user_entity.dart';

class AuthMapper {
  UserModel transformUserEntityToModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      country: entity.country,
      phone: entity.phone,
    );
  }

  UserEntity transformUserModelToEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      country: model.country,
      phone: model.phone,
    );
  }
}
