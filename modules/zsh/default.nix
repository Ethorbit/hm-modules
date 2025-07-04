{ config, lib, pkgs, ... }:

{
    options = {
        ethorbit.home-manager.zsh = with lib; {
            prompt = {
                colors = {
                    prompt = mkOption {
                        type = types.str;
                        default = "%B%F{cyan}";
                    };

                    name = mkOption {
                        type = types.str;
                        default = "${config.ethorbit.home-manager.zsh.prompt.colors.prompt}";
                    };

                    directory = mkOption {
                        type = types.str;
                        default = "%B%F{reset}";
                    };
                };
            };
        };
    };

    config = {
        # so nix can stay TF outta my way and stop trying to parse properly escaped text
        # (seriously, sometimes nix is just a headache!)
        home.file.".zshrc_text" = {
            source = ./.zshrc;
            recursive = true;
        };

        programs.zsh = with lib; {
            enable = true;
            enableCompletion = true;
            syntaxHighlighting.enable = true;
            autosuggestion.enable = true;
            #enableAutosuggestions = true;
            history = {
                size = 10000000;
                save = 10000000;
                share = true;
                ignoreDups = true;
                ignoreSpace = true;
                expireDuplicatesFirst = true;
            };
            autocd = true;
            initExtra = ''
                prompt_color=${config.ethorbit.home-manager.zsh.prompt.colors.prompt}
                name_color=${config.ethorbit.home-manager.zsh.prompt.colors.name}
                dir_color=${config.ethorbit.home-manager.zsh.prompt.colors.directory}
                prompt_symbol=${config.ethorbit.home-manager.shell.prompt.symbol}
                PROMPT_ALTERNATIVE=${config.ethorbit.home-manager.shell.prompt.alternative}
                NEWLINE_BEFORE_PROMPT=${config.ethorbit.home-manager.shell.prompt.newline}
                source ${pkgs.zsh-z}/share/zsh-z/zsh-z.plugin.zsh
                source ~/.zshrc_text
            '';
        };
    };
}
