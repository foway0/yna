include scripts/variables.mk

test: ## check dependencies
	command -v docker
init: ## init repos
	@sh ${INIT} -t ${REPOS_CONF} -o ${OUTPUT_PATH}