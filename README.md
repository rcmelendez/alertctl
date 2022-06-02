# alertctl
alertctl is a CLI tool written in Bash that manages alert definitions using the Devo Alerting API. You can create, update, list, delete, enable, and disable alert definitions in a Devo domain, or copy them over to another domain.


## Prerequisites
- bash v4+
- jq
- curl


## Getting Started
### Step 1 - Get a Devo token 
Follow the steps from the [Devo Alerts API](https://docs.devo.com/confluence/ndt/latest/api-reference/alerts-api) documentation.

### Step 2 - Clone this GitHub repo
```
git clone https://github.com/rcmelendez/devo-alerting-api.git
```

### Step 3 - Provide your configuration in a JSON file
Use the `config.json` file in this repo as an example. Replace the keys (`cloud`, `token`, `domain`, etc) with your own settings. Depending on the filename and its location one will take predence over the other. 

Config search paths sorted by priority:

1. Path to the config file specified by `--config` or `-c` option.
2. `config.json` in the same directory with `alertctl`.
3. `.devo.json` or `.config/devo.json` in the user home directory. 
4. Embedded config (not recommended).

### Step 4 - Check permissions and add it to your path
Make sure that `alertctl` has execution permissions, otherwise run: 
```
chmod +x alertctl
```

Also, for convenience, add it to your path: 
```
sudo mv alertctl /usr/local/bin
```

### Step 5 - Run it!
A few sample commands to get you started:

<details open>
<summary>List all alert definitions in your domain:</summary>
<br>
  
```
alertctl get --all
```
</details>

<details>
<summary>List alert definitions with the name 'Log4j':</summary>
<br>

```
alertctl get --name "Log4j"
```
</details>

<details>
<summary>Enable all inactive alert definitions in your domain:</summary>
<br>
  
```
alertctl enable --inactive
```
</details>

<details>
<summary>Copy all active alert definitions over to another domain using a config file:</summary>
<br>
  
```
alertctl --config roberto.json copy --active
```
</details>

<details>
<summary>Disable the alert definition with ID 165493:</summary>
<br>
  
```
alertctl disable --id 165493
```
</details>

<details>
<summary>Create a new alert definition from a JSON file:</summary>
<br>
  
```
alertctl apply --file my_new_alert.json
```
</details>

<details>
<summary>Delete all alerts from the subcategory 'Firewall':</summary>
<br>
  
```
alertctl delete --subcategory "Firewall"
```
</details>


## License
alertctl is licensed under the terms of the [MIT License](https://github.com/rcmelendez/devo-alerting-api/blob/main/LICENSE).


## Contact
Find me as __rcmelendez__ on [LinkedIn](https://www.linkedin.com/in/rcmelendez/), [Medium](https://medium.com/@rcmelendez), and [GitHub](https://github.com/rcmelendez/).
