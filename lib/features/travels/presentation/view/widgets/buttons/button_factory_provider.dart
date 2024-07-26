import 'package:bevatel_task/features/travels/presentation/view/widgets/buttons/base_button_factory.dart';

import 'buttons_profiles.dart';

enum ButtonType { edit, delete }

class ButtonFactoryProvider {
  static BaseButtonFactory getFactory(ButtonType type) {
    switch (type) {
      case ButtonType.edit:
        return EditButtonFactory();
      case ButtonType.delete:
        return DeleteButtonFactory();
      default:
        throw Exception('Invalid button type');
    }
  }
}
