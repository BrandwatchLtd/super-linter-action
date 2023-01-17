FROM github/super-linter:slim-v4.7.3
COPY rules/ /rules/
COPY entrypoint.sh /entrypoint.sh

# We only want VALIDATE_DOCKERFILE_HADOLINT, which is enabled by default
ENV VALIDATE_DOCKERFILE=false
ENV VALIDATE_KUBERNETES_KUBEVAL=false
ENV VALIDATE_JSCPD=false
ENV VALIDATE_PYTHON_BLACK=false
ENV  VALIDATE_JAVASCRIPT_STANDARD=false

CMD ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
