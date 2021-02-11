require_relative "../lib/ray"

ray().new_screen('New screen')

ray('will clear in two seconds')

sleep(2)

ray().new_screen('this is the new screen')