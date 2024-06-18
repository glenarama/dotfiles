{ pkgs, ... }:

{
    home.packages = [pkgs.oh-my-posh];
    programs = {
        oh-my-posh = {
            enable = true;
            useTheme = "catppuccin_mocha";
        };
        zsh = {
            enable = true;
            autosuggestion.enable = true;
            enableCompletion = true;
            syntaxHighlighting.enable = true;
        };
    };

        home.file.".zshrc".text = '';
        export PATH=$HOME/bin:/usr/local/bin:$PATH
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
    '';
}