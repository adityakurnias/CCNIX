{ config, pkgs, ... }: {
	home.packages = with pkgs; [
		# Editors
		vscode
		neovim
		zed-editor

		# Languages
		php
		
		# Tools
		git
		gh
		nodejs_24
		pnpm
		deno
		php84Packages.composer
	];

	programs.git = {
		enable = true;
		userEmail = "adityakurniasaputra903@gmail.com";
		userName = "adityakurnias";
	};
}
