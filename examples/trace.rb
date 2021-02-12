require_relative "../lib/ray"

class Test
  def calling_method
    self.called_method
  end

  def called_method
    ray.trace
  end
end

ray.new_screen('Trace')

Test.new.calling_method
ray.trace