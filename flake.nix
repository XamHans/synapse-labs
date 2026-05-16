{
  description = "Synapse AI Engineering Labs - Reproducible Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        python = pkgs.python311;
        pythonWithPackages = python.withPackages (ps: with ps; [
          openai
          tiktoken
          jupyter
          ipykernel
          pandas
          matplotlib
          requests
          python-dotenv
          qrcode
          pillow
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pythonWithPackages
            pkgs.gh # GitHub CLI for repo management
          ];

          shellHook = ''
            echo "🚀 Synapse AI Labs Environment Loaded"
            echo "Python: $(python --version)"
            echo "To start a notebook, run: jupyter notebook"
            
            # Setup local .env if it doesn't exist
            if [ ! -f .env ]; then
              echo "OPENAI_API_KEY=" > .env
              echo "⚠️  Created a blank .env file. Add your OpenAI API Key there."
            fi
          '';
        };
      });
}
