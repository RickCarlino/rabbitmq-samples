# This shell script documents the steps to getting RMQ running on a Debian box.

# STEP 1: Install it- https://www.rabbitmq.com/install-debian.html

# Step 2: Download HTTP Auth backend here:
# http://www.rabbitmq.com/community-plugins.html

# Step 3: Move the *.ez file
#         to /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.10/plugins/

# Step 4: Add this to /etc/rabbitmq/rabbitmq.config: (MAYBE???)
# [
#   {rabbit, [{auth_backends, [rabbit_auth_backend_http]}]},
#   {rabbitmq_auth_backend_http,
#    [{http_method,   post},
#     {user_path,     "http://localhost:5050/auth/user"},
#     {vhost_path,    "http://localhost:5050/auth/vhost"},
#     {resource_path, "http://localhost:5050/auth/resource"},
#     {topic_path,    "http://localhost:5050/auth/topic"}]}
# ].

# Maybe us https://github.com/rabbitmq/rabbitmq-auth-backend-cache
