FROM baneeishaque/gp-vnc-pcman-zsh-as-gh-chrome-idea-pycharm-conda3-hb-scrcpy-r-jupyter-lfs-7z-zilla-gram-matlab-mysql

ARG phpStormDownloadUrl="https://download.jetbrains.com/webide/PhpStorm-2021.1.2.tar.gz"
ARG phpStormInstallationFile="PhpStorm-2021.1.2.tar.gz"

RUN cd $HOME \
 && wget $phpStormDownloadUrl \
 && sudo tar -xvf $phpStormInstallationFile -C /usr/local/ \
 && rm $phpStormInstallationFile

RUN mkdir -p ~/.config/JetBrains/PhpStorm2021.1 \
 && cp /usr/local/PhpStorm-211.7142.44/bin/phpstorm64.vmoptions ~/.config/JetBrains/PhpStorm2021.1/ \
 && echo "-Dsun.java2d.xrender=false" >> ~/.config/JetBrains/PhpStorm2021.1/phpstorm64.vmoptions

RUN brew install wget midnight-commander
ENV PATH=/home/linuxbrew/.linuxbrew/Cellar/wget/1.21.1/bin:/home/linuxbrew/.linuxbrew/Cellar/midnight-commander/4.8.26/bin:$PATH

RUN cd $HOME \
 && sudo apt update \
 && sudo apt install -y \
     wget2 aria2 unrar \
 && aria2c https://go.microsoft.com/fwlink/?LinkID=760868 \
 && sudo apt install -y \
     ./code_*_amd64.deb \
 && rm code_*_amd64.deb \
 && sudo apt update \
 && sudo apt install -y \
     code-insiders \
 && sudo rm -rf /var/lib/apt/lists/*

ARG webStormDownloadUrl="https://download.jetbrains.com/webstorm/WebStorm-2021.1.2.tar.gz"
ARG webStormInstallationFile="WebStorm-2021.1.2.tar.gz"

RUN cd $HOME \
 && wget $webStormDownloadUrl \
 && sudo tar -xvf $webStormInstallationFile -C /usr/local/ \
 && rm $webStormInstallationFile

RUN mkdir -p ~/.config/JetBrains/WebStorm2021.1 \
 && cp /usr/local/WebStorm-211.7442.26/bin/webstorm64.vmoptions ~/.config/JetBrains/WebStorm2021.1/ \
 && echo "-Dsun.java2d.xrender=false" >> ~/.config/JetBrains/WebStorm2021.1/webstorm64.vmoptions
 