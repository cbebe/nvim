" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

lua require 'filetypes.nu'

" vim: ts=2 sts=2 sw=2 et
