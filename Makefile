test: lua txt

lua:
	ruby diff.rb test/old.lua 
	ruby diff.rb test/old.lua test/new.lua

txt:
	ruby diff.rb test/old.txt
	ruby diff.rb test/old.txt test/new.txt

rb:
	ruby diff.rb test/old.rb
	ruby diff.rb test/old.rb test/new.rb
