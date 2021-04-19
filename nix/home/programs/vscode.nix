{ pkgs, lib, ... }:

with lib;

let
  extensions = with pkgs.vscode-extensions;
    pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Get these hashes by putting in the wrong hash.
      # `home-manager switch` will tell you what the correct hash is.
      {
        name = "quicktype";
        publisher = "quicktype";
        version = "12.0.46";
        sha256 = "0mzn1favvrzqcigr74gmy167qak5saskhwcvhf7f00z7x0378dim";
      }
      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.7.0";
        sha256 = "0xl5y36kwh59mnb9j1pnsl5bn62z4n4lvsp31r1xscxrs9vh1ngb";
      }
      {
        name = "gitlens";
        publisher = "eamodio";
        version = "10.2.3";
        sha256 = "00pddp8jlmqmc9c50vwm6bnkwg9gvvfn8mvrz1l9fl1w88ia1nz0";
      }
      {
        name = "vscode-proto3";
        publisher = "zxh404";
        version = "0.2.2";
        sha256 = "1gasx3ay31dy663fcnhpvbys5p7xjvv30skpsqajyi9x2j04akaq";
      }
      {
        name = "vim";
        publisher = "vscodevim";
        version = "1.17.1";
        sha256 = "10f8jz52gr6k2553awa66m006wszj9z2rnshsic6h2aawxiz3zq1";
      }
      {
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "5.7.1";
        sha256 = "0f2q17d028j2c816rns9hi2w38ln3mssdcgzm6kc948ih252jflr";
      }
      {
        name = "graphql-for-vscode";
        publisher = "kumar-harsh";
        version = "1.15.3";
        sha256 = "1x4vwl4sdgxq8frh8fbyxj5ck14cjwslhb0k2kfp6hdfvbmpw2fh";
      }
      {
        name = "vscode-styled-components";
        publisher = "jpoissonnier";
        version = "1.2.0";
        sha256 = "1aljpvlswvmazhagiz5sckjh766q5vihyx7xc68ipwp773zx0zl0";
      }
      {
        name = "metals";
        publisher = "scalameta";
        version = "1.3.1";
        sha256 = "1sfpsp8m24k9mmaq1dscpy25mn9f7a9qgsr7sz8flv9b0blb0jcy";
      }
      {
        name = "python";
        publisher = "ms-python";
        version = "2020.12.424452561";
        sha256 = "0zd0wdaip4nd9awr0h0m5afarzwhkfd8n9hzdahwf43sh15lqblf";
      }
      {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2020.12.414227025";
        sha256 = "1zv5p37qsmp2ycdaizb987b3jw45604vakasrggqk36wkhb4bn1v";
      }
      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.2.0";
        sha256 = "0z2knfgn1g5rvanssnz6ym8zqyzzk5naaqsggrv77k6jzd5lpw49";
      }
      {
        name = "go";
        publisher = "golang";
        version = "0.18.1";
        sha256 = "0ldazkbi5hyqnq0rrkxiwl9n69pmh4q9rwazkg0hjh8b6pfrlrbg";
      }
      {
        name = "vscode-apollo";
        publisher = "apollographql";
        version = "1.17.0";
        sha256 = "1ip7csdb1ssxj4bh4ml1y3z0b546aagfjfjh354cgjc5vazrk6rx";
      }
      {
        name = "shell-format";
        publisher = "foxundermoon";
        version = "6.0.1";
        sha256 = "1zkvrlhmw8id65km9cfpgv8p3w1ym4g4mr7cmb32fn3yk937gpmy";
      }
      {
        name = "vscode-github";
        publisher = "knisterpeter";
        version = "0.30.2";
        sha256 = "0axq6a8lgf17kwmsw3fj5g4n0wgwr7x6qfxshaqbl6ac6p1pnd9v";
      }
      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.8.0";
        sha256 = "0gk9jb8i894jx7a0wjx3w220kh55gyczrfi01b3dcdnwi8gvh80n";
      }
      {
        name = "vscode-spotify";
        publisher = "shyykoserhiy";
        version = "3.2.0";
        sha256 = "0zgqvqk6rm4fs1rcdbb42k989gzpc5h4nmph2bwrgdv16gjmn6gd";
      }
      {
        name = "indent-rainbow";
        publisher = "oderwat";
        version = "7.4.0";
        sha256 = "1xnsdwrcx24vlbpd2igjaqlk3ck5d6jzcfmxaisrgk7sac1aa81p";
      }
      {
        name = "rainbow-brackets";
        publisher = "2gua";
        version = "0.0.6";
        sha256 = "1m5c7jjxphawh7dmbzmrwf60dz4swn8c31svbzb5nhaazqbnyl2d";
      }
      {
        name = "vscode-import-cost";
        publisher = "wix";
        version = "2.12.0";
        sha256 = "1g6k8fxfa49ky8v3l5n6l7p6gnjf9sdd56crcj33p08gb8pyy86l";
      }
      {
        name = "rust";
        publisher = "rust-lang";
        version = "0.6.3";
        sha256 = "1r5q1iclr64wmgglsr3na3sv0fha5di8xyccv7xwcv5jf8w5rz5y";
      }
      {
        name = "vetur";
        publisher = "octref";
        version = "0.22.6";
        sha256 = "0k9akddgbbrjsdl08w4a2nbsj0gi7bki7yjap2c4c1ic9v0lxihi";
      }
      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.1.13";
        sha256 = "1adzgisljlq6xmmwrziawkgy941bf8i8nq4c9w3gnsbr20gd9pyi";
      }
      {
        name = "better-toml";
        publisher = "bungcip";
        version = "0.3.2";
        sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";
      }
      {
        name = "prettier-toml";
        publisher = "bodil";
        version = "0.1.0";
        sha256 = "04zyxf4lwkphci6j7svzirha86dad86m3kk7r29skaph2dkw12vg";
      }
      {
        name = "sqltools";
        publisher = "mtxr";
        version = "0.21.6";
        sha256 = "0iyxmj29p6ymnvjwraxxh883gm3asn25azbg1v6dqam700bjlgr2";
      }
      {
        name = "vscode-sql-formatter";
        publisher = "adpyke";
        version = "1.4.4";
        sha256 = "06q78hnq76mdkhsfpym2w23wg9wcpikpfgz07mxk1vnm9h3jm2l3";
      }
      {
        name = "tabnine-vscode";
        publisher = "TabNine";
        version = "2.8.3";
        sha256 = "04zzkfgb4y8dvp83i2h3mf6fpk3kkavzpgz8za622wnl6g0gqlvr";
      }
      {
        name = "pgformatter";
        publisher = "bradymholt";
        version = "1.16.0";
        sha256 = "0v8dy7875ysg33sbv3m6xikl9kq9z8nylclizfr2dwyzwk9gkfx8";
      }
      # This is commented out because the solidity plugin is not immutable.
      # {
      #   name = "solidity";
      #   publisher = "juanblanco";
      #   version = "0.0.108";
      #   sha256 = "0hkimda7g55m0x75sw8ff2ilgvbi6740r1cx52dxfb4lljw4srjn";
      # }
      {
        name = "vscode-jest";
        publisher = "orta";
        version = "3.2.0";
        sha256 = "1qhhy3q5lmdmgw25vmyx69h37i2vbpjxca46jra86vm6kdwglc36";
      }
      {
        name = "auto-dark-mode";
        publisher = "LinusU";
        version = "0.1.7";
        sha256 = "1sjzm6x887pj92bmdjzqk3xk0qy0v0zrvlclync80pzfhcy8jsif";
      }
      {
        name = "svg";
        publisher = "jock";
        version = "1.4.1";
        sha256 = "0pzzlginhy5gi4jp87bx48dgvrp81a0miabnq05i8c3ndllp351y";
      }
      {
        name = "mdx";
        publisher = "silvenon";
        version = "0.1.0";
        sha256 = "1mzsqgv0zdlj886kh1yx1zr966yc8hqwmiqrb1532xbmgyy6adz3";
      }
      {
        name = "haskell";
        publisher = "haskell";
        version = "1.2.0";
        sha256 = "0vxsn4s27n1aqp5pp4cipv804c9cwd7d9677chxl0v18j8bf7zly";
      }
      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.4.0";
        sha256 = "0ab7m5jzxakjxaiwmg0jcck53vnn183589bbxh3iiylkpicrv67y";
      }
      {
        name = "vscode-go-inline-sql";
        publisher = "jhnj";
        version = "0.1.2";
        sha256 = "1bg5rfh8rsqllxh6wi60yxl05s93whrilppq8p9gk8pj9zszy3sy";
      }
      {
        name = "debugger-for-chrome";
        publisher = "msjsdiag";
        version = "4.12.12";
        sha256 = "0nkzck3i4342dhswhpg4b3mn0yp23ipad228hwdf23z8b19p4b5g";
      }
      {
        name = "discord-vscode";
        publisher = "icrawl";
        version = "5.6.2";
        sha256 = "01r64py2aqwd7agx3ndy37qcbnirysdq8a504n48v743i0kxs3a5";
      }
    ] ++ [ bbenoist.Nix ]
    ++ (if pkgs.stdenv.isDarwin then [ ] else [ ms-vsliveshare.vsliveshare ]);
