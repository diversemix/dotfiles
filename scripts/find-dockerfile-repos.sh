#!/bin/bash

find . -maxdepth 2 -name Dockerfile -exec dirname {} \; | grep -v node_modules
