{ pkgs, ... }:
let
  pname = "ktalk";
  version = "3.0.0";

  src = pkgs.fetchurl {
    url = "https://st.ktalk.host/ktalk-app/linux/ktalk3.0.0x86_64.AppImage";
    hash = "sha256-SngWAEYF5rK5iOc/38A0C0LwZCrpLn38knyCPROxZ2k=";
  };

  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
    postExtract = ''
      substituteInPlace $out/ktalk.desktop --replace-fail 'Exec=AppRun' 'Exec=${pname}'
    '';
  };

  ktalk = pkgs.appimageTools.wrapType2 {
    inherit pname version src;

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/ktalk.desktop $out/share/applications/ktalk.desktop
      install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/ktalk.png \
        $out/share/icons/hicolor/512x512/apps/ktalk.png
    '';
  };
in
{
  environment.systemPackages = [
    ktalk
  ];
}
