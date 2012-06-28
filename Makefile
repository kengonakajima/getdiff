test: lua

lua:
	ruby diff.rb test/old.lua 
	ruby diff.rb test/old.lua test/new.lua

