import 'dart:html' show Element, EventListener;
import 'package:js/js.dart';
import 'mdc_web/base.dart';

export 'dart:html' show Element;
export 'mdc_web/base.dart' show MDCFoundation;

/// Base class for MDC Web components.
///
/// Javascript: `mdc.base.MDCComponent`.
///
/// * [Component Reference](https://material.io/develop/web/components/base/#mdccomponent)
/// * [Source Code](https://github.com/material-components/material-components-web/tree/master/packages/mdc-base/component.js)
abstract class MDCComponent {
  /// The underlying Javascript component.
  Component get js;

  Element get root_ => js.root_;
  MDCFoundation get foundation_ => js.foundation_;

  void initialize(args) => js.initialize(args);
  MDCFoundation getDefaultFoundation() => js.getDefaultFoundation();
  void initialSyncWithDOM() => js.initialSyncWithDOM();
  void destroy() => js.destroy();
  void listen(String type, EventListener handler, {bool captureThis: false}) =>
      js.listen(
          type,
          captureThis
              ? allowInteropCaptureThis(handler)
              : allowInterop(handler));
  void unlisten(String type, EventListener handler,
          {bool captureThis: false}) =>
      js.unlisten(
          type,
          captureThis
              ? allowInteropCaptureThis(handler)
              : allowInterop(handler));
  void emit(String type, data, [bool shouldBubble = false]) =>
      js.emit(type, data, shouldBubble);
}