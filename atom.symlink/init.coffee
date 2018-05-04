# Add any auto-loaded Atom code on init here.
atom.commands.add '.tree-view', 'custom:expand-item-down': ->
  fs = require 'fs'
  item = atom.workspace.getActivePaneItem()
  atom.commands.dispatch(item.element, 'core:move-down')
  if fs.lstatSync(item.selectedPath).isDirectory()
    return
  else
    item.openSelectedEntry(pending: true, activatePane: false)
    return
atom.commands.add '.tree-view', 'custom:expand-item-up': ->
  fs = require 'fs'
  item = atom.workspace.getActivePaneItem()
  atom.commands.dispatch(item.element, 'core:move-up')
  if fs.lstatSync(item.selectedPath).isDirectory()
    return
  else
    item.openSelectedEntry(pending: true, activatePane: false)
    return
