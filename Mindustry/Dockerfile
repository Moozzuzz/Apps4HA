FROM ghcr.io/home-assistant/base:latest

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Install Java and system dependencies
RUN apk add  --no-cache \
    'openjdk11-jre>11.0.20' \
    'curl>8.5.0' \
    'wget>1.25.0' \
    'netcat-openbsd>1.10' \
    'python3>3.11.8' \
    'py3-pip>23.3.1' \
    'coreutils>9.11' \
    'bash>5.2.21' \
    'py3-fastapi>0.136.1' \
    'uvicorn>0.44.0' \
    'py3-websockets>16.0' \
    'py3-pydantic>2.12.5' \
    'py3-dotenv>1.2.2' \
    'py3-aiofiles>25.1.0' \
    'py3-psutil>7.2.2' \
    'py3-pyaml>6.0.3' \
    'py3-retrying>1.4.2'

# Create app directory structure
RUN mkdir -p /app /mindustry /data /config
WORKDIR /app

# Copy Python requirements first for better caching
# COPY Dockerfile-py3packages.txt .

# Install Python dependencies
# RUN pip3 install --no-cache-dir -r Dockerfile-py3packages.txt

# Copy application code
COPY app/ /app/
RUN cd /app && \
    if [ ! -f utils.py ]; then echo "Failed to copy app files"; exit 1; fi

# Download Mindustry server
RUN mkdir -p /mindustry && \
    cd /mindustry && \
    echo "Start download Mindustry-server files" && \
    wget -q https://github.com/Anuken/Mindustry/releases/latest/download/server-release.jar -O server.jar && \
    chmod +x server.jar && \
    # Verify download
    if [ ! -f server.jar ]; then echo "Failed to download server"; exit 1; fi

# Copy root filesystem (S6 overlay, scripts, etc.)
WORKDIR /
RUN mkdir -p /etc/s6-overlay/s6-rc.d/user/
COPY rootfs/ /

# Make scripts executable
RUN chmod +x /usr/bin/start-server.sh && \
    chmod +x /etc/s6-overlay/s6-rc.d/*/run 2>/dev/null || true

# Create non-root user for running the server
RUN addgroup -g 1000 mindustry && \
    adduser -u 1000 -G mindustry -h /data -s /bin/bash -D mindustry && \
    chown -R mindustry:mindustry /app /mindustry /data

# Set permissions
RUN chmod 755 /app && \
    chmod 755 /mindustry

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="aarch64|amd64" \
    io.hass.type="app"
    # io.hass.version=${BUILD_VERSION} \
    # maintainer="Moozzuzz" \
    # org.opencontainers.image.title="${BUILD_NAME}" \
    # org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    # org.opencontainers.image.vendor="Mindustry Server Addon" \
    # org.opencontainers.image.licenses="MIT" \
    # org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    # org.opencontainers.image.created=${BUILD_DATE} \
    # org.opencontainers.image.revision=${BUILD_REF} \
    # org.opencontainers.image.version=${BUILD_VERSION}

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:5000/health || exit 1

# Switch to non-root user
USER mindustry

# Expose ports
EXPOSE 5000 6567

# Volume for persistent data
VOLUME [ "/data" ]

# Entrypoint
ENTRYPOINT [ "/init" ]
