require_relative "../lib/ray"

class Test
  def calling_method
    called_method
  end

  def called_method
    ray.caller
  end
end

ray.new_screen("Caller")

Test.new.calling_method
ray.caller
ray.to_json(["a" => 1, "b" => 2, "c" => [3, 4]], {hey: 123})
