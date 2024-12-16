# Pull the base image
FROM centos:7.9.2009 AS base

# Run the Updates
RUN \
    # Install dnf
    yum -y --setopt=tsflags=nodocss install dnf && \
    # Install security updates, bug fixes and enhancements only:
    dnf -y --setopt=tsflags=nodocs upgrade-minimal && \
    # Fix any vulnerabilities
    dnf --setopt=install_weak_deps=False --setopt=tsflags=nodocs -y update && \
    # 'Fix' the size issue introduced by updating glibc by reducing the size of the locale archive: 
    # See https://unix.stackexchange.com/questions/90006/how-do-i-reduce-the-size-of-locale-archive
    localedef --list-archive | grep -v -i ^en | xargs localedef --delete-from-archive && \
    mv /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl && \
    build-locale-archive && \
    # Delete cached files we don't need anymore:
    yum clean all && dnf clean all

# Add all changes to scratch image
FROM scratch AS final

# Copy all files
COPY --from=base / /

# Set locales
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Initial Command to run the container
CMD ["/usr/sbin/init"]