in {
  programs.vscode = {
    enable = true;
    userSettings = {
      "editor.formatOnSave" = true;
      "editor.codeActionsOnSave" = { "source.fixAll.eslint" = true; };

      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[graphql]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
      "[markdown]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
      "[yaml]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
      "[json]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };

      "[svg]" = { "editor.defaultFormatter" = "jock.svg"; };
      "[toml]" = { "editor.defaultFormatter" = "bodil.prettier-toml"; };
      "[nix]" = { "editor.tabSize" = 2; };
      "[go]" = { "editor.defaultFormatter" = "golang.go"; };
      "[rust]" = { "editor.defaultFormatter" = "rust-lang.rust"; };
      "[sql]" = {
        "editor.defaultFormatter" = "bradymholt.pgformatter";
        "editor.formatOnSave" = false;
      };
      "[shellscript]" = {
        "editor.defaultFormatter" = "foxundermoon.shell-format";
      };
      "[scala]" = { "editor.defaultFormatter" = "scalameta.metals"; };
      "[terraform]" = { "editor.defaultFormatter" = "mauve.terraform"; };
      "[python]" = { "editor.defaultFormatter" = "ms-python.python"; };

      "vim.useSystemClipboard" = true;
      "window.zoomLevel" = 0;
      "files.associations" = {
        "*.md" = "markdown";
        "*.toml" = "toml";
      };

      # frontend stuff
      "typescript.updateImportsOnFileMove.enabled" = "never";
      "eslint.validate" =
        [ "javascript" "javascriptreact" "typescript" "typescriptreact" ];
      "prettier.requireConfig" = true;

      "gitlens.advanced.messages"."suppressShowKeyBindingsNotice" = true;
      "gitlens.views.fileHistory.enabled" = true;
      "gitlens.views.lineHistory.enabled" = true;

      "keyboard.dispatch" = "keyCode";

      "autoDarkMode" = {
        "darkTheme" = "Default Dark+";
        "lightTheme" = "Default Light+";
      };
      "workbench.colorTheme" = "Default Dark+";
    };
  };

  # Adapted from https://discourse.nixos.org/t/vscode-extensions-setup/1801/2
  home.file = let
    toPaths = path:
      let
        p = "${path}/share/vscode/extensions";
        # Links every dir in p to the extension path.
      in mapAttrsToList
      (k: v: { ".vscode/extensions/${k}".source = "${p}/${k}"; })
      (builtins.readDir p);
    toSymlink = concatMap toPaths extensions;
  in foldr (a: b: a // b) { } toSymlink;
}
