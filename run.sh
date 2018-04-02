#!/bin/bash

ansible-playbook --verbose --tags=nginx -i hosts rtmpstreaming.yml --ask-become-pass



