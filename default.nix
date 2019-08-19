{ stdenv, fetchgit, jansson, libconfig, libnice, openssl, glib, pkg-config, gengetopt, srtp, sofia_sip, libopus }:

let
  tag = "v0.7.3"; # git tag
in
stdenv.mkDerivation rec {
  name = "janus-gateway-${tag}";
  version = tag;
  src = fetchgit {
    url = "https://github.com/meetecho/janus-gateway";
    sha256 = "e0ad1ff9c23592c18aa662301c6d19f12a38b6da";
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
