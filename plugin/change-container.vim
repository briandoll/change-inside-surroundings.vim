" change-container.vim - Single command to change the innermost container
" Maintainer:   Brian Doll <http://emphaticsolutions.com/>
" Version:      0.1

function! s:ChangeContainer()
  " define 'container' opening characters that we want to be able to change
  let container_beginnings = ['{', '(', '"', '>', '[']
  let cursor_position = col('.')
  let line = getline('.')
  " walk the line backwards looking for the innermost 'container' opening character
  while cursor_position > 0
    let char = line[cursor_position-1]
    let matched_beginning_index = index(container_beginnings, char)
    if matched_beginning_index > -1
      if '>' == char
        " vim already understands HTML and XML tags so use that
        execute "normal cit"
      else
        " change inside the text object as defined by the 'container' we found
        execute "normal ci" . char
      endif
      " move one char right of that opening container character
      execute "normal l"
      " go into insert mode (statinsert! positioned the cursor after the
      " container entirely)
      execute "startinsert"
      return
    endif
    let cursor_position -= 1
  endwhile
endfunction

command! ChangeContainer :call s:ChangeContainer()
nmap <script> <silent> <unique> <Leader>ci :ChangeContainer<CR>
