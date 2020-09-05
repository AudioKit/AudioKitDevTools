#!/bin/bash
for i in yaml/effects/*.yaml; do echo "$i";./bin/generate_node.rb $i; done
