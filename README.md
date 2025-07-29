# VPS Configuration with Ansible

Minimal ansible playbook that helps with some of the setup I frequently do on new VPS:
- Install Docker, and setup a new PostgreSQL server via a docker-compose file
- Install Caddy, and host an HTML page
- Setup a firewall

To use this, follow these steps:
- copy the template .env_EXAMPLE file to .env, and fill in credentials
    - I recommend a temporary psql password - this password will be stored in plaintext in the docker-compose file
- copy the template docker_psql/file/db_list_EXAMPLE.txt file, and fill in the list of databases to create
- use the run.sh script - ansible doesn't automatically load .env files like Python does, so this includes the set and source commands
- After executing, login to psql and change the user password to something more secure

I'll continue adding to this as I learn more - and I welcome any feedback. The next tool that I plan to learn and add is fail2ban, and I need to setup a backup system.

## Update: also added psql using native apt instead of docker.
The code as written in this repo doesn't work. Here's how to run it:

There are some tricky issues using ansible `become` to run psql commands from an un-privileged user. To get around that, I used a modified version of run.sh that runs ansible-playbook with sudo. I'm not sure if that's proper, so I didn't commit it.