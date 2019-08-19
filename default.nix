{ stdenv, fetchFromGitHub, jansson, libconfig, libnice, openssl, glib, pkg-config, gengetopt, srtp, sofia_sip, libopus }:

let
  tag = "v0.7.3"; # git tag
in
stdenv.mkDerivation rec {
  name = "janus-gateway-${tag}";
  version = tag;
  src = fetchFromGitHub {
    url = "https://github.com/meetecho/janus-gateway";
    rev = tag;
  };

  buildInputs = [ jansson libconfig libnice openssl glib pkg-config gengetopt srtp sofia_sip libopus ];
  meta = with stdenv.lib; {
    description = "Janus WebRTC Server";
    homepage    = "https://janus.conf.meetecho.com/";
    license     = licenses.gpl3Plus;
    platforms   = platforms.linux;
    maintainers = [];
  };
}
