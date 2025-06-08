FROM alpine:latest

# Install required packages
RUN apk add --no-cache \
    dante-server \
    wireguard-tools \
    iproute2 \
    iptables \
    curl \
    procps \
    openresolv

# Copy configs and start script
COPY danted.conf /etc/danted.conf
COPY wg0.conf /etc/wireguard/wg0.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose Dante ports
EXPOSE 1080/tcp 1080/udp

CMD ["/start.sh"]
