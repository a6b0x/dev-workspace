echo "Installing network tools..."

# Detect package manager and install network utilities
if command -v apt-get >/dev/null 2>&1; then
    # Debian/Ubuntu based systems
    apt-get update -qq
    apt-get install -y --no-install-recommends \
        iputils-ping \
        dnsutils \
        curl \
        wget \
        netcat-openbsd \
        iproute2 \
        traceroute
elif command -v apk >/dev/null 2>&1; then
    # Alpine Linux based systems
    apk add --no-cache \
        iputils \
        bind-tools \
        curl \
        wget \
        netcat-openbsd \
        iproute2 \
        traceroute
else
    echo "Unsupported package manager. Please install network tools manually."
    exit 1
fi

# Clean up package cache to reduce image size
if command -v apt-get >/dev/null 2>&1; then
    apt-get clean
    rm -rf /var/lib/apt/lists/*
fi

echo "Network tools installation completed!"