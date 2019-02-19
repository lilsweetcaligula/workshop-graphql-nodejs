DOCKERCOMPOSE_PATH=resources/docker-compose/docker-compose.yml
DOCKER_IMG=wesovilabs/workshop-graphql-nodejs:local
DOCKER_RUN=docker-compose -f $(DOCKERCOMPOSE_PATH) run -p9001:9001 api
DOCKER_DATABASE=docker-compose -f $(DOCKERCOMPOSE_PATH) run -p5456:5432 database
DOCKER_STOP=docker-compose -f $(DOCKERCOMPOSE_PATH) down -v
DOCKER_CLEAN=docker-compose down -v --rmi local
DOCKER_BUILD=docker build -t=${DOCKER_IMG} .

install:
	yarn install;

build:
	$(DOCKER_BUILD)

run: build ;
	$(DOCKER_RUN)

database: ;
	$(DOCKER_DATABASE)

stop: ;
	$(DOCKER_STOP)

clean:
	rm -rf node_modules;
	$(DOCKER_CLEAN)

local:
	APP_CONFIG_PATH=./resources/local/config.json NODE_ENV=local npm start