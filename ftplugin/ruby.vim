if executable('rubocop')
  " autocmd BufWritePost *.rb :RuboCop
  let g:vimrubocop_extra_args = '-D'
endif
