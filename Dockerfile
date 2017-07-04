FROM ubuntu:17.04
RUN apt-get update -y && apt-get install software-properties-common -y
RUN apt-add-repository -y ppa:brightbox/ruby-ng && apt-get update -y
RUN apt-get install build-essential ruby2.4 ruby2.4-dev -y
RUN update-alternatives --set ruby /usr/bin/ruby2.4
RUN update-alternatives --set gem /usr/bin/gem2.4
RUN gem update --system
RUN gem install bundler
RUN apt-get install git sqlite3 libsqlite3-dev redis-tools libpq-dev postgresql-client -y
RUN apt-get install libxml2 libxml2-dev libxslt1-dev -y
RUN apt-get install libncurses5-dev -y
RUN apt-get install nodejs -y
RUN apt-get install imagemagick -y
RUN apt-get install wget -y # because even docker images need some help
RUN kindlegen_tarball=kindlegen_linux_2.6_i386_v2_9.tar.gz && wget -q http://kindlegen.s3.amazonaws.com/$kindlegen_tarball && tar xzf $kindlegen_tarball kindlegen && mv kindlegen /usr/local/bin && rm $kindlegen_tarball
RUN apt-get install locales -y
RUN locale-gen "en_US.UTF-8"
RUN update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
