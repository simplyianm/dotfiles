with import <nixpkgs> {}; {
  devEnv = stdenv.mkDerivation {
    name = "dev";
    buildInputs = [
        yarn
        nodejs-12_x

        go
        goreman
        stdenv
        zsh

        darwin.apple_sdk.frameworks.CoreFoundation
    ];
    CFLAGS="-I/usr/include";
    LDFLAGS="-L${darwin.apple_sdk.frameworks.CoreFoundation}/Library/Frameworks";
  };
}