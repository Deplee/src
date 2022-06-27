#!/bin/bash

while read response; do
echo
case $response in
[yY]) echo "YES" ;;
[nN]) echo "NO" ;;
esac
done
