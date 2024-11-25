// import 'package:flutter/material.dart';
// import 'package:flutter_common_resources/src/responsive/responsive_provider.dart';
// import 'package:provider/provider.dart';

// /// A widget that updates the responsive provider when it is mounted.
// ///
// /// This is used to ensure that the responsive provider is updated when the
// /// widget is mounted.
// final class ResponsiveUpdaterWidget extends StatefulWidget {
//   /// Creates a new responsive updater widget.
//   const ResponsiveUpdaterWidget({required this.child, super.key});

//   /// The child widget.
//   final Widget child;

//   @override
//   _ResponsiveUpdaterStateWidget createState() =>
//       _ResponsiveUpdaterStateWidget();
// }

// class _ResponsiveUpdaterStateWidget extends State<ResponsiveUpdaterWidget> {
//   @override
//   void initState() {
//     super.initState();
//     Future<void>.microtask(() {
//       if (mounted) {
//         context.read<ResponsiveProvider>().update(context);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool isInitialized = context.select<ResponsiveProvider, bool>(
//       (ResponsiveProvider p) => p.initialized,
//     );

//     if (!isInitialized) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return widget.child;
//   }
// }
