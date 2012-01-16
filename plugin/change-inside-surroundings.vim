" change-inside-surroundings.vim - Single command to change the contents of
" the innermost surroundings
" Maintainer:   Brian Doll <http://emphaticsolutions.com/>
" Version:      0.1

function! s:ChangeInsideSurrounding()
  " define 'surrounding' opening characters that we want to be able to change
  let surrounding_beginnings = ['{', '(', '"', '>', '[']
  let cursor_position = col('.')
  let line = getline('.')
  " walk the line backwards looking for the innermost 'surrounding' opening character
  while cursor_position > 0
    let char = line[cursor_position-1]
    let matched_beginning_index = index(surrounding_beginnings, char)
    if matched_beginning_index > -1
      if '>' == char
        " vim already understands HTML and XML tags so use that
        execute "normal! cit"
      else
        " change the text inside the 'surrounding' we found
        execute "normal! ci" . char
      endif
      " move one char right of that opening character
      execute "normal! l"
      " go into insert mode (statinsert! positioned the cursor after the
      " surrounding entirely)
      startinsert
      return
    endif
    let cursor_position -= 1
  endwhile
endfunction

command! ChangeInsideSurrounding :call <sid>ChangeInsideSurrounding()
nmap <script> <silent> <unique> <Leader>ci :ChangeInsideSurrounding<CR>
