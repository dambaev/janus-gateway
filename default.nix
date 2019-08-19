{ stdenv, fetchgit, jansson, libconfig, libnice, openssl, glib, pkg-config, gengetopt,
  srtp, sofia_sip, libopus, autoreconfHook, findutils, patchelf
}:

let
  tag = "v0.7.3"; # git tag
in
stdenv.mkDerivation rec {
  name = "janus-gateway-${tag}";
  version = tag;
  preConfigure = ''
    ./autogen.sh
  '';
  postInstall = ''
    mkdir -p /run/janus
    mv $out/etc/janus/janus.transport.pfunix.jcfg.sample $out/etc/janus/janus.transport.pfunix.jcfg
    sed -i 's/#admin_path = "\/path\/to\/ux-janusadmin"/path = "\/run\/janus\/janus-admin.sock"/' $out/etc/janus/janus.transport.pfunix.jcfg
    sed -i 's/#path = "\/path\/to\/ux-janusapi"/path = "\/run\/janus\/janus.sock"/' $out/etc/janus/janus.transport.pfunix.jcfg
  '';
  src = fetchgit {
    url = "https://github.com/meetecho/janus-gateway";
    sha256 = "1i25489nlacn95z7zvixc1x4yjw82wfs4zxagmbg3shhgkp865hm";
  };

  buildInputs = [ autoreconfHook jansson libconfig libnice openssl glib pkg-config
    gengetopt srtp sofia_sip libopus findutils patchelf
  ];
  meta = with stdenv.lib; {
    description = "Janus WebRTC Server";
    homepage    = "https://janus.conf.meetecho.com/";
    license     = licenses.gpl3Plus;
    platforms   = platforms.linux;
    maintainers = [];
  };
}
