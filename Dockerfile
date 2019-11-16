FROM ubuntu:18.04

LABEL maintainer="junion-org"

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        locales \
        tzdata \
        curl \
        python3.7-dev \
        python3.7-distutils \
        texlive-lang-cjk \
        xdvik-ja \
        evince \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        make \
    && ln -s /usr/bin/python3.7 /usr/local/bin/python \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py \
    && pip install sphinx sphinx-rtd-theme \
    && locale-gen ja_JP.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8" \
    TZ="Asia/Tokyo"