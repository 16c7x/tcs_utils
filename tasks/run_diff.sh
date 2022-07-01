#!/bin/bash
diff -y --suppress-common-lines /tmp/run_data.txt /tmp/role_base_linux.txt > /tmp/diff.txt
cat /tmp/diff.txt
exit 0