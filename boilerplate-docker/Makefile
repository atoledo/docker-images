IMAGE="bosolutions/node-s3-cli"
CONATAINER_DEV="ns3_cli"

.PHONY: debug \
	release \
	clean

debug: clean \
	test

clean:
	docker stop $(CONATAINER_DEV) || true
	docker rm $(CONATAINER_DEV) || true

test:
	docker build -t $(IMAGE) --rm .
	docker run --name $(CONATAINER_DEV) --rm \
          -u $(id -u):$(id -g) \
					-v $(HOME)/projects/jj_hpi:/jj_hpi \
					-it $(IMAGE)

release:
#	docker build -t $(IMAGE):prod .
	docker build -t $(IMAGE):$(shell cat VERSION) .
#	docker push $(IMAGE):prod
	docker push $(IMAGE):$(shell cat VERSION)
	notify-send "Release finished"
