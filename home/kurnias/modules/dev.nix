{ config, pkgs, ... }: {
	home.packages = with pkgs; [
		# Editors
		vscode
		neovim

		# Tools
		git
		gh
		asdf-vm
	];

	programs.git = {
		enable = true;
		userEmail = "adityakurniasaputra903@gmail.com";
		userName = "adityakurnias";
	};
}
