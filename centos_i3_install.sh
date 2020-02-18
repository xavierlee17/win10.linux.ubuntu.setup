yum install -y epel-release xterm
yum update -y && yum upgrade -y
yum groupinstall "X Window System" "Desktop" "Desktop Platform" -y
yum install -y dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts
yum install -y i3
echo "exec i3" > ~/.xinitrc
