{
  stdenv,
  fetchFromGitHub,
  inetutils,
  wireshark-qt,
  x11_ssh_askpass,
  python3Minimal,
  freerdp3,
}:
let
  pname = "eve-ng-integration";
  version = "0.6.0";
in
stdenv.mkDerivation {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "SmartFinn";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-GeYsRvX/iIt0DHKNb2RnKxbwZazInL+33KEdsIKBY78=";
  };

  buildInputs = [
    inetutils
    wireshark-qt
    x11_ssh_askpass
    python3Minimal
    freerdp3
  ];

  installPhase = ''
    mkdir -p $out/bin
    install -m 755 bin/eve-ng-integration $out/bin/
    install -m 755 bin/eni-rdp-wrapper $out/bin/
    mkdir -p "$out/share/applications"
    install -m 644 data/eve-ng-integration.desktop $out/share/applications/
    install -m 644 data/eni-rdp-wrapper.desktop $out/share/applications/
    mkdir -p "$out/share/mime/packages"
    install -m 644 data/eni-rdp-wrapper.xml $out/share/mime/packages/
  '';
}
