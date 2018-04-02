IPADDRESS=$(shell grep -n ansible_host hosts|tail -1|cut -f2 -d'='|cut -f1 -d' ')

.PHONY: all

all:
	ssh-keygen -f $(HOME)"/.ssh/known_hosts" -R $(IPADDRESS) ;\
	sshpass -p raspberry ssh-copy-id -o StrictHostKeyChecking=no pi@$(IPADDRESS) ;\
	bash run.sh ;\
