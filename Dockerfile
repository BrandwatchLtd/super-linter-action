FROM github/super-linter:v3.15.1
COPY rules/ /rules/
COPY entrypoint.sh /entrypoint.sh

# We only want VALIDATE_DOCKERFILE_HADOLINT, which is enabled by default
ENV VALIDATE_DOCKERFILE=false

CMD ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
