{ stdenv, fetchgit, jansson, libconfig, libnice, openssl, glib, pkg-config, gengetopt, srtp, sofia_sip, libopus, autoreconfHook }:

let
  tag = "v0.7.3"; # git tag
in
stdenv.mkDerivation rec {
  name = "janus-gateway-${tag}";
  version = tag;
  preConfigure = ''
    ./autogen.sh
  '';
  src = fetchgit {
    url = "https://github.com/meetecho/janus-gateway";
    sha256 = "1i25489nlacn95z7zvixc1x4yjw82wfs4zxagmbg3shhgkp865hm";
  };

  buildInputs = [ autoreconfHook jansson libconfig libnice openssl glib pkg-config gengetopt srtp sofia_sip libopus ];
  meta = with stdenv.lib; {
    description = "Janus WebRTC Server";
    homepage    = "https://janus.conf.meetecho.com/";
    license     = licenses.gpl3Plus;
    platforms   = platforms.linux;
    maintainers = [];
  };
}
