require "rumino/rumino"

require "./lua"
require "pp"

# magics
cmd( "ulimit -s unlimited > /dev/null 2>&1")
$KCODE='u'


#
# get code diff bitween OLDER and NEWER
#
#

if ARGV.size != 2 then 
  p "Usage: ruby diff.rb OLDPATH NEWPATH"
  exit 1
end

oldpath, newpath = ARGV[0], ARGV[1]

olden = File.extname(oldpath)
newen = File.extname(oldpath)
if olden != newen then
  raise "file extention differs! #{oldpath}, #{newpath}"
end

case olden
when ".lua"
  l = LuaDiffEngine.new(oldpath, newpath )
  out = l.diff()
  pp out
    
when ".js"
else
  raise "invalid file extention:#{en}"
end


