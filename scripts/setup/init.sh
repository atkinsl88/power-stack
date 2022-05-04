#! /bin/bash
. ./scripts/misc/globals.sh
. ./scripts/setup/setup.sh

#-------------------------- Execution --------------------------------

# Code
title "Cleaning" "Cleaning up any old instances"

# Cleanup
fin project rm -f

# Code
title "STEP 1" "Initializing codebase"

# Using "fin docker-compose run cli <command>" to run a one off command using the cli service config
# This way, we can run cli commands BEFORE starting the whole stack (which may fail without dependencies installed first)
subtitle " * CMS codebase"
fin docker-compose run --rm cli bash -lc /var/www/scripts/setup/backend/install_dependencies.sh

subtitle " * Frontend codebase"
fin docker-compose run --rm cli bash -lc /var/www/scripts/setup/frontend/install_dependencies.sh

subtitle " * Docs codebase"

fin docker-compose run --rm cli bash -lc /var/www/scripts/setup/docs/install_dependencies.sh

# Stack
title "STEP 2" "Initializing stack"
fin project start

# CMS
title "Installing CMS" "STEP 3"
fin docker-compose run --rm cli bash -lc /var/www/scripts/setup/backend/install_cms.sh

title "DONE!" "Completed all initialization steps"

echo -e "Dashboard: ${yellow} http://${VIRTUAL_HOST}${NC}"

br

echo -e "Backend: ${yellow}http://backend.${VIRTUAL_HOST}${NC}"
echo -e "Frontend: ${yellow}http://frontend.${VIRTUAL_HOST}${NC}"
echo -e "Docs: ${yellow}http://docs.${VIRTUAL_HOST}${NC}"

br

open "http://${VIRTUAL_HOST}"
#-------------------------- END: Execution --------------------------------