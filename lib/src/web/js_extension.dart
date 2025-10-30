import 'dart:js_interop';

@JS('__ucCmp')
@staticInterop
class UCcmpJS {}

extension UCcmpJSExtension on UCcmpJS {
  external JSPromise showFirstLayer();
  external JSPromise showSecondLayer();
  external JSPromise acceptAllConsents();
  external JSPromise denyAllConsents();
  external JSPromise saveConsents();
  external JSPromise getConsentDetails();
  external JSPromise getControllerId();
  external JSPromise changeLanguage(String lang);
  external JSPromise clearUserSession();

  // Optionals
  external JSPromise updateServicesConsents(JSArray services);
  external JSPromise updateTcfConsents(JSObject tcfConsents);
}
