## This module maintains the global variables that represent the main app's
## current state.  This helps avoids import cycles.

import {ReactiveVar} from 'meteor/reactive-var'

export currentRoom = new ReactiveVar  # Room object for current room
export currentPage = new ReactiveVar  # Page object for current page
## `currentPageId` is the primary source that causes currentPage to update.
## Set it to change pages.
export currentPageId = new ReactiveVar

export currentTool = new ReactiveVar 'pan'
export historyMode = new ReactiveVar false

## These colors are initialized in ./tools/color.coffee:
export currentColor = new ReactiveVar
export currentFill = new ReactiveVar
export currentFillOn = new ReactiveVar

## Initialized in ./tools/font.coffee:
export currentFontSize = new ReactiveVar

export mainBoard = null
export historyBoard = null

export setMainBoard = (board) -> mainBoard = board
export setHistoryBoard = (board) -> historyBoard = board

export currentBoard = ->
  if historyMode.get()
    historyBoard
  else
    mainBoard
