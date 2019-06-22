module.exports = {
  extends: ["@commitlint/config-conventional", "@commitlint/config-angular"],
  rules: {
    "body-max-line-length": [2, "always", 100],
    "footer-max-line-length": [2, "always", 100],
    "header-max-length": [2, "always", 72]
  }
};
