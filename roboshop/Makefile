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
cart: ## Setup cart component
	@bash components/cart.sh
catalogue: ## Setup catalogue component
	@bash components/catalogue.sh
user: ## Setup user component
	@bash components/user.sh
shipping: ## Setup shipping component
	@bash components/shipping.sh
payment: ## Setup payment component
	@bash components/payment.sh
frontend: ## Setup frontend component
	@bash components/frontend.sh
mysql: ## Setup mysql component
	@bash components/mysql.sh
redis: ## Setup redis component
	@bash components/redis.sh
rabbitmq: ## Setup rabbitmq component
	@bash components/rabitmq.sh
mongodb: ## Setup mongodb component
	@bash components/mongodb.sh

