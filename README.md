change-container.vim
==============

change-container.vim provides a single command `:ChangeContainer` (also
accessible via `<leader>ci`) that will change the innermost container.

Examples
--------

Vim already provides fairly easy ways to change the 'container' as long
as you specify the opening container character.  Vim also understands HTML
and XML tags, so you can change inside those as well.  I wanted a _single_
command that would intelligently just _do the right thing_.

Change inside an HTML tag:

* Given: `<div>London Calling</div>`
* To replace the contents of the div tag I can use: `cit`

Change inside curly braces:

* Given: `{ death: "or glory!" }`
* To replace the contents of the curly braces I can use: `ci{`

Change inside brackets:

* Given: `[ Clampdown those Spanish Bombs ]`
* To replace the contents of the square brackets I can use: `ci[`

Change inside quotes:

* Given: `"The Guns of Brixton"`
* `To replace the contents of the quotes I can use: <code>ci"</code>

**This plugin provides a single command that works for all of these examples.**


Use: `:ChangeContainer` or `<leader>ci` and vim will remove the contents of the innermost container, leaving you in insert mode.


Installation
------------

If you're using [pathogen.vim](https://github.com/tpope/vim-pathogen), just
copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/briandoll/change-container.vim.git


License
-------

Copyright (c) Brian Doll.  Distributed under the same terms as Vim itself.
See `:help license`.
