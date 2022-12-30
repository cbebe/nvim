" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

lua require 'filetypes.go'

" vim: ts=2 sts=2 sw=2 et
