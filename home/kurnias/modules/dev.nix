{ config, pkgs, ... }: {
	home.packages = with pkgs; [
		# Editors
		vscode
		neovim

		# Tools
		git
		gh
		asdf-vm

		# lang
		ruby
	];
}
