{ curl, fetchurl, git, gmp, gperf_3_0, libmpc, m4, mpfr, perl, stdenv, texinfo4, unzip }:

stdenv.mkDerivation {
  name = "avr32-toolchain";

  src = fetchurl {
    url = "https://github.com/monome/avr32-toolchain/archive/6711e09e0babec27f30134c4167cf6c0de138f6a.tar.gz";
    sha256 = "0qyzhd506wlz8kszkjij2syp06ci00a8rxqjwwgg0892x5lzmwph";
  };

  nativeBuildInputs = [
    curl
    git
    gmp
    gperf_3_0
    libmpc
    m4
    mpfr
    perl
    texinfo4
    unzip
  ];

  preBuild = ''
    unset SSL_CERT_FILE
    export PREFIX=$out
    export CFLAGS=-Wno-error=format-security
    export CXXFLAGS=-Wno-error=format-security
  '';

  installPhase = ''
    make install-cross
  '';
}
