
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/Users/mackayfisher/.micromamba/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/Users/mackayfisher/micromamba"
$MAMBA_EXE shell hook --shell fish --prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/mackayfisher/anaconda3/bin/conda
    eval /Users/mackayfisher/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

