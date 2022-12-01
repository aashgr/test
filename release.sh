#!/bin/bash
git pull && mvn --batch-mode release:prepare && mvn release:perform && git push && git push --tags