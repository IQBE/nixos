{ pkgs, ... }:

{
  services = {
    languagetool = {
      enable = true;
      allowOrigin = "*";
      jvmOptions = [ "-Xmx2g" ];

      settings = {
        cacheSize = 1000;
        # Data in /var/lib/languagetool must be downloaded manually (not managed by Nix)
        languageModel = "/var/lib/languagetool/ngrams";
        fasttextBinary = "${pkgs.fasttext}/bin/fasttext";
        fasttextModel = "/var/lib/languagetool/lid.176.bin";
      };
    };
  };

  # The languagetool module has no StateDirectory, so create the data folder ourselves
  systemd.tmpfiles.rules = [ "d /var/lib/languagetool 0755 root root -" ];
}
