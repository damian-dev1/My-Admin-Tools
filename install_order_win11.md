### **System Setup**

1.  **Update Windows**
    
2.  **Enable WSL and Virtual Machine Platform**
    

```powershell
wsl --install
```

3.  **Set WSL2 as default**

```powershell
wsl --set-default-version 2
```

4.  **Install Linux distro (Ubuntu recommended)**

```powershell
wsl --install -d Ubuntu
```

5.  **Update & Upgrade packages (inside WSL)**

```bash
sudo apt update && sudo apt upgrade -y
```

* * *

### **CLI Tools**

6.  **Install Git**

```bash
sudo apt install git -y
```

7.  **Generate SSH keys**

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

8.  **Install Curl, Wget, unzip, build-essential, etc.**

```bash
sudo apt install curl wget unzip build-essential -y
```

9.  **Install Zsh & Oh My Zsh (optional)**

```bash
sudo apt install zsh -y && chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

10. **Install bat, htop, jq, tree, tmux, neofetch, etc.**

```bash
sudo apt install bat htop jq tree tmux neofetch -y
```

* * *

### **Python Development**

11. **Install pyenv**

```bash
curl https://pyenv.run | bash
```

Add to `.zshrc` or `.bashrc`:

```bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
```

12. **Install Python versions**

```bash
pyenv install 3.12.3
pyenv global 3.12.3
```

13. **Install pipx and virtualenv**

```bash
python -m pip install --upgrade pip
python -m pip install --user pipx
pipx ensurepath
python -m pip install virtualenv
```

* * *

### **Cloud CLI Tools**

14. **AWS CLI**

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip && sudo ./aws/install
```

15. **Azure CLI**

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

16. **GCP CLI**

```bash
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update && sudo apt install google-cloud-sdk -y
```

* * *

### 💻 **Programming Languages**

17. **Node.js (via nvm)**

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts
```

18. **Java (OpenJDK)**

```bash
sudo apt install openjdk-17-jdk -y
```

19. **Go**

```bash
sudo apt install golang-go -y
```

20. **Rust**

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
``>

---

### 🧪 **Dev Tools**
21. **Docker Desktop (Windows) + Docker CLI in WSL**
```bash
sudo apt install docker.io -y
sudo usermod -aG docker $USER
```

> Ensure Docker Desktop is installed on Windows with WSL integration enabled

22. **PostgreSQL**

```bash
sudo apt install postgresql postgresql-contrib -y
```

23. **MongoDB**

```bash
sudo apt install mongodb -y
```

24. **Redis**

```bash
sudo apt install redis-server -y
```

* * *

### **Dev Utilities & Frameworks**

25. **Install pip packages**

```bash
pip install black flake8 isort mypy pytest requests fastapi uvicorn jupyter
```

26. **Install Node packages**

```bash
npm install -g eslint prettier typescript create-react-app
```

27. **Install Flask/Django (optional)**

```bash
pip install flask django
```

* * *

### **Editors and IDEs (Windows-side)**

28. **VS Code (with Remote - WSL extension)**

- Install from [https://code.visualstudio.com](https://code.visualstudio.com/)
    
- Install extension: `ms-vscode-remote.remote-wsl`
    

* * *

### **Optional Tools**

29. **Install Terraform**

```bash
sudo apt install gnupg software-properties-common -y
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

30. **Install Ansible**

```bash
sudo apt install ansible -y
```

* * *

### **Final Touches**

31. **Dotfiles (optional)**

```bash
git clone https://github.com/YOURUSERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

32. **Set up aliases, PATH, and shortcuts in `.zshrc` or `.bashrc`**
    
33. **Backup WSL image (optional)**
    

```powershell
wsl --export Ubuntu ubuntu-backup.tar
```

* * *

&nbsp;
