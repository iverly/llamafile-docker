# syntax=docker/dockerfile:1

ARG DEBIAN_VERSION=bullseye

################################################################################
# Use debian image as downloader image for final stage.
# https://hub.docker.com/_/debian
################################################################################
FROM debian:${DEBIAN_VERSION}-slim AS downloader

# Set working directory.
WORKDIR /download

# Install curl.
RUN apt-get update && apt-get install -y curl

# Download latest llamafile from github.
RUN curl -L -o ./llamafile https://github.com/Mozilla-Ocho/llamafile/releases/download/0.9.0/llamafile-0.9.0

# Make llamafile executable.
RUN chmod +x ./llamafile

################################################################################
# Use debian image as final image.
# https://hub.docker.com/_/debian
################################################################################
FROM debian:${DEBIAN_VERSION}-slim AS final

# Create user to run llamafile as non-root.
RUN addgroup --gid 1000 user
RUN adduser --uid 1000 --gid 1000 --disabled-password --gecos "" user

# Switch to user.
USER user

# Set working directory.
WORKDIR /usr/src/app

# Copy llamafile from downloader image.
COPY --from=downloader /download/llamafile ./llamafile

# Expose 8080 port.
EXPOSE 8080

# Set entrypoint.
ENTRYPOINT ["/bin/sh", "/usr/src/app/llamafile"]

# Set default command.
CMD ["--server", "--host", "0.0.0.0", "-m", "/model"]
