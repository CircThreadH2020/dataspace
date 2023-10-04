# Index

<!-- TOC -->
* [Index](#index)
* [Contract Usage Policies](#contract-usage-policies)
    * [Allow the Usage of the Data (PROVIDE_ACCESS)](#allow-the-usage-of-the-data--provideaccess-)
    * [Forbids the Usage of the Data (PROHIBIT_ACCESS)](#forbids-the-usage-of-the-data--prohibitaccess-)
    * [Limit the data usage to specific connectors (CONNECTOR_RESTRICTED_USAGE)](#limit-the-data-usage-to-specific-connectors--connectorrestrictedusage-)
    * [Limit data usage to a specific time interval (USAGE_DURING_INTERVAL)](#limit-data-usage-to-a-specific-time-interval--usageduringinterval-)
    * [Limit data usage to a specific duration of time (DURATION_USAGE)](#limit-data-usage-to-a-specific-duration-of-time--durationusage-)
    * [Use Data and Delete it After (USAGE_UNTIL_DELETION)](#use-data-and-delete-it-after--usageuntildeletion-)
    * [Log data usage locally (USAGE_LOGGING)](#log-data-usage-locally--usagelogging-)
    * [Notify a specific group of users or party when data is used (USAGE_NOTIFICATION)](#notify-a-specific-group-of-users-or-party-when-data-is-used--usagenotification-)
    * [Restrict the data usage to N times, maximum (N_TIMES_USAGE)](#restrict-the-data-usage-to-n-times-maximum--ntimesusage-)
<!-- TOC -->


# Contract Usage Policies

The DataspaceApp4EDI (i.e., Dataspace Connector extension) allows the use of the following classes to specify a contract.
Each of these classes describes an organization’s rule that may be an obligation, a permission or a prohibition. Additionally,
each contract can have one or a combination of these policies.
Below, the classes are explained in more detail:

### Allow the Usage of the Data (PROVIDE_ACCESS)
Provides data usage without any restrictions.
The use of this policy implies that there are no restrictions for the data usage.

An example of its use follows:
```
(...)
 "contracts": [
    {
      "title": "...",
      "start": "YYYY-MM-DDTHH:MM:SSZ",
      "end": "YYYY-MM-DDTHH:MM:SSZ",
      "consumer": "",
      "usagePolicies": [
        {
          "type": "PROVIDE_ACCESS"
        }
      ]
    }
(...)
```



### Forbids the Usage of the Data (PROHIBIT_ACCESS)
Forbids the usage of data. 

An example of its use follows:

```
(...)
 "contracts": [
    {
      "title": "...",
      "start": "YYYY-MM-DDTHH:MM:SSZ",
      "end": "YYYY-MM-DDTHH:MM:SSZ",
      "consumer": "",
      "usagePolicies": [
        {
          "type": "PROHIBIT_ACCESS"
        }
      ]
    }
(...)
```

### 	Limit the data usage to specific connectors (CONNECTOR_RESTRICTED_USAGE)
As the IDS allows the assignment of more than one 
connector to an IDS Participant, this class addresses the need to restrict
the data usage to specific connectors of the specific Data Consumer. 
This class is beneficial, for instance, if a company has a connector for
each department. As the Data Provider only wants a particular department 
to have access to its data, he can restrict access to the other company
connectors by only allowing a specific connector(defined on _keyValueSet_).

An example of its use follows:

```
(...)
 "contracts": [
    {
      "title": "...",
      "start": "YYYY-MM-DDTHH:MM:SSZ",
      "end": "YYYY-MM-DDTHH:MM:SSZ",
      "consumer": "",
      "usagePolicies": [
        {
            "type": "CONNECTOR_RESTRICTED_USAGE",
            "keyValueSet": {
                "url": "..."
            }
        },
      ]
    }
(...)
```



###	Limit data usage to a specific time interval (USAGE_DURING_INTERVAL)

This policy allows or inhibits data usage in a particular time interval,
e.g., beginning in January 2024 and finishing in February 2024.

An example of its use follows:

```
(...)
 "contracts": [
    {
      "title": "...",
      "start": "YYYY-MM-DDTHH:MM:SSZ",
      "end": "YYYY-MM-DDTHH:MM:SSZ",
      "consumer": "",
      "usagePolicies": [
        {
            "type": "USAGE_DURING_INTERVAL",
            "keyValueSet": {
                "start": "YYYY-MM-DDTHH:MM:SSZ",
                "end": "YYYY-MM-DDTHH:MM:SSZ"
            }
        }
      ]
    }
(...)
```

### Limit data usage to a specific duration of time (DURATION_USAGE)
Just as the previous one, this policy also allows or inhibits data usage.
However, instead of a time interval, the purpose of this policy class is
to define a time duration. An example is to create a policy that allows 
the use of data for two weeks.

An example of its use follows:

```
(...)
 "contracts": [
    {
      "title": "...",
      "start": "YYYY-MM-DDTHH:MM:SSZ",
      "end": "YYYY-MM-DDTHH:MM:SSZ",
      "consumer": "",
      "usagePolicies": [
        {
            "type": "DURATION_USAGE",
            "keyValueSet": {
                "duration": "PT1M30.5S"
            }
        }
      ]
    }
(...)
```



### Use Data and Delete it After (USAGE_UNTIL_DELETION)

This policy class requires the Data Consumer to delete the data. 
Therefore, it needs to be specified in the policy specification when to
delete it. It can, for instance, be right after using it or after two weeks.


```
(...)
 "contracts": [
    {
      "title": "...",
      "start": "YYYY-MM-DDTHH:MM:SSZ",
      "end": "YYYY-MM-DDTHH:MM:SSZ",
      "consumer": "",
      "usagePolicies": [
        {
            "type": "USAGE_UNTIL_DELETION",
            "keyValueSet": {
                "start": "YYYY-MM-DDTHH:MM:SSZ",
                "end": "YYYY-MM-DDTHH:MM:SSZ",
                "date": "YYYY-MM-DDTHH:MM:SSZ"
            }
        }
      ]
    }
(...)
```





### 	Log data usage locally (USAGE_LOGGING)
This policy allows the Data Provider to request the logging of the 
transferring information to the Clearing House. An example of this 
policy is logging the data modification.

An example of its use follows:

```
(...)
 "contracts": [
    {
      "title": "...",
      "start": "YYYY-MM-DDTHH:MM:SSZ",
      "end": "YYYY-MM-DDTHH:MM:SSZ",
      "consumer": "",
      "usagePolicies": [
        {
            "type": "USAGE_LOGGING"
        },
      ]
    }
(...)
```


### Notify a specific group of users or party when data is used (USAGE_NOTIFICATION)

This policy specifies when the provider wants to know when its data is 
accessed, when it leaves their sites, or even when it arrives at the 
consumer site.

An example of its use follows:

```
(...)
 "contracts": [
    {
      "title": "...",
      "start": "YYYY-MM-DDTHH:MM:SSZ",
      "end": "YYYY-MM-DDTHH:MM:SSZ",
      "consumer": "",
      "usagePolicies": [
        {
            "type": "USAGE_NOTIFICATION",
            "keyValueSet": {
                "url": "https://w3id.org/idsa/inesctec"
            }
        }
      ]
    }
(...)
```


### Restrict the data usage to N times, maximum (N_TIMES_USAGE)
This policy class restricts the number of times an action can be executed.
For instance, a policy can say that the data cannot be printed more than
five times or that data can only be read fifteen times.

An example of its use follows:

```
(...)
 "contracts": [
    {
      "title": "...",
      "start": "YYYY-MM-DDTHH:MM:SSZ",
      "end": "YYYY-MM-DDTHH:MM:SSZ",
      "consumer": "",
      "usagePolicies": [
        {
            "type": "N_TIMES_USAGE",
            "keyValueSet": {
                "value": "30"
            }
        }
      ]
    }
(...)
```

