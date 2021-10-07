include scripts/variables.mk

test: ## check dependencies
	command -v npm
	command -v docker
init: ## init repos
	@sh ${INIT} -c init -t ${REPOS_CONF} -o ${OUTPUT_PATH}
init-clean: ## clean init repos
	@sh ${INIT} -c clean -t ${REPOS_CONF} -o ${OUTPUT_PATH}