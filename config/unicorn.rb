root = "/home/deployer/apps/file_upload/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn_file_upload.log"
stdout_path "#{root}/log/unicorn_file_upload.log"

listen "/tmp/unicorn.file_upload.sock"
listen 7012
worker_processes 2
timeout 30