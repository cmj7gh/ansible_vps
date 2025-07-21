set -a
source .env
set +a

ansible-playbook playbook.yml --connection=local --ask-become-pass