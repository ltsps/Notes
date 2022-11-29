### Create screen session
1. screen -R c1
2. screen -dmS c1
### Enter screen session
1. screen -x c1
2. screen -r c1
3. screen -r PID.$session_name
### Exit screen session
1. Ctrl a d
### Exit and close screen session
1. exit
### Kill screen session
1. kill -9 PID
2. screen -wipe

### List screen session
1. screen -ls

### Screen key
Ctrl a ?   ## Display help information
Ctrl a c   ## Create a new shell session
Ctrl a n   ## Switch to next shell session
Ctrl a p   ## Switch to previous shell session
Ctrl a [Space] ## Cycle switch 0 to 9 shell session
Ctrl a     ## Switch two recent shell session
Ctrl a x   ## Lock current window and enter password
Ctrl a d   ## Detach temporary
Ctrl a z   ## Detach and put the session to the background
Ctrl a w   ## Display all sessions
Ctrl a t   ## Display crrent time and system load
Ctrl a k   ## Force kill current window
Ctrl a [   ## Enter copy mode like vim
	Ctrl b ## Backward, Pageup
	Ctrl f ## Forward, Pagedown
	H      ## Move the cursor to left top
	L      ## Move the cursor to lower left corner
	0      ## Move to the beginning of line
        $      ## Move to the end of line 
        w      ## Forward one word
        b      ## backward one word
        Space  ## The first press is the starting point of the marked area, and the second press is the end point
	Ecs    ## Finish copy mode
Ctrl a ]   ## Past the context just selected in copy mode
Ctrl a S   ## Vertical split screen
Ctrl a |   ## Horizontal split screen
Ctrl a tab ## Screen screen
Ctrl a x   ## Quit split

/etc/screenrc ## global configuration file
nonblock on ## 解决退格错乱问题
hardstatus on
#hardstatus alwayslastline  ##关闭最下面状态栏显示
#hardstatus string "%{.bW}%-w%{.rW}%n %t%{-}%+w %=%{..G} %H %{..Y} %m/%d %C%a "
startup_message off
termcapinfo xterm* ti@:te@
defscrollback 10000
defutf8 on
defwrap on
nonblock on
#caption always "%{= kw}%-w%{= kG}%{+b}[%n %t]%{-b}%{= kw}%+w %=%M%d 0c %{g}%H%{-}"
caption always "%{= kw}%-w%{= kG}%{+b}%n %t%{-b}%{= kw}%+w"
defencoding utf8
encoding utf8 utf8
vbell off
