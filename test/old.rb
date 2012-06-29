require "pp"
$KCODE='u'

# テキストのdiffは、全部をばらばらに分解して、単語だけをとりだす。
class TextDiffEngine
  def initialize(oldpath,newpath)
    if oldpath then
      oldwords = []
      readFile(oldpath).split(/\W/).each do |w| 
        if w =~ /^[a-zA-Z0-9_]+$/
          oldwords.push(w) 
          p w
        end
      end
    else
      oldwords = []
    end

    newwords.each do |w|
      newcnt[w]+=1 
    end
    allwords=newcnt.keys + oldcnt.keys

  end
  def diff()
    @allcnt = @allcnt.sort do |a,b| a[1] <=> b[1] end
    return { :words => @allcnt.reverse }
  end
end
