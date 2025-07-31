<div align="center">
<img src="https://github.com/sxyazi/yazi/blob/main/assets/logo.png?raw=true" alt="Yazi logo" width="20%">
<h3>
	VSCode Light Modern Flavor for <a href="https://github.com/sxyazi/yazi">Yazi</a>
</h3>
<a>
	This <a href="https://github.com/sxyazi/yazi">Yazi</a>  flavor matches the <a href="https://code.visualstudio.com/">Visual Studio Code</a> default theme.
</a>
</div>

## 👀 Preview

<img src="./preview.png" width="600" />

## 🎨 Installation

### Yazi CLI

```bash
# v25.5.28+
ya pkg add 956MB/vscode-light-modern

# pre v25.5.28 (deprecated)
ya pack -a 956MB/vscode-light-modern
```

### Manual

```bash
# Linux/macOS
git clone https://github.com/956MB/vscode-light-modern.yazi.git ~/.config/yazi/flavors/vscode-light-modern.yazi

# Windows
git clone https://github.com/956MB/vscode-light-modern.yazi.git %AppData%\yazi\config\flavors\vscode-light-modern.yazi
```

## ⚙️ Usage

Add the these lines to your `theme.toml` configuration file to use it:

```toml
[flavor]
light = "vscode-light-modern"
```

## 📜 License

The flavor is MIT-licensed, and the included tmTheme is also MIT-licensed.

Check the [LICENSE](LICENSE) and [LICENSE-tmtheme](LICENSE-tmtheme) file for more details.
