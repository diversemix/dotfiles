# Install some fonts I like

apt install fonts-firacode fonts-hack fonts-monoid fonts-roboto

# Install source-code-pro

Taken from: https://gist.github.com/veggiemonk/43d81e1cbab06ed8e92a

```
mkdir -p ~/.fonts/adobe-fonts/source-code-pro
git clone https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro

```
