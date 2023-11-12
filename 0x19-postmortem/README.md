# Account Suspension Incident
![](https://github.com/calebrori/images/blob/3abca5c3e6bd0a9a9840d234e6fa6df37521a518/0x19-postmortem/GitHub%20Suspended.png)

The outage resulted from a security breach leading to unauthorized access to GitHub's authentication systems, allowing attackers to suspend accounts at will.

## Issue Summary
![](https://github.com/calebrori/images/blob/2f9122032634023d329d9a0416cc539264be23f0/0x19-postmortem/Suspensions.png)

Users experienced complete unavailability of their GitHub accounts. Authentication processes were compromised, affecting 40% of the user base.

## Timeline (all time in EAT + 3)
| Time (EAT + 3) | Actions |
| -------------- | -------- |
| 0830HRS | Investigation into recent code changes |
| 1000HRS | Escalated to the Security and Authentication teams |
| 1030HRS | Reset passwords for affected accounts and communicated the incident to users |

## Preventive measures
![](https://github.com/calebrori/images/blob/a69eaa92cc928973221e5bb702eba6572445de54/0x19-postmortem/2FA.jpg)

- The security breach was mitigated by temporarily suspending account suspension capabilities, rolling back authentication system changes, and resetting passwords for affected accounts. The incident response team conducted a thorough review of affected systems to ensure no lingering vulnerabilities.
