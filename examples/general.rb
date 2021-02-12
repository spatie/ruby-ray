require_relative "../lib/ray"

ray.new_screen('General')

ray(nil)
ray(1234)
ray(true)
ray(false)
ray(['a' => 1, 'b' => 2, 'c' => ['d' => 4, 'e' => 5]])

ray('multiple', 'in', 1, 'go')