# NixOS 25.05 polluted configs with kwallet
# You can use this module as a workaround
# until you find the root cause

{
    home.file.".config/kwalletrc".text = ''
        [Wallet]
        Enabled=false
    '';
}
