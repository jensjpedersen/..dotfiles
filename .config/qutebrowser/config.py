
config.load_autoconfig(False)

c.content.javascript.enabled = True
c.tabs.position = "top"

c.colors.webpage.darkmode.enabled=True
c.content.user_stylesheets = 'coolsheet.css'
c.colors.contextmenu.disabled.fg = '#808080'
c.colors.contextmenu.menu.bg = '#353535'
c.colors.contextmenu.menu.fg = '#ffffff'
c.colors.contextmenu.selected.bg = '#ea1502'


# Brave ad-block
c.content.blocking.method = 'both'


config.unbind('m', mode='normal')
config.bind('mf', 'set-mark f', mode='normal')
config.bind('md', 'set-mark d', mode='normal')
config.bind('ms', 'set-mark s', mode='normal')
config.bind('ma', 'set-mark a', mode='normal')

config.unbind('d', mode='normal')
config.bind('x', 'tab-close', mode='normal')

config.bind('x', 'tab-close', mode='normal')
config.bind('x', 'tab-close', mode='normal')

c.editor.command = ['/usr/bin/alacritty',  '--class', 'qbeditor', '-e', 'nvim', '{file}']

config.bind('<Ctrl-t>', 'edit-text', mode='insert')
config.bind('eu', 'edit-url', mode='normal')


