# =========================
# Stage 1: Build stage
# =========================
FROM ubuntu:18.04 AS build
ENV DEBIAN_FRONTEND=noninteractive

# -------------------------
# Base system tools
# -------------------------
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        make \
        git \
        curl \
        ca-certificates \
        libgmp-dev \
        libncurses-dev \
        tcl \
        iverilog && \
    rm -rf /var/lib/apt/lists/*

# -------------------------
# Install ghcup + GHC 8.8.4
# -------------------------
ENV BOOTSTRAP_HASKELL_NONINTERACTIVE=1
ENV GHCUP_INSTALL_BASE_PREFIX=/opt/ghc

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

ENV PATH=/opt/ghc/.ghcup/bin:$PATH

RUN ghcup install ghc 8.8.4 && \
    ghcup set ghc 8.8.4

# -------------------------
# Install required Haskell libraries
# -------------------------
RUN apt-get update && \
    apt-get install -y \
        cabal-install \
        libghc-regex-compat-dev \
        libghc-regex-base-dev \
        libghc-syb-dev \
        libghc-mtl-dev \
        libghc-parsec3-dev \
        libghc-old-time-dev \
        libghc-old-locale-dev \
        libghc-split-dev && \
    rm -rf /var/lib/apt/lists/*

# -------------------------
# Copy and run repo dependency script
# -------------------------
ADD .github/workflows/install_dependencies_ubuntu.sh /build/
RUN chmod +x /build/install_dependencies_ubuntu.sh && \
    /build/install_dependencies_ubuntu.sh

# -------------------------
# Copy source
# -------------------------
ADD . /build/

# -------------------------
# Build and install Bluespec
# -------------------------
RUN make -C /build -j2 GHCJOBS=2 GHCRTSFLAGS='+RTS -M5G -A128m -RTS' && \
    make -C /build install-src

# =========================
# Stage 2: Runtime stage
# =========================
FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        tcl \
        iverilog && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /build/inst /opt/bluespec
ENV PATH=/opt/bluespec/bin:$PATH

CMD ["bash"]
