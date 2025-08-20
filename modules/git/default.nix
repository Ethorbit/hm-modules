{ config, lib, ... }:

{
    options.ethorbit.home-manager.git = with lib; {
        user = {
            email = mkOption {
                description = "Your email";
                default = "";
            };

            name = mkOption {
                description = "Your username";
                default = "";
            };
        };
    };

    config = {
        programs.git = {
            enable = true;
        };

        home.file.".gitconfig" = {
            text = ''
            [user]
                email = ${config.ethorbit.home-manager.git.user.email}
                name = ${config.ethorbit.home-manager.git.user.name}
            [credential]
                helper = cache
            [pull]
                ff = true
            [filter "lfs"]
                process = git-lfs filter-process
                required = true
                clean = git-lfs clean -- %f
                smudge = git-lfs smudge -- %f
            '';
        };
    };
}
