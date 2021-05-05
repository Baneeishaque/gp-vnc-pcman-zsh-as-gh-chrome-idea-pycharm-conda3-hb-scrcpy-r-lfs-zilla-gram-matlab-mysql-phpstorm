FROM baneeishaque/gp-vnc-pcman-zsh-as-gh-chrome-idea-pycharm-conda3-hb-scrcpy-r-jupyter-lfs-7z-zilla-gram-matlab-mysql

ARG phpstormDownloadUrl="https://download.jetbrains.com/webide/PhpStorm-2021.1.2.tar.gz"
ARG phpstormInstallationFile="PhpStorm-2021.1.2.tar.gz"

RUN cd $HOME \
 && wget $phpstormDownloadUrl \
 && sudo tar -xvf $phpstormInstallationFile -C /usr/local/ \
 && rm $phpstormInstallationFile

RUN mkdir -p ~/.config/JetBrains/PhpStorm2021.1 \
 && cp /usr/local/PhpStorm-211.7142.44/bin/phpstorm64.vmoptions ~/.config/JetBrains/PhpStorm2021.1/ \
 && echo "-Dsun.java2d.xrender=false" >> ~/.config/JetBrains/PhpStorm2021.1/phpstorm64.vmoptions
