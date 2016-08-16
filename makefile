IMAGE:=minionscloud/vault:test
CONTAINER:=test-vault.0
	
build:
	docker build -t $(IMAGE) .
	
run:
	docker rm -fv $(CONTAINER) 2> /dev/null 1>&2 || true
	docker run -d --name $(CONTAINER) -p 8200 $(IMAGE)
	docker exec -it $(CONTAINER) /bin/sh -c 'export VAULT_ADDR=http://127.0.0.1:8200; /bin/sh; true'
	docker rm -fv $(CONTAINER) 2> /dev/null 1>&2 || true
  
port:
	docker port $(CONTAINER) 80