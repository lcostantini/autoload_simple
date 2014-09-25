def Object.const_missing(name)
  begin
    require File.join(MotoLoad.directory, name.downcase.to_s)
  rescue LoadError
    raise NameError
  end
  const_get(name)
end

class MotoLoad
  def self.path=(path)
    @path = path
  end
  
  def self.directory
    directory = @path || "./lib/"
  end
  
end
