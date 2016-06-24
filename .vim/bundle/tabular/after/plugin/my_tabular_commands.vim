" Provides extra :Tabularize commands

if !exists(':Tabularize')
  finish " The Tabular plugin is not loaded.
endif

AddTabularPattern! a /=>
