This repository contains my dotfiles and configuration files.
They are designed to support Linux, macOS, and FreeBSD.
They are also templated to work in both a professional and personal context.

This repository uses Chezmoi for management, deployment, and templating.

To bootstrap a new deployment with Chezmoi present:
$ chezmoi init smkelly --apply

To bootstrap without Chezmoi installed:
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply smkelly
