FROM ckleinsc/baseimage-kasmvnc-python

# environment settings
ENV \
       TITLE="MangaManager" \
       GIT_REPO="https://github.com/MangaManagerORG/Manga-Manager" \
       GIT_BRANCH="main"

# install system dependencies
RUN add-apt-repository main
RUN apt-get install -y \
       unzip \
       unrar \
       python3-tk \
       idle3

# install MangaManager
WORKDIR /app
RUN git clone -b $GIT_BRANCH $GIT_REPO .
# fix build error with numpy~=1.24.2 and python 3.12
RUN pip install numpy
RUN mv requirements.txt temp && grep -vwE "numpy" temp > requirements.txt
RUN pip install -r requirements.txt

# clean up
RUN  apt-get remove -y \
       gcc \
       cmake \
       git \
       python3-pip \
       python3-dev
RUN  apt-get clean && \
       rm -rf \
              /tmp/* \
              /var/lib/apt/lists/* \
              /var/tmp/*

# set autostart default
RUN echo "python3 /app/MangaManager/main.py" >  /defaults/autostart
