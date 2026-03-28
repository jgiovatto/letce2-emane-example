#!/bin/bash

. ./host/demo.env

letce2 lxc start  -e ./host/demo.env  --scenario-delay=10
