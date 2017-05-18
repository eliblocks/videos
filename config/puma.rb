
workers Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 1)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

unless ENV['RACK_ENV'] == 'production'
  worker_timeout 36000
end

 on_worker_boot do
   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
 end

plugin :tmp_restart

