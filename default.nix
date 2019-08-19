{ stdenv, fetchgit }:

let
  tag = "v0.7.3"; # git tag
in
stdenv.mkDerivation rec {
  name = "janus-gateway-${tag}";
  version = tag;
  src = fetchgit {
    url = "https://github.com/meetecho/janus-gateway";
    branchName = tag;
  };

  buildInputs = with nixpkgs; [ jansson libconfig libnice openssl glib pkg-config gengetopt libsrtp sofia_sip libopus ];
  meta = with stdenv.lib; {
    description = "Janus WebRTC Server";
    homepage    = "https://janus.conf.meetecho.com/";
    license     = licenses.gpl3Plus;
    platforms   = platforms.linux;
    maintainers = [];
  };
}
