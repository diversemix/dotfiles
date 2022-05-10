#!/bin/bash

find . -maxdepth 2 -name package.json -exec dirname {} \; | grep -v node_modules
