FROM github/super-linter
COPY rules/ /rules/
COPY entrypoint.sh /entrypoint.sh

# We only want VALIDATE_DOCKERFILE_HADOLINT, which is enabled by default
ENV VALIDATE_DOCKERFILE=false

CMD ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]