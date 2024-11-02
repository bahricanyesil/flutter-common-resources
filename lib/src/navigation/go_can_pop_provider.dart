import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Inherited widget that provides the ability to check
/// if the current screen can be popped.
class GoCanPopProvider extends ChangeNotifier {
  bool _canPop = false;

  /// Indicates whether the current screen can be popped.
  bool get canPop => _canPop;

  /// Sets the value of the [canPop] property.
  // ignore: avoid_positional_boolean_parameters
  void setCanPop(bool newValue) {
    if (_canPop != newValue) {
      _canPop = newValue;
      notifyListeners();
    }
  }

  /// Updates the [canPop] property based on the given
  /// [notification] and [router].
  ///
  /// Returns the new value of the [canPop] property.
  bool onNavigationNotification(
    NavigationNotification notification,
    RouterConfig<Object> router,
  ) {
    final Object? currConfiguration =
        router.routerDelegate.currentConfiguration;
    final RouteMatchList? matchList =
        currConfiguration is RouteMatchList ? currConfiguration : null;
    final List<RouteMatchBase> matchedRouteList =
        matchList?.matches ?? <RouteMatchBase>[];
    final bool newCanPop =
        notification.canHandlePop && (matchedRouteList.length > 1);
    setCanPop(newCanPop);
    return newCanPop;
  }
}
