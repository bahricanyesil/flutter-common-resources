import 'package:theme_manager/theme_manager.dart';

import 'default_dark_theme.dart';
import 'default_light_theme.dart';

export 'default_dark_theme.dart';
export 'default_light_theme.dart';

/// Default theme model for the app.
final class DefaultTheme extends ThemeModel {
  /// Constructor for the default theme model.
  DefaultTheme()
      : super(
          lightTheme: const DefaultLightTheme().themeData,
          darkTheme: const DefaultDarkTheme().themeData,
          name: 'Default',
        );
}
