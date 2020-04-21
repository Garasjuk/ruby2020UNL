# config.jwt do |jwt|
#   jwt.secret = ENV['DEVISE_JWT_SECRET_KEY']
#   jwt.dispatch_requests = [
#     ['POST', %r{^/login$}]
#   ]
#   jwt.revocation_requests = [
#     ['DELETE', %r{^/logout$}]
#   ]
#   jwt.expiration_time = 1.day.to_i
# end
