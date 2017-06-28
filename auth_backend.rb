require "sinatra"
set :port, 5050

[ "/auth/user", "/auth/vhost", "/auth/resource", "/auth/topic" ].map do |path|
  get path do
    binding.pry
  end
end
