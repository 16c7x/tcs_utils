#!/bin/bash
puppet agent -t --color=false > /tmp/run_data.txt 2>&1
exit 0