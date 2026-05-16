#!/usr/bin/env bash

# Synapse AI Labs Setup Script
# This script helps you set up a reproducible development environment using Nix.

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting Synapse AI Labs Setup...${NC}"

# 1. Check for Nix
if ! command -v nix &> /dev/null; then
    echo -e "${YELLOW}⚠️  Nix is not installed.${NC}"
    echo -e "Nix is required for a reproducible development environment."
    read -p "Would you like to install the Determinate Systems Nix installer? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}📦 Installing Nix...${NC}"
        curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
        
        # Source the nix profile to make it available in the current session
        if [ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
            . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        fi
        echo -e "${GREEN}✅ Nix installed successfully!${NC}"
    else
        echo -e "${RED}❌ Nix is required. Please install it manually from https://nixos.org/download and run this script again.${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}✅ Nix is already installed.${NC}"
fi

# 2. Check for direnv (Optional but recommended)
if ! command -v direnv &> /dev/null; then
    echo -e "${YELLOW}💡 Tip: Install 'direnv' (https://direnv.net/) to automatically load your environment when you enter this folder.${NC}"
else
    echo -e "${BLUE}🔄 Authorizing direnv...${NC}"
    direnv allow
fi

# 3. Initialize the Nix environment
echo -e "${BLUE}⚙️  Initializing Nix environment (this may take a few minutes on the first run)...${NC}"
nix develop --command python --version

# 4. Check for .env file
if [ ! -f .env ]; then
    echo -e "${YELLOW}📝 Creating .env file...${NC}"
    echo "OPENAI_API_KEY=" > .env
    echo -e "${YELLOW}⚠️  Action Required: Open the .env file and add your OPENAI_API_KEY.${NC}"
else
    echo -e "${GREEN}✅ .env file exists.${NC}"
fi

echo -e "\n${GREEN}🎉 Setup Complete!${NC}"
echo -e "To start your lab environment, run:"
echo -e "${BLUE}nix develop --command jupyter notebook${NC}"
echo -e "(Or just '${BLUE}jupyter notebook${NC}' if you use direnv)"
