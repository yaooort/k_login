#ifndef FLUTTER_PLUGIN_K_LOGIN_PLUGIN_H_
#define FLUTTER_PLUGIN_K_LOGIN_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace k_login {

class KLoginPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  KLoginPlugin();

  virtual ~KLoginPlugin();

  // Disallow copy and assign.
  KLoginPlugin(const KLoginPlugin&) = delete;
  KLoginPlugin& operator=(const KLoginPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace k_login

#endif  // FLUTTER_PLUGIN_K_LOGIN_PLUGIN_H_
