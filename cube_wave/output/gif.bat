SET /a count=126
for /l %%a in (1,1,%count%) do call set "Myvar=%%Myvar%% gif-%%a.gif"
gifsicle -d 3 -k 256 -O3 -l %Myvar% > anim.gif