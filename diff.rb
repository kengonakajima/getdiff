require "#{File.dirname(__FILE__)}/rumino/rumino"
require "#{File.dirname(__FILE__)}/lua"
require "pp"

# magics
cmdq( "ulimit -s unlimited > /dev/null 2>&1")
$KCODE='u'


#
# get code diff bitween OLDER and NEWER
#
#

oldpath,newpath = nil,nil

case ARGV.size
when 0
  p "Usage: ruby diff.rb PATH1 [PATH2]"
  exit 1
when 1
  newpath = ARGV[0]
when 2
  oldpath, newpath = ARGV[0], ARGV[1]  
end

case File.extname(ARGV[0])
when ".lua"
  l = LuaDiffEngine.new(oldpath, newpath )
  out = l.diff()
  pp out
    
else
  raise "invalid file extention:#{en}"
end


