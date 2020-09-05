#!/bin/bash
for i in yaml/generators/*.yaml; do echo "$i"; ./bin/generate_generator_node.rb $i; done

