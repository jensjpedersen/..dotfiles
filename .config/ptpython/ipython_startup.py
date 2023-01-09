import IPython
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

pd.set_option('display.max_rows', 2000)
pd.set_option('display.max_columns', 2000)

ip = IPython.terminal.interactiveshell.TerminalInteractiveShell()
# IPython.get_ipython().run_line_magic('reload_ext', 'autoreload')
# IPython.get_ipython().run_line_magic('autoreload', 2)
ip.run_line_magic('reload_ext', 'autoreload')
ip.run_line_magic('autoreload', 2)
