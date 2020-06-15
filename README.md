# Salesforce CLI Contract Settings bug repro demo

## Summary

When pushing source to a scratch org, the `autoCalculateEndDate` value in `Contract.settings-meta.xml` will not be used, causing the push to fail if any code or no-code automation tries to modify `Contract.endDate`.

## Steps to Reproduce

1.  Clone the repo and `cd` into the project root directory
2.  `./createOrgFailPush`
3.  Note that the push command in the script failed to push with an error that Contract.EndDate is not writeable, even though `force-app/main/default/settings/Contract.settings-meta.xml` contains `<autoCalculateEndDate>false</autoCalculateEndDate>`:
    
    ```
    TYPE   PROJECT PATH                                     PROBLEM
    ─────  ───────────────────────────────────────────────  ───────────────────────────────────────────────         
    Error  force-app/main/default/classes/ContractTest.cls  Field is not writeable: Contract.EndDate (6:18)         
    ERROR running force:source:push:  Push failed.          
    ```
    
4.  `./preDeployContractSettingsAndPush`
5.  Note that the push command in this script succeeds, because `Contract.settings-meta.xml` was previously deployed.
