Comprehensive shell script to automate most of the WSL2-based developer environment setup (Python-focused, but multi-language ready). You can save this as `setup-dev-env.sh` and run it inside **WSL2 Ubuntu**.

* * *

> ⚠️ **Important**:  
> Run **Windows-side setup first**:
> 
> - Enable WSL2
>     
> - Install Ubuntu via `wsl --install -d Ubuntu`
>     
> - Install Docker Desktop and VS Code  
>     Then continue with this script **inside Ubuntu (WSL2)**.
>     

* * *

### `setup-dev-env.sh`

```bash
#!/bin/bash
set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing base tools..."
sudo apt install -y \
    git curl wget unzip build-essential \
    zsh htop jq tree tmux bat neofetch \
    software-properties-common ca-certificates gnupg lsb-release apt-transport-https

echo "Setting up Zsh and Oh My Zsh..."
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "your_email@example.com"

echo "Installing pyenv..."
curl https://pyenv.run | bash

echo "Configuring pyenv..."
echo -e '\n# Pyenv' >> ~/.zshrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
source ~/.zshrc

echo "Installing Python 3.12.3..."
pyenv install 3.12.3
pyenv global 3.12.3

echo "Installing pipx and virtualenv..."
python -m pip install --upgrade pip
python -m pip install --user pipx
pipx ensurepath
python -m pip install virtualenv

echo "Installing Node.js with NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install --lts

echo "Installing OpenJDK..."
sudo apt install -y openjdk-17-jdk

echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "Installing Go..."
sudo apt install -y golang-go

echo "Installing Docker CLI..."
sudo apt install -y docker.io
sudo usermod -aG docker $USER

echo "Installing PostgreSQL..."
sudo apt install -y postgresql postgresql-contrib

echo "installing MongoDB..."
sudo apt install -y mongodb

echo "Installing Redis..."
sudo apt install -y redis-server

echo "Installing useful Python packages..."
pip install black flake8 isort mypy pytest requests fastapi uvicorn jupyter

echo "Installing Node global packages..."
npm install -g eslint prettier typescript create-react-app

echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip && sudo ./aws/install && rm -rf awscliv2.zip aws

echo "Installing Azure CLI..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "Installing Google Cloud SDK..."
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \
    | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update && sudo apt install google-cloud-sdk -y

echo "Installing Terraform..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | \
    sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y

echo "Installing Ansible..."
sudo apt install -y ansible

echo "Setup complete! Reboot your terminal and check installed tools."
```

* * *

### Usage

1.  Save the script in Ubuntu:

```bash
nano setup-dev-env.sh
```

2.  Paste the script content and save (`Ctrl+O`, `Ctrl+X`)
    
3.  Make it executable:
    

```bash
chmod +x setup-dev-env.sh
```

4.  Run the script:

```bash
./setup-dev-env.sh
```

* * *

&nbsp;
