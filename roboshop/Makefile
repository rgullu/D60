#!/bin/bash
help:
	@IFS=$$'\n' ; \
        help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
        for help_line in $${help_lines[@]}; do \
            IFS=$$'#' ; \
            help_split=($$help_line) ; \
            help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
            help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
            printf "%-15s %s\n" $$help_command $$help_info ; \
        done

git-pull:
	@echo -----------+Pulling Git Code+-------------
	@git pull &>/dev/nul
cart: git-pull ## Setup cart component
	@sudo bash components/cart.sh
catalogue: git-pull ## Setup catalogue component
	@sudo bash components/catalogue.sh
user: git-pull ## Setup user component
	@sudo bash components/user.sh
shipping: git-pull ## Setup shipping component
	@sudo bash components/shipping.sh
payment: git-pull ## Setup payment component
	@sudo bash components/payment.sh
frontend: git-pull ## Setup frontend component
	@sudo bash components/frontend.sh
mysql: git-pull ## Setup mysql component
	@sudo bash components/mysql.sh
redis: git-pull ## Setup redis component
	@sudo bash components/redis.sh
rabbitmq: git-pull ## Setup rabbitmq component
	@sudo bash components/rabitmq.sh
mongodb: git-pull ## Setup mongodb component
	@sudo bash components/mongodb.sh

