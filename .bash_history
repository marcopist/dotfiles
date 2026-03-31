sudo dnf install ranger
ranger
sudo dnf install emacs
emacs
sudo dnf install spotify
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
spotify
flatpak install flathub com.stremio.Stremio
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update && sudo dnf install code # or code-insiders
code
sudo dnf install code
code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update && sudo dnf install code # or code-insiders
dnf check-update
sudo dnf install code
dnf install easyeffects
sudo dnf install easyeffects
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
hostnamectl set-hostname yoga
sudo reboot now
tailscale
tailscale whois
sudo dnf install easyeffects
easyeffects
pkill zoom
sudo reboot now
ssh qat1
rpm -qa
rpm -qa | grep -i zoom
sudo dnf remove zoom-6.7.5.6891-1.x86_64
sudo dnf remove zoomvdi-universal-plugin-6.6.11.26890_centos-1.x86_64
flatpak install flathub us.zoom.Zoom
rpm -qa | grep -i icaclient
 
subscription-manager repos --enable codeready-builder-for-rhel-10-$(arch)-rpms && dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
subscription-manager repos --enable codeready-builder-for-rhel-10-$(arch)-rpms && sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
sudo subscription-manager repos --enable codeready-builder-for-rhel-10-$(arch)-rpms && sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
sudo subscription-manager repos --enable codeready-builder-for-rhel-10-$(arch)-rpms
dnf config-manager --set-enabled crb && dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
sudo subscription-manager repos --enable codeready-builder-for-rhel-10-$(arch)-rpms
yum
yum localinstall '/home/marcopist/Downloads/ICAClient-rhel-25.08.10.111-0.x86_64(1).rpm' 
sudo dnf groupinstall "Virtualization"
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $(whoami)
sudo dnf install @virtualization
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $(whoami)
dnf group list
sudo reboot now
virt-manager
sudo reboot now
ls -z '/home/marcopist/Downloads/ubuntu-24.04.4-desktop-amd64.iso' 
ls -Z '/home/marcopist/Downloads/ubuntu-24.04.4-desktop-amd64.iso' 
sudo chcon -t virt_content_t /home/marcopist/Downloads
ruff 
ruff check --fix
quit
exit
wl-paste
wl-paste > .emacs.d/init.el
emacs
curl -LsSf https://astral.sh/uv/install.sh | sh
uv
mkdir developer
uv init misc-prep
cd miscprep
cd misc-prep
ls -lah
uv venv
uv add numpy
emacs main.py
uv pip install ruff
source .venv/bin/activate
emacs main.py 
emacs main.py &
ruff check --fix
deactivate
cd ..
sudo dnf remove emacs
dnf search emacs
dnf search emacs-pgtk
sudo dnf install emacs-pgtk
emacs
sudo dnf install opencode
curl -fsSL https://opencode.ai/install | bash
emacs .emacs.d/init.el 
ranger
mkdir -p .config/ranger
emacs .config/ranger/rc.conf
ranger
emacs
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip -d FiraCode
mkdir -p ~/.local/share/fonts
cp FiraCode/*.ttf ~/.local/share/fonts/
fc-cache -fv
ranger
emacs
curl -sS https://starship.rs/install.sh | sh
cd ..
wl-paste >> .bashrc 
exec bash
mkdir -p ~/.config && touch ~/.config/starship.toml
emacs ~/.config/starship.toml 
exec bash
wl-paste > .config/starship.toml
echo ciao
sudo lshw -C display
sudo dnf install lshw
sudo lshw -C display
xrandr | wl-copy
ssh qat1
cat .bash_history | grep citadel
scp marcopist@qat1:~/.openclaw/workspace/topics/citadel-interview .
scp marcopist@qat1:~/.openclaw/workspace/topics/citadel-interview.md .
cat citadel-interview.md | wl-copy 
ssh qat1
ffmpeg
ffmpeg --help
ls
ffmpeg Downloads/IMG_3306.{heif,jpeg}
ffmpeg Downloads/IMG_3306.heif Downloads/propic.jpeg
ffmpeg -i Downloads/IMG_3306.heif Downloads/propic.jpeg
ffmpeg -i Downloads/IMG_3306.heif Downloads/propic.jpeg | wl-copt
ffmpeg -i Downloads/IMG_3306.heif Downloads/propic.jpeg | wl-copy
ffmpeg -i Downloads/IMG_3306.heif Downloads/propic.jpeg | tee wl-copy 
ffmpeg -i Downloads/IMG_3306.heif Downloads/propic.jpeg 2>&1 | wl-copy
ffmpeg -i Downloads/IMG_3306.heif Downloads/propic.jpeg 2>&1 | tee wl-copy
heif-convert Downloads/IMG_3306.heif Downloads/propic.jpg
heif-convert Downloads/IMG_3306.heif Downloads/propic.jpg | tee wl-copy 
heif-convert Downloads/IMG_3306.heif Downloads/propic.jpg 2>&1 | tee wl-copy 
heif-convert Downloads/IMG_3306.heif Downloads/propic.jpg 2>&1 | tee > wl-copy 
heif-convert Downloads/IMG_3306.heif Downloads/propic.jpg 2>&1 | wl-copy 
emacs
emacs -d
emacs -nw
Ciao
emacs --daemon
emacsclient -t
emacsclient -g
emacsclient -c
emacsclient -t
sudo dnf install kitty
kitty
mkdir -p ~/.config/kitty
nano ~/.config/kitty/kitty.conf
emacs -nw ~/.config/kitty/kitty.conf
pwd
mkdir -p developer/fi
cd developer/fi/ 
cargo
exit
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cd developer/fi
cargo init .
exec bash
cargo init .
rm -rf ./*
ls
ls -lah
rm -rf .git .gitignore 
ls -lah
cargo --help
cargo init --help
cargo init --lib .
rust-analyzer 
rustup component add rust-analyzer
rust-analyzer 
ssh qat1
pkill emacs
ps | grep emacs
cd ..
rust-analyzer 
rust-analyzer --version
ps -aux
ps -aux | grep emacs
ps -aux | grep emacsserver
whic rust-analyzer
which rust-analyzer
echo $PATH 
cd fi
cargo add chrono
cargo check
ssh qat1
cd developer/fi/
cargo check
[A
cargo check
exixt
exit
sudo dnf install okular
okular
mkdir citadel
touch accomplishments.txt
nvim accomplishments.txt 
cat accomplishments.txt | wl-copy 
nvim accomplishments.txt 
cd numpy
nvim
exit
cd nvim
cd numpy/
python -c "import numpy, sys; sys.exit(numpy.test() is False)"
uv venv
uv pip install -e .
spin
cd ..
git clone --recurse-submodules https://github.com/your-username/numpy.git
rm -rf numpy/
git clone --recurse-submodules https://github.com/your-username/numpy.git
exit
toggle_layout
tmux ls
tmux -h
tmux --help
tmux new -s linux
cd ..
ls
pwd
cd ..
mv linux ~/developer/
mv ~/linux ~/developer/
cd ~
ls
ls -lah
cd developer/
cd ..
tmux new -s nvim-config
tmux ls
tmux -s linux
tmux -a linux
tmux attach -t linux
tmux attach -t nvim-config
cd developer/
git clone https://github.com/numpy/numpy.git
tmux new -s numpy
exit
cd developer
mkdir learn-c
cd learn-c
nvim src/main.c
nvim 
exit
clangd
exit
tmux new -s learn-c
tmux attach -t learn-c
opencode
cd .config/nvim
ls
rm lazy-lock.json 
opencode
nvim ~/.config/nvim/init.lua 
nvim
cd developer
git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
cd linux
nvim
nvim kernel/time/timeconv.c
nvim
cd developer/learn-c/
nvim
ls -lah
touch src/main.c
touch -p src/main.c
touch --help
mkdir src
touch -p src/main.c
touch src/main.c
nvim src/main.c 
reboot
ls .config/
mkdir -p .config/nvim
nvim
cd developer/
cd ~/.config/nvim/
opencode
nvim init.lua 
opencode
exit
gcc
nvim ~/.config/nvim/init.lua 
nvim --version
nvim .tmux.conf
tmux source-file .tmux-conf
mv .tmux.conf .tmux-conf
tmux source-file .tmux-conf
exit
