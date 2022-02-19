# ![Visual Studio Code Commitizen Support](https://img.shields.io/chocolatey/v/vscode-commitizen.svg?label=Visual%20Studio%20Code%20Commitizen%20Support&style=for-the-badge)](https://community.chocolatey.org/packages/vscode-commitizen)

This vscode extension adds [commitizen support](https://github.com/commitizen).

## Usage

- Open the command panel (`ctrl+shift+p` or `command+shift+p`) and type 'conventional commit'.
- Select the command and answer the questions afterwards (type, scope, subject, body, breaking changes, closed issues).
- After the closed issues the commit is done automatically.
- **Note**: During answering the questions just hit `ESC`to cancel the commit.

## Configuration

To configure this extension follow [cz-customizable](https://github.com/leonardoanalista/cz-customizable) and
create the required config file. This also read by this extension if configured.

To determine what config to use, the extention will look for a config file in the following places:

1. a `.cz-config.js` in the root directory
2. in `package.json` to determine the path to the config file:

```json
"config": {
  "cz-customizable": {
    "config": "test.js"
  }
}
```

3. use the default config
