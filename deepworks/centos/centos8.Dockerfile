# Pull the base image
FROM centos:8.4.2105 AS base

# Run commands
RUN \
    # Set the repositories to CentOS8-Stream
    dnf --disablerepo '*' --enablerepo extras swap -y centos-linux-repos centos-stream-repos && \
    # Fix vulnerabilities by updating specific packages
    dnf --setopt=install_weak_deps=False -y update && \
    # Delete cached files we don't need anymore:
    dnf clean all

# Add all changes to scratch image
FROM scratch AS final

# Copy all files
COPY --from=base / /

# Set locales
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Initial Command to run the container
CMD ["/usr/sbin/init"]
