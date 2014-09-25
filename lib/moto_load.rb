def Object.const_missing(name)
  dc_name = name.downcase.to_s
  dir = MotoLoad.path || "../lib/"
  file = File.expand_path("../#{dir}/#{dc_name}.rb", __FILE__)
  begin
    require file
  rescue LoadError
    raise NameError
  end
  inherit_class = const_get(name)
  return inherit_class
end

class MotoLoad
  def self.path=(path)
    @path = path
  end
  
  def self.path
    @path
  end
end
