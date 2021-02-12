require_relative "../lib/ray"

class Test
  def calling_method
    self.called_method
  end

  def called_method
    ray.caller
  end
end

ray.new_screen('Caller')

Test.new.calling_method
ray.caller