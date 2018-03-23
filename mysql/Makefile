IMAGE="bosolutions/d8-mysql"
CONATAINER_DEV="dev-d8-mysql"

.PHONY: debug \
	release \
	clean

debug: clean \
	test

test:
	docker build -t $(IMAGE) --rm .
	docker run --name $(CONATAINER_DEV) --rm \
				-p 3307:3306 \
				-e MYSQL_ALLOW_EMPTY_PASSWORD='yes' \
				-e MYSQL_USER='open_solutions' \
				-e MYSQL_PASSWORD='open_solutions' \
				-t $(IMAGE)

release:
#	docker build -t $(IMAGE_PROD):prod .
	docker build -t $(IMAGE):$(shell cat VERSION) .
#	docker push $(IMAGE_PROD):prod
	docker push $(IMAGE):$(shell cat VERSION)

clean:
	docker stop $(CONATAINER_DEV) || true
	docker rm $(CONATAINER_DEV) || true
