./ssh-keygen -t rsa -f ssh_host_rsa_key -N ""
./ssh-keygen -t dsa -f ssh_host_dsa_key -N ""
./ssh-keygen -t ecdsa -f ssh_host_ecdsa_key -N ""
./ssh-keygen -t dsa -f ssh_host_ed25519_key -N ""
chmod  600 ssh_host_ed25519_key
