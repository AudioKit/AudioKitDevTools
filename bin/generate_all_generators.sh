#!/bin/bash
for i in yaml/generators/*.yaml; do ./bin/generate_generator_node.rb $i; done
