{
  fetchurl,
  appimageTools,
}:
let
  pname = "outline-manager";
  version = "1.17.1";
  rc = "1";

  src = fetchurl {
    url = "https://s3.amazonaws.com/outline-releases/manager/linux/${version}/${rc}/Outline-Manager.AppImage";
    hash = "sha256-YsNYUddifV0V43V0NBFDjiDbgLJ8QnMOceuoxPN+iTQ=";
  };

  appimageContents = appimageTools.extract {
    inherit pname version src;
    postExtract = ''
      substituteInPlace $out/@outlineserver_manager.desktop --replace-fail 'Exec=AppRun' 'Exec=${pname}'
      substituteInPlace $out/@outlineserver_manager.desktop --replace-fail 'Icon=@outlineserver_manager' 'Icon=${pname}'
    '';
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/@outlineserver_manager.desktop $out/share/applications/${pname}.desktop
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/@outlineserver_manager.png \
      $out/share/icons/hicolor/512x512/apps/${pname}.png
  '';
}
