from passlib.hash import sha256_crypt

# Input password
password = "aashish@123"

# Hash the password
hashed_password = sha256_crypt.using(rounds=1000).hash(password)

# Print the hashed password
print("Hashed Password:", hashed_password)
