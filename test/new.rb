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
    newwords = []
    readFile(newpath).split(/\W/).each do |w|
      newwords.push(w) if w =~ /^[a-zA-Z0-9_]+$/
    end
    
    oldcnt=Hash.new(0)
    oldwords.each do |w|
      oldcnt[w]+=1 
    end
    newcnt=Hash.new(0)
    newwords.each do |w|
      newcnt[w]+=1 
    end

    @allcnt=Hash.new(0)
    allwords=newcnt.keys + oldcnt.keys
    allwords.each do |w|
      next if w =~ /^_/ 
      if w.size > 1 then
        @allcnt[w] = newcnt[w] - oldcnt[w]
      end
    end
  end
  def diff()
    @allcnt = @allcnt.sort do |a,b| a[1] <=> b[1] end
    return { :words => @allcnt.reverse }
  end
end
