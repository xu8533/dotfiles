config = config
c = c

config.load_autoconfig()

c.tabs.background = True
c.new_instance_open_target = 'window'
# c.spellcheck.languages = ['en-US']

c.url.searchengines['rfc'] = 'https://tools.ietf.org/html/rfc{}'
c.url.searchengines['pypi'] = 'https://pypi.org/project/{}/'
c.url.searchengines['qb'] = 'https://github.com/The-Compiler/qutebrowser/issues/{}'
c.url.searchengines['github'] = 'https://github.com/{}'
c.url.searchengines['btc'] = 'https://www.baidu.com/{}'
c.url.searchengines['maps'] = 'https://www.google.com/maps?q=%s/{}'


# c.fonts.tabs = '8pt monospace'
# c.fonts.statusbar = '8pt monospace'
# c.fonts.web.family.fantasy = 'CaskaydiaCove Nerd Font Mono'
c.fonts.web.family.fantasy = '更纱黑体 UI SC'
c.fonts.web.size.default = 18 # webpage
c.fonts.default_size = '16pt' # UI

c.search.incremental = False
c.editor.command = ['kitty', '--title=qutebrowser-editor', 'nvim', '{file}', '-c', 'normal {line}G{column0}l']

# 文件管理器
c.fileselect.folder.command = ['kitty', '--title=qutebrowser-fileselect', 'lf', '--choosedir={}']
c.fileselect.folder.command = ['kitty', '--title=qutebrowser-fileselect', 'lf', '--choosedir={}']
c.fileselect.multiple_files.command = ['kitty', '--title=qutebrowser-fileselect', 'lf', '--choosefiles={}']
c.fileselect.single_file.command = ['kitty', '--title=qutebrowser-fileselect', 'lf', '--choosefiles={}']

c.url.start_pages = 'file:///dev/null'
c.url.default_page= 'file:///dev/null'
# c.url.start_pages = ["https://www.archlinuxcn.org/"]
# c.url.start_pages.append("https://www.baidu.com/")

c.zoom.default = 150
c.zoom.levels = ["25%", "33%", "50%", "67%", "75%", "90%", "100%", "125%", "133%", "150%", "175%", "200%", "250%", "300%"]

c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.bg = '#191919' # fix darkmode white flash

c.content.javascript.enabled = True

c.downloads.location.directory = "~/下载"
c.downloads.position = "bottom"

c.content.fullscreen.window = True # Limit fullscreen to browser window
c.content.blocking.enabled = True

# privacy
c.content.canvas_reading = False
c.content.geolocation = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.completion.open_categories = ['filesystem']

# c.content.proxy = "http://127.0.0.1:1095"

# 默认情况下 qutebrowser 是使用英语的，这会导致很多网页也使用英语呈现
c.content.headers.accept_language = "zh-CN;q=0.9,en-US,en;q=0.8"

# 修改一下 hint 的外观已经备选的字母
# 默认情况下这些字母只有 hjkl 那一行，这里我选择增加一行
c.hints.padding = {"bottom": 1, "left": 5, "right": 3, "top": 1}
# c.hints.chars = "asdfghjklzxcvbnm"
c.hints.border = "none"

# 启用平滑滚动（只针对 hjkl 生效）
c.scrolling.bar = "always"
c.scrolling.smooth = True

# 修改底部状态栏的大小并精简呈现的内容
c.statusbar.padding = {"bottom": 2, "left": 0, "right": 5, "top": 2}
c.statusbar.widgets = ["search_match", "text:|", "url", "text:|", "scroll"]

# 增加顶部标签栏的大小
c.tabs.padding = {"bottom": 5, "left": 10, "right": 10, "top": 5}

# 添加主题
config.source("themes/theme.py")

# 快捷键
config.source("keybindings.py")
