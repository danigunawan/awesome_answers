class TestMeta

  "a".upto("z").each do |name|
    define_method(name) do
      puts "Hello #{name}"
    end
  end

  def method_missing(*args)
    method_name = args[0].to_s
    if method_name[0..6] == "find_by"
      field = method_name.gsub("find_by", "")
      puts "RUNNING QUERY:
            SELECT * from questions WHERE #{field}=#{args[1]}"
    else
      puts "ERROR!"
    end
  end


end
