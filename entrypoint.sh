#!/bin/bash

service nginx restart

supervisord  -c supervisord.conf
