#include "include/k_login/k_login_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "k_login_plugin.h"

void KLoginPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  k_login::KLoginPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
