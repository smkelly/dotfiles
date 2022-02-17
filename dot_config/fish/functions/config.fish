function config --description 'Manage dotfile git repository'
  # Inspired by https://www.atlassian.com/git/tutorials/dotfiles
  set -l repo_path $HOME/.cfg

  if test "$argv[1]" = "setup"
    if test -d $repo_path
      echo "Directory already exists: $repo_path"
      return 1
    end
    echo "Setting up configuration files..."
    git clone --bare git@github.com:smkelly/dotfiles $repo_path
    and git -C $repo_path config --local status.showUntrackedFiles no
    and echo "Type 'config checkout' to deploy the config files."
    return
  end

  if not git -C $repo_path rev-parse >/dev/null 2>&1
    echo "Not a git repo at $repo_path" >&2
    return 1
  end
  if test -d $repo_path/.git
    echo "Not a bare git repo at $repo_path" >&2
    return 1
  end

  git --git-dir=$repo_path --work-tree=$HOME $argv
end
