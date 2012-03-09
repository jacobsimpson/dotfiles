""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Originally downloaded from http://technotales.wordpress.com/2007/10/03/like-slime-for-vim/
"
" In a different terminal:
"   screen -S session01
"   C-a A—window01
"   Start interpreter
"
" In vim:
"   Highlight some code, C-c C-c to send to the screen session.
"

function Send_to_Screen(text)
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    call Screen_Vars()
  end

  echo system("screen -S " . g:screen_sessionname . " -p " . g:screen_windowname . " -X stuff '" . substitute(a:text, "'", "'\\\\''", 'g') . "'")
endfunction

function Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function Screen_Vars()
  if $STY == "" || stridx($STY, ".repl") < 0
      if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
        let g:screen_sessionname = ""
        let g:screen_windowname = "0"
      end

      let g:screen_sessionname = input("session name: ", "", "custom,Screen_Session_Names")
      let g:screen_windowname = input("window name: ", g:screen_windowname)
  else
    let g:screen_sessionname = "repl"
    let g:screen_windowname = "python-interp"
    echo system(printf("screen -S %s -p %s -X stuff 'python\n'", g:screen_sessionname, g:screen_windowname))
    let msg = "Starting python interpreter ."
    echon msg
    for i in range(5)
        sleep 200m
        echon "."
        let i = i - 1
    endfor
  end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <C-c><C-c> "ry :call Send_to_Screen(@r)<CR>
nmap <C-c><C-c> vip<C-c><C-c>

nmap <C-c>v :call Screen_Vars()<CR>
