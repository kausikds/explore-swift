# Use Ubuntu as base
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    libsqlite3-dev \
    libz-dev \
    pkg-config \
    tzdata \
    unzip \
    wget \
    clang \
    libicu-dev \
    libxml2-dev \
    libblocksruntime-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Swift
ENV SWIFT_VERSION=5.9
ENV SWIFT_PLATFORM=ubuntu22.04
RUN wget https://download.swift.org/swift-${SWIFT_VERSION}-release/${SWIFT_PLATFORM}/swift-${SWIFT_VERSION}-RELEASE-${SWIFT_PLATFORM}.tar.gz && \
    tar -xzf swift-${SWIFT_VERSION}-RELEASE-${SWIFT_PLATFORM}.tar.gz && \
    mv swift-${SWIFT_VERSION}-RELEASE-${SWIFT_PLATFORM} /swift && \
    rm swift-${SWIFT_VERSION}-RELEASE-${SWIFT_PLATFORM}.tar.gz

ENV PATH="/swift/usr/bin:${PATH}"

# Set default user
RUN useradd -m vscode
USER vscode
