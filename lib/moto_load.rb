def Object.const_missing(name)
  path = MotoLoad.new_path

  if path.nil?
    dc_name = name.downcase
    file = "./lib/#{dc_name}.rb"

    begin
      require file
    rescue LoadError
      raise NameError
    end

  else
    directory = File.expand_path("../#{path}", __FILE__)
    Dir["#{directory}/*.rb"].each {|file| require file }
  end

  inherit_class = const_get(name)
  return inherit_class
end

class MotoLoad
  @@new_path = nil

  def self.path=(path)
    @@new_path = path
  end
  
  def self.new_path
    @@new_path
  end
end
