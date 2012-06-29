require "pp"
$KCODE='u'

# テキストのdiffは、全部をばらばらに分解して、単語だけをとりだす。
class TextDiffEngine
  def wcond(w)
    return ( w =~ /^[a-zA-Z0-9_]+$/  and w =~ /\D/ and w != "_" )
  end

  def initialize(oldpath,newpath)
    if oldpath then
      @action = "update"
      oldwords = []
      readFile(oldpath).split(/\W/).each do |w| 
        oldwords.push(w) if wcond(w) 
      end
    else
      @action = "new"
      oldwords = []
    end
    newwords = []
    readFile(newpath).split(/\W/).each do |w|
      newwords.push(w) if wcond(w)
    end
    
    oldcnt=Hash.new(0)
    oldwords.each do |w|
      oldcnt[w]+=1 
    end

    @newwordh=Hash.new(0)
    newcnt=Hash.new(0)
    newwords.each do |w|
      newcnt[w]+=1 
      if oldcnt[w]==0 then
        @newwordh[w] += 1
      end
    end


    @alldiff=Hash.new(0)
    allwords=newcnt.keys + oldcnt.keys
    allwords.each do |w|
      next if w =~ /^_/ 
      if w.size > 1 then
        @alldiff[w] = newcnt[w] - oldcnt[w]
      end
    end
  end
  def diff()
    @alldiff = @alldiff.sort do |a,b| a[1] <=> b[1] end
    out=[]
    @alldiff.each do |v|
      out.push(v)
    end        

    
    @newwordhsorted = @newwordh.sort do |a,b| a[1] <=> b[1] end
    nout=[]
    @newwordhsorted.each do |v|
      nout.push(v)
    end
    return { :words => out.reverse, :newwords=>nout.reverse, :action=>@action }
  end
end
