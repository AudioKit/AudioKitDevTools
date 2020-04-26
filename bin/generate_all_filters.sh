#!/bin/bash
for i in yaml/effects/*.yaml; do ./bin/generate_node.rb $i; done
