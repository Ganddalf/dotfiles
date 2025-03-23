{
  fetchurl,
  appimageTools,
}:
let
  pname = "ktalk";
  version = "3.0.0";

  src = fetchurl {
    url = "https://st.ktalk.host/ktalk-app/linux/${pname}${version}x86_64.AppImage";
    hash = "sha256-SngWAEYF5rK5iOc/38A0C0LwZCrpLn38knyCPROxZ2k=";
  };

  appimageContents = appimageTools.extract {
    inherit pname version src;
    postExtract = ''
      substituteInPlace $out/${pname}.desktop --replace-fail 'Exec=AppRun' 'Exec=${pname}'
    '';
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/${pname}.desktop
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/${pname}.png \
      $out/share/icons/hicolor/512x512/apps/${pname}.png
  '';
}
