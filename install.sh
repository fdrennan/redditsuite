apt-get update && apt-get install -y \
    gnupg \
    ca-certificates \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    libsodium-dev \
    libpq-dev

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" >> /etc/apt/sources.list

apt-get update && apt-get install -y \
    r-base \
    r-base-dev
