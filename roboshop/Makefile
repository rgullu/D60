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
	@git pull &>/dev/nul
cart: git-pull ## Setup cart component
	@bash components/cart.sh
catalogue: git-pull ## Setup catalogue component
	@bash components/catalogue.sh
user: git-pull ## Setup user component
	@bash components/user.sh
shipping: git-pull ## Setup shipping component
	@bash components/shipping.sh
payment: git-pull ## Setup payment component
	@bash components/payment.sh
frontend: git-pull ## Setup frontend component
	@bash components/frontend.sh
mysql: git-pull ## Setup mysql component
	@bash components/mysql.sh
redis: git-pull ## Setup redis component
	@bash components/redis.sh
rabbitmq: git-pull ## Setup rabbitmq component
	@bash components/rabitmq.sh
mongodb: git-pull ## Setup mongodb component
	@bash components/mongodb.sh

