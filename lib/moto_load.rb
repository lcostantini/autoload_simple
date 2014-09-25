def Object.const_missing(name)
  directory = MotoLoad.path || "./lib/"
  begin
    require File.join(directory, name.downcase.to_s)
  rescue LoadError
    raise NameError
  end
  const_get(name)
end

class MotoLoad
  def self.path=(path)
    @path = path
  end
  
  def self.path
    @path
  end
end
