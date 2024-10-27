import 'package:flutter/material.dart';

/// A base widget that makes its content scrollable and automatically
/// adjusts when the keyboard is shown or hidden.
///
/// This widget listens to keyboard visibility changes and ensures that
/// any focused field (such as a [TextFormField]) remains visible by
/// scrolling the content appropriately.
///
/// Usage:
///
/// ```dart
/// class MyFormScreen extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       appBar: AppBar(
///         title: Text('Keyboard Aware Scrollable'),
///       ),
///       body: KeyboardAwareScrollable(
///         child: Column(
///           children: [
///             TextFormField(
///               decoration: InputDecoration(labelText: 'Field 1'),
///             ),
///             SizedBox(height: 100),
///             TextFormField(
///               decoration: InputDecoration(labelText: 'Field 2'),
///             ),
///             SizedBox(height: 100),
///             TextFormField(
///               decoration: InputDecoration(labelText: 'Field 3'),
///             ),
///           ],
///         ),
///       ),
///     );
///   }
/// }
/// ```
///
/// This widget is useful in forms or long scrollable content where
/// input fields can be obscured by the keyboard when they are focused.
class KeyboardAwareScrollable extends StatefulWidget {
  /// Creates a [KeyboardAwareScrollable] widget.
  ///
  /// The [child] parameter is required and defines the content inside the
  /// scrollable view.
  const KeyboardAwareScrollable({required this.child, super.key});

  /// The child widget that will be displayed inside the scrollable area.
  ///
  /// Typically, this will be a form or a column of input fields.
  final Widget child;

  @override
  _KeyboardAwareScrollableState createState() =>
      _KeyboardAwareScrollableState();
}

class _KeyboardAwareScrollableState extends State<KeyboardAwareScrollable>
    with WidgetsBindingObserver {
  /// A controller to control the scrolling behavior of the scroll view.
  final ScrollController _scrollController = ScrollController();

  /// A [FocusNode] that tracks the focus state of input fields within the
  /// scrollable content.
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Register the widget as an observer to listen for system events such
    // as keyboard visibility changes.
    WidgetsBinding.instance.addObserver(this);

    // Add a listener to the focus node to detect
    //when an input field gains focus.
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    // Remove the observer and dispose of resources
    //when the widget is destroyed.
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// This method is triggered when the device's dimensions change,
  /// which includes when the keyboard is opened or closed.
  ///
  /// The [WidgetsBindingObserver] calls this method automatically.
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    // Wait for the UI to settle after a dimension change and then
    // ensure the focused field is visible.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_focusNode.hasFocus) {
        _scrollToFocusedField();
      }
    });
  }

  /// Handles focus changes on the [FocusNode].
  ///
  /// This method is triggered when an input field gains focus. It ensures that
  /// the focused field is scrolled into view.
  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // Once the frame is built, scroll to the focused field.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToFocusedField();
      });
    }
  }

  /// Scrolls the view to ensure the currently focused field is visible.
  ///
  /// This method calculates the maximum scroll extent and animates the scroll
  /// to ensure that the focused field isn't hidden by the keyboard.
  void _scrollToFocusedField() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Allows the user to tap anywhere on the screen to request focus on the
      // current field, which triggers the scrolling mechanism.
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      // A scrollable area that uses the [SingleChildScrollView] widget.
      // The [ScrollController] is used to control scrolling behavior.
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
