# Pull the base image
FROM alpine:3.13.10 AS base

# Run the Scripts
RUN apk -U upgrade --no-cache && rm -rf /var/cache/apk/*

# Add all changes to scratch image
FROM scratch AS final

# Copy all files
COPY --from=base / /

# Set locales
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Initial Command to run the container
CMD ["/sbin/init"]
