{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    clock24 = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.resurrect
      tmuxPlugins.catppuccin
      tmuxPlugins.fingers
      tmuxPlugins.tilish
      tmuxPlugins.continuum
    ];
    extraConfig = ''
      set -g @catppuccin_flavour 'mocha'

      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-capture-pane-contents 'on'

      set -g @continuum-restore 'on'
      set -g @continuum-boot 'on'
      set -g @continuum-save-interval '10'

      # Mouse works as expected
      set-option -g mouse on
      
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      bind-key -n 'M-h' if-shell "$is_vim" 'send-keys M-h'  'select-pane -L'
      bind-key -n 'M-j' if-shell "$is_vim" 'send-keys M-j'  'select-pane -D'
      bind-key -n 'M-k' if-shell "$is_vim" 'send-keys M-k'  'select-pane -U'
      bind-key -n 'M-l' if-shell "$is_vim" 'send-keys M-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'M-\\' if-shell \"$is_vim\" 'send-keys M-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'M-\\' if-shell \"$is_vim\" 'send-keys M-\\\\'  'select-pane -l'"

      bind-key -T copy-mode-vi 'M-h' select-pane -L
      bind-key -T copy-mode-vi 'M-j' select-pane -D
      bind-key -T copy-mode-vi 'M-k' select-pane -U
      bind-key -T copy-mode-vi 'M-l' select-pane -R
      bind-key -T copy-mode-vi 'M-\' select-pane -l
    '';
  };
}
