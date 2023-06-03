-- PlantUmlPreviewer https://github.com/weirongxu/plantuml-previewer.vim
local PlantUmlPreviewer = {
  'weirongxu/plantuml-previewer.vim',
  dependencies = {
    'tyru/open-browser.vim',
  },
  ft = { 'uml', 'plantuml' },
  cmd = { 'PlantumlOpen', 'PlantumlSave' },
  init = function()
    vim.g['plantuml_previewer#plantuml_jar_path'] = vim.fn.matchlist(
      vim.fn.system 'cat `which plantuml` | grep plantuml.jar',
      [[\v.*\s['"]?(\S+plantuml\.jar).*]],
      1
    )
    vim.cmd [[
      augroup HanaPlantUmlPreviewer
        autocmd!
        autocmd FileType plantuml nnoremap <buffer> <silent> <CR> <Cmd>PlantumlOpen<CR>
      augroup END
    ]]
  end,
}

-- PlantUmlSyntax https://github.com/aklt/plantuml-syntax
local PlantUmlSyntax = {
  'aklt/plantuml-syntax',
  ft = { 'uml', 'plantuml' },
}

return {
  PlantUmlPreviewer,
  PlantUmlSyntax,
}
