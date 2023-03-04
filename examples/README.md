# Examples

This directory contains a few JSON files that you can use with `alertctl` to create your own alert definitions using 3 of the most common alert types in Devo: **each**, **low**, and **rolling**.  

Example command:
```
alertctl apply -f /some/path/create_each_alert.json
```

## Each alert

The file `create_each_alert.json` creates an each alert called "Heartbeat Alert 5m" that triggers every 5 minutes. It uses the ingestion table **siem.logtrust.collector.counter**. The query works in any Devo domain.

## Low alert

The file `create_low_alert.json` creates a low alert called "Okta Ingestion Halted" that monitors Okta inactivity in the last hour. The Devo domain needs to have the table **auth.okta**.

## Rolling alert

The file `create_rolling_alert.json` creates a rolling alert called "Inactive Source" that monitors inactive tables using the ingestion table **siem.logtrust.collector.counter**. It runs every 24 hrs and looks for tables with no data in the last 2 days. The alert description shows the table name and the number of hours since the last event was received. This query also works in any Devo domain.

## Learn more

For more examples covering the rest of the alert types, review the [Request examples](https://docs.devo.com/space/latest/95128671/Working+with+alert+definitions+using+the+API#Request-examples) section from the Devo Alerts API documentation.