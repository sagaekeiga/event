worker_processes 2
working_directory "/home/anime/event/current"

timeout 3600


listen "/var/run/unicorn/event.sock"
pid "/var/run/unicorn/event.pid"


stderr_path "/home/anime/event/current/log/unicorn.log"
stdout_path "/home/anime/event/current/log/unicorn.log"


preload_app true