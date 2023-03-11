# alertctl

[![LICENSE](https://img.shields.io/github/license/rcmelendez/alertctl.svg)](https://github.com/rcmelendez/alertctl/blob/master/LICENSE)
[![Releases](https://img.shields.io/github/release/rcmelendez/alertctl.svg)](https://github.com/rcmelendez/alertctl/releases)

Work with [Devo](https://www.devo.com/) alerts from the command line. 

`alertctl` is a CLI tool written in Bash that manages alert definitions, triggered alerts, comments, and tags using the [Devo Alerts API](https://docs.devo.com/space/latest/95128644/Alerts+API).

![Demo](img/demo.gif)


## Benefits
- Create, update, list, delete, enable, and disable alert definitions 
- Copy alert definitions over to another domain
- List triggered alerts and update their statuses
- Add or update comments and tags


## Prerequisites
- bash v4+
- jq
- curl


## Getting Started
### Step 1 - Get a Devo token 
Follow the steps from the [Devo Alerts API](https://docs.devo.com/confluence/ndt/latest/api-reference/alerts-api) documentation.

### Step 2 - Download alertctl
Run this command to create the `$HOME/.alertctl/bin` directory, download the tool, and make it executable:
```shell
(
  mkdir -p "${HOME}"/.alertctl/bin && cd "$_"
  curl -fsSLO "https://raw.githubusercontent.com/rcmelendez/alertctl/main/alertctl"
  chmod +x alertctl
)
```

### Step 3 - Add it to your path
Add the `$HOME/.alertctl/bin` directory to your PATH environment variable. To do this, update your `.bashrc` or `.zshrc` file and append the following line:
```shell
export PATH="${HOME}/.alertctl/bin:${PATH}"
```

and restart your shell.

### Step 4 - Provide your configuration
Configuration can be set either in a JSON file or with environment variables.

Use [`config.json`](https://github.com/rcmelendez/alertctl/blob/main/config.json) as an example. Replace `cloud`, `token`, and `targetToken` with your own settings. Save it as `$HOME/.alertctl/config.json`. The priority will be as follows (sorted from highest):

1. Config file specified by `--config`/`-c` option (e.g. `alertctl get --all -c ~/roberto.json`)
2. `$HOME/.alertctl/config.json`
3. Environment variables (`DEVO_CLOUD`, `DEVO_TOKEN`, and `DEVO_TARGET_TOKEN`)

### Step 5 - Run it!
A few sample commands to get you started:

#### Alert definitions
```shell
# list all alert definitions
alertctl get --all-definitions

# create a new alert definition
alertctl apply -f examples/create_each_alert.json

# copy active alert definitions
alertctl copy --active

# enable alert definition with ID 187491
alertctl enable --id 187491

# delete all alert definitions from the subcategory 'Firewall'
alertctl delete --subcategory "Firewall"
```

#### Triggered alerts
```shell
# list all triggered alerts (last 24h)
alertctl get --all

# list the first 50 triggered alerts from the last 6h
alertctl get --all --from 6h --limit 50

# list status from all triggered alerts in the last 7d
alertctl status --from 7d

# update all triggered alerts from the last hr to status 300 (closed)
alertctl update --all --status 300 --from 1h

# update watched alerts to status 300 (closed) using a config file (last 24h)
alertctl update --watched --status 300 -c myconfig.json
```

#### Comments and Tags
```shell
# list comments from all triggered alerts in the last 15d
alertctl get --comments --from 15d

# add comment to alert with ID 15992408
alertctl add --comment "Comment for my alert 15992408" --alert-id 15992408 --title "Comment Title"

# update comments with IDs 578967 and 578968
alertctl update --comment "Update comments in bulk" --comment-ids 578967,578968 --title "New Title"

# add the tag 'Production' to alert with ID 160236044
alertctl add --tag "Production" --alert-id 160236044

# delete comment with ID 417055
alertctl delete --comment-id 417055
```


## License
alertctl is licensed under the terms of the [MIT License](https://github.com/rcmelendez/devo-alerting-api/blob/main/LICENSE).


## Contact
Find me as __rcmelendez__ on [LinkedIn](https://www.linkedin.com/in/rcmelendez/), [Medium](https://medium.com/@rcmelendez), and [GitHub](https://github.com/rcmelendez/).
