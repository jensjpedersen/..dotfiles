# General
config.load_autoconfig(False)
c.content.javascript.enabled = True
c.tabs.position = "top"
c.zoom.default = "125%"

# Search engines

# c.url.searchengines = ''
c.url.searchengines = {"DEFAULT": "https://search.brave.com/search?q={}", 
                       "x": "https://paulgo.io/search?q={}",
                       "s": "https://www.semanticscholar.org/search?q={}&sort=relevance", 
                       "w": "https://en.wikipedia.org/wiki/{}", 
                       "r": "https://www.reddit.com/search/?q={}",
                       "t": "https://www.deepl.com/translator#nb/en/{}",
                       }

# Styling
## Dark mode
c.colors.webpage.darkmode.enabled=True
# c.colors.webpage.darkmode.algorithm = 'lightness-hsl'
# c.colors.webpage.darkmode.contrast = -.022
# c.colors.webpage.darkmode.threshold.text = 150
# c.colors.webpage.darkmode.threshold.background = 100
# c.colors.webpage.darkmode.policy.images = 'always'
# c.colors.webpage.darkmode.grayscale.images = 0.35


c.content.user_stylesheets = 'colorsheet.css'
c.colors.contextmenu.disabled.fg = '#808080'
c.colors.contextmenu.menu.bg = '#353535'
c.colors.contextmenu.menu.fg = '#ffffff'
c.colors.contextmenu.selected.bg = '#ea1502'

# Brave ad-block
c.content.blocking.method = 'both'

# Vimlike marks
config.unbind('m', mode='normal')
config.bind('mf', 'set-mark f', mode='normal')
config.bind('md', 'set-mark d', mode='normal')
config.bind('ms', 'set-mark s', mode='normal')
config.bind('ma', 'set-mark a', mode='normal')

# Close tab
config.unbind('d', mode='normal')
config.bind('x', 'tab-close', mode='normal')

# Tab navigation

## last tab
config.bind('<Ctrl-l>', 'tab-focus last', mode='normal')

# next/prev tab
config.bind('E', 'tab-prev')
config.bind('R', 'tab-next')
# config.bind('<Shift>-k', 'tab-prev')
# config.bind('<Shift>-j', 'tab-next')

# Passthrough
# config.bind('<Ctrl-v>', 'enter-mode passthrough', mode='normal')

# External editor
c.editor.command = ['/usr/bin/alacritty',  '--class', 'qbeditor', '-e', 'nvim', '{file}']

config.bind('eu', 'edit-url', mode='normal')

# User scripts
config.bind('I', 'spawn --userscript open_in_nvim.sh', mode='normal')
config.bind('ø', 'spawn --userscript quick_search.sh', mode='normal')
config.bind('<Ctrl-s>', 'spawn --userscript nvim_append_clipboard.sh', mode='normal')

config.bind('pf', 'hint links spawn --detach mpv {hint-url}')
config.bind('pd', 'hint links spawn yt-dlp {hint-url}')


# Insert mode bindings
# paste text
config.bind('<Ctrl-v>', 'insert-text {primary}', mode='insert')
# delte word

# Fix copy button in codeblocks
# Enable javascript can access clipboard
c.content.javascript.clipboard = "access"



