orig="SIZE is an integer and optional unit (example: 10M is 10*1024*1024).  Units
are K, M, G, T, P, E, Z, Y (powers of 1024) or KB, MB, ... (powers of 1000).

Using color to distinguish file types is disabled both by default and
with --color=never.  With --color=auto, ls emits color codes only when
standard output is connected to a terminal.  The LS_COLORS environment
variable can change the settings.  Use the dircolors command to set it."

a="SIZE is an integer and optional unit (example: 10M is 10*1024*1024).  Units
are K, M, G, T, P, E, Z, Y (powers of 1024) or KB, MB, ... (powers of 1000)"

b="SXXXXXXXXIZE is an integer and optional unit (example: 10M is 10*1024*1024).  Units
are K, M, G, T, P, E, Z, Y (powers of 1024) or KB, MB, ... (powers of 1000)"

c="SIZE is an integer and optional unit (example: 10M is 10*1024*1024).  Units
arXXXXXXXXXXXXXXX K, M, G, T, P, E, Z, Y (powers of 1024) or KB, MB, ... (powers of 1000)"

d="SIZE is an integer and optional unit (example: 10M is 10*1024*1024).  Units
with --color=never.  With --color=auto, ls emits color codes only when
are K, M, G, T, P, E, Z, Y (powers of 1024) or KB, MB, ... (powers of 1000)"

echo "$orig" #: output:"$a"
echo "$orig" #: output:"$b"
echo "$orig" #: output:"$c"
echo "$orig" #: output:"$d"
