#!/bin/sh
while [ 1 ]; do sensors | grep Core; echo '----8<----'; sleep 1; done
