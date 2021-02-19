FROM github/super-linter
COPY rules/ /rules/
COPY entrypoint.sh /entrypoint.sh

ENV REVIEWDOG_VERSION=v0.10.0
ENV INPUT_CHECKSTYLE_VERSION=8.37

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

# We only want VALIDATE_DOCKERFILE_HADOLINT, which is enabled by default
ENV VALIDATE_DOCKERFILE=false

CMD ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
