# Running the container using the newly built image
docker run -d -p 30023:22 -p 3000:3000 -v '/Users/denis/projects/docker-ssh/astro/projects:/app/projects' --name sshd_astro_container sshd_astro

# Print out port number
docker port sshd_astro_container

# Print out credentials
echo "Use username root"
echo "Use password astro"