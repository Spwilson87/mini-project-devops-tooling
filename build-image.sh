#!/bin/bash
cd frontend
docker build -t spwilson87/nginx-mini:latest .
cd ../backend
docker build -t spwilson87/nodejs-mini:latest .
