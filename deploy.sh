#!/bin/bash
cd k8s-files
/var/lib/jenkins/kubectl apply -f backend.yml
/var/lib/jenkins/kubectl apply -f frontend.yml