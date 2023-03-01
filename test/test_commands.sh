#!/usr/bin/env bash
# 
# test_commands.sh includes all the alertctl commands sucessfully tested.
# It is not meant to be run as a script.
#
#
# Version:  1.1.0
# Author:   Roberto Meléndez  [Cambridge, USA]
# GitHub:   https://github.com/rcmelendez/alertctl
# API Doc:  https://docs.devo.com/space/latest/95128644
# Contact:  @rcmelendez on LinkedIn, Medium, and GitHub



#########
#  ADD  #
#########

# Comments

# ADD-01: add comment to alert with ID 159924089
alertctl add --comment "Comment for my alert 159924089" --alert-id 159924089 --title "Comment Title"

# ADD-02: add the same comment to 3 alerts in bulk
alertctl add --comment "Comment in bulk for 3 alerts" --alert-ids 160233020,160233151,160233437 --title "Comment in bulk"

# ADD-03: add comment to alert with ID 160497872 using a config file
alertctl add --comment "Comment for my alert 160497872" --alert-id 160497872 --title "Comment Title" -c myconfig.json


# Tags

# ADD-04: add the tag 'Production' to alert with ID 160236044
alertctl add --tag "Production" --alert-id 160236044

# ADD-05: add the same 3 tags to 2 alerts with IDs 160258723 and 160238465
alertctl add --tag "linux,auditd,staging" --alert-ids 160258723,160238465

# ADD-06: add the tag 'DevOps' to alert with ID 160497942 using a config file
alertctl add --tag "DevOps" --alert-id 160497942 -c myconfig.json


###########
#  APPLY  #
###########

# APPLY-01: create new alert definition with JSON file
alertctl apply -f create_alert.json

# APPLY-02: update exisitng alert definition with JSON file
alertctl apply -f update_alert.json

# APPLY-03: create new alert definition with JSON file using a config file
alertctl apply -f create_alert.json -c myconfig.json

# APPLY-04: update exisitng alert definition with JSON file using a config file
alertctl apply -f update_alert.json -c myconfig.json


##########
#  COPY  #
##########

# COPY-01: copy alert definitions where the name contains 'Firewall'
alertctl copy --name "Firewall"

# COPY-02: copy alert definitions where the subcategory contains 'Testing'
alertctl copy --subcategory "Testing"

# COPY-03: copy alert definition with ID 183574
alertctl copy --id 183574

# COPY-04: copy inactive alert definitions
alertctl copy --inactive

# COPY-05: copy active alert definitions using a config file
alertctl copy --active -c myconfig.json

# COPY-06: copy all alert definitions using a config file
alertctl copy --all -c myconfig.json


############
#  ENABLE  #
############

# ENABLE-01: enable alert definition where the name contains 'v2.0'
alertctl enable --name "v2.0"

# ENABLE-02: enable alert definition with ID 187491
alertctl enable --id 187491

# ENABLE-03: enable alert definitions where the subcategory contains 'Testing'
alertctl enable --subcategory "Testing"

# ENABLE-04: enable inactive alert definitions
alertctl enable --inactive

# ENABLE-05: enable all alert definitions using a config file
alertctl enable --all -c myconfig.json


#############
#  DISABLE  #
#############

# DISABLE-01: disable alert definition where the name contains 'Malware'
alertctl disable --name "Malware"

# DISABLE-02: disable alert definition with ID 172270
alertctl disable --id 172270

# DISABLE-03: disable alert definitions where the subcategory contains 'Testing'
alertctl disable --subcategory "Testing"

# DISABLE-04: disable active alert definitions
alertctl disable --active

# DISABLE-05: disable all alert definitions using a config file
alertctl disable --all -c myconfig.json


############
#  DELETE  #
############

# Alert definitions

# DELETE-01: delete alert definitions where the subcategory contains 'Testing'
alertctl delete --subcategory "Testing"

# DELETE-02: delete alert definition with ID 170223
alertctl delete --id 170223

# DELETE-03: delete alert definition where the name contains 'Critical Error'
alertctl delete --name "Critical Error"

# DELETE-04: delete inactive alert definitions
alertctl delete --inactive

# DELETE-05: delete active alert definitions
alertctl delete --active

# DELETE-06: delete all alert definitions
alertctl delete --all

# DELETE-07: delete alert definitions where the subcategory contains 'Testing' using a config file
alertctl delete --subcategory "Testing" -c myconfig.json

# DELETE-08: delete alert definitions where the name contains 'App' using a config file
alertctl delete --name "App" -c myconfig.json


# Comments

# DELETE-09: delete comment with ID 417055
alertctl delete --comment-id 417055

# DELETE-10: delete comment with IDs 578968 and 578969
alertctl delete --comment-ids 578968,578969


#########
#  GET  #
#########

# Alert Definitions

# GET-01: list all alert definitions
alertctl get --all-definitions

# GET-02: list all alert names
alertctl get --all-names

# GET-03: list all subcategories
alertctl get --all-subcategories

# GET-04: list active alert definitions
alertctl get --active

# GET-05: list active alert names
alertctl get --active-names

# GET-06: list inactive alert definitions
alertctl get --inactive

# GET-07: list inactive alert names
alertctl get --inactive-names

# GET-08: list favorite alert definitions
alertctl get --favorite

# GET-09: list favorite alert names
alertctl get --favorite-names

# GET-10: list alert definitions where the name contains 'Critical Error'
alertctl get --name "Critical Error"

# GET-11: list alert definitions where the subcategory contains 'My_Alerts'
alertctl get --subcategory "My_Alerts"

# GET-12: get alert definition with ID 187491
alertctl get --id 187491


# Triggered alerts

# GET-13: list all triggered alerts (last 24h)
alertctl get --all

# GET-14: list all triggered alerts from the last month
alertctl get --all --from 1M

# GET-15: list the first 50 triggered alerts from the last 6h
alertctl get --all --from 6h --limit 50

# GET-16: list the first 100 triggered alerts from the last 90 minutes and disregard the first 10
alertctl get --all --from 90m --limit 100 --offset 10

# GET-17: list all triggered alerts from the last 7d (including closed and false positive)
alertctl get --all --from 7d --show-all

# GET-18: list the first 50 triggered alerts without nulls (last 24h)
alertctl get --all --limit 50 --no-nulls

# GET-19: list the first 25 triggered alerts sorted by status (last 24h)
alertctl get --all --limit 25 --order-by "status"

# GET-20: list all triggered alerts sorted by context in descending order (last 24h)
alertctl get --all --order-by "context" --desc

# GET-21: list only 100 triggered alerts sorted by id (last 24h)
alertctl get --all --limit 100 --desc

# GET-22: get triggered alert with ID 137861977
alertctl get --alert-id 137861977

# GET-23: get triggered alert with ID 155234804 without comments
alertctl get --alert-id 155234804 --no-comments

# GET-24: get triggered alert with ID 155234804 without tags
alertctl get --alert-id 155234804 --no-tags

# GET-25: get triggered alert with ID 155234804 without comments and tags
alertctl get --alert-id 155234804 --no-comments --no-tags


# Comments

# GET-26: list comments from all triggered alerts (last 24h)
alertctl get --comments

# GET-27: list comments from all triggered alerts in the last 15d
alertctl get --comments --from 15d

# GET-28: list comments from all triggered alerts in the last 3d using a config file
alertctl get --comments --from 3d -c myconfig.json


# Extra tags: --queries and --no-nulls

# GET-29: list all alert definitions without nulls
alertctl get --all-definitions --no-nulls

# GET-30: list active alert definitions without nulls
alertctl get --active --no-nulls

# GET-31: list inactive alert definitions without nulls
alertctl get --inactive --no-nulls

# GET-32: list favorite alert definitions without nulls
alertctl get --favorite --no-nulls

# GET-33: list all triggered alerts without nulls (last 24h)
alertctl get --all --no-nulls

# GET-34: list all triggered alerts from the last 2d without nulls
alertctl get --all --from 2d --no-nulls

# GET-35: list queries from all alert definitions
alertctl get --all-definitions --queries

# GET-36: list queries from active alert definitions
alertctl get --active --queries

# GET-37: list queries from inactive alert definitions
alertctl get --inactive --queries

# GET-38: list queries from favorite alert definitions
alertctl get --favorite --queries


# Using a config file

# GET-39: get all definitions using a config file
alertctl get --all-definitions -c myconfig.json

# GET-40: get all subcategories using a config file
alertctl get --all-subcategories -c myconfig.json

# GET-41: get all alert names using a config file
alertctl get --all-names -c myconfig.json

# GET-42: get active alert definitions using a config file
alertctl get --active -c myconfig.json

# GET-43: get active alert definitions using a config file without nulls
alertctl get --active -c myconfig.json --no-nulls

# GET-44: list queries from active alert definitions using a config file
alertctl get --active -c myconfig.json --queries

# GET-45: get active alert names using a config file
alertctl get --active-names -c myconfig.json

# GET-46: get inactive alert definitions using a config file
alertctl get --inactive -c myconfig.json

# GET-47: get inactive alert definitions using a config file without nulls
alertctl get --inactive -c myconfig.json --no-nulls

# GET-48: list queries from inactive alert definitions using a config file
alertctl get --inactive -c myconfig.json --queries

# GET-49: get inactive alert names using a config file
alertctl get --inactive-names -c myconfig.json

# GET-50: get favorite alert definitions using a config file
alertctl get --favorite -c myconfig.json

# GET-51: get favorite alert definitions using a config file without nulls
alertctl get --favorite -c myconfig.json --no-nulls

# GET-52: list queries from favorite alert definitions using a config file
alertctl get --favorite -c myconfig.json --queries

# GET-53: get favorite alert names using a config file
alertctl get --favorite-names -c myconfig.json

# GET-54: list alert definitions where the subcategory contains 'System_Monitor' using a config file
alertctl get --subcategory "System_Monitor" -c myconfig.json

# GET-55: list alert definitions where the name contains 'HeartBeat'
alertctl get --name "HeartBeat" -c myconfig.json

# GET-56: get alert definition with ID 160611 using a config file
alertctl get --id 160611 -c myconfig.json


# Triggered Alerts

# GET-57: list all triggered alerts using a config file (last 24h)
alertctl get --all -c myconfig.json

# GET-58: list all triggered alerts from the last 6h using a config file
alertctl get --all --from 6h -c myconfig.json

# GET-59: get triggered alert with ID 155758082 using a config file
alertctl get --alert-id 155758082 -c myconfig.json

# GET-60: get triggered alert with ID 155965892 without comments using a config file
alertctl get --alert-id 155965892 --no-comments -c myconfig.json

# GET-61: get triggered alert with ID 155965892 without tags using a config file
alertctl get --alert-id 155965892 --no-tags -c myconfig.json

# GET-62: get triggered alert with ID 155965892 without comments and tags using a config file
alertctl get --alert-id 155965892 --no-comments --no-tags -c myconfig.json


############
#  UPDATE  #
############

# Triggered alerts

# UPDATE-01: update alert with ID 137861977 to status 100 (watched)
alertctl update --alert-id 137861977 --status 100

# UPDATE-02: update watched alerts to status 300 (closed) from the last 7d
alertctl update --watched --status 300 --from 7d

# UPDATE-03: update all triggered alerts from the last hr to status 300 (closed)
alertctl update --all --status 300 --from 1h

# UPDATE-04: update closed alerts to status 0 (unread) from the last 15d
alertctl update --closed --status 0 --from 15d

# UPDATE-05: update alert with ID 137861977 to status 100 (watched) using a config file
alertctl update --alert-id 137861977 --status 100 -c myconfig.json

# UPDATE-06: update watched alerts to status 300 (closed) using a config file (last 24h)
alertctl update --watched --status 300 -c myconfig.json


# Comments

# UPDATE-07: update comment with ID 578969
alertctl update --comment "Updated comment message" --comment-id 578969 --title "New Title"

# UPDATE-08: update comments with IDs 578967 and 578968
alertctl update --comment "Update comments in bulk" --comment-ids 578967,578968 --title "New Title"

# UPDATE-09: update comment with ID 581431 using a config file
alertctl update --comment "Updated comment message" --comment-id 581431 --title "New Title" -c myconfig.json


############
#  STATUS  #
############

# STATUS-01: list status from all triggered alerts (last 24h)
alertctl status

# STATUS-02: list status from all triggered alerts in the last 7d
alertctl status --from 7d

# STATUS-03: list status from all triggered alerts since epoch 1669852800000 (2022-12-01 00:00:00 UTC)
alertctl status --from 1669852800000

# STATUS-04: list status from all triggered alerts using a config file (last 24h)
alertctl status -c myconfig.json