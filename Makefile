all: prepare start

prepare:
	terraform init
	terraform plan
	yes yes | terraform apply
	terraform output -json > config.json

start:
	vagrant up

stop:
	vagrant halt

console:
	vagrant ssh

cleanup_vm:
	vagrant destroy -f

cleanup_cloud:
	terraform destroy -force
	rm config.json

cleanup: cleanup_vm cleanup_cloud