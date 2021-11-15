from werkzeug.security import generate_password_hash
hash = generate_password_hash('foobar')
hash
print ({hash})
print ("done")