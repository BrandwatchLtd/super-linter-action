FROM github/super-linter
COPY rules/ /rules/
COPY entrypoint.sh /entrypoint.sh
CMD ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]