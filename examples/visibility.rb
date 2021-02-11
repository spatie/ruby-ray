require_relative "../lib/ray"

ray().new_screen('Visibility')

ray('collapsed by default').hide

ray = ray('updating this message in two seconds')
sleep(2)
ray.send('updated message');

ray = ray('removing this item in two seconds')
sleep(2)
ray.remove

sleep(1)
ray('hiding the app window for two seconds...')
sleep(1)
ray().hide_app
sleep(2)
ray().show_app
ray('Hi again!')
