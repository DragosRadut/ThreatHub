# ThreatHub
## Description
ThreatHub uses the VirusTotal API to detect known threats on a machine by scanning selected files using right click, *Scan with ThreatHub*.
## Implementation
* **setup.reg**: used to add the necessary Windows Registry entries for the *right click -> scan* funtionality;
* **scanner.bat**: the script that performs the call:
```
	* generate the hash for the selected file using *certutil*;
	* parse the output of *certutil* to store the hash only;
	* query *VirusTotal API*:
		curl -X GET -H "x-apikey: <apikey>" --url https://www.virustotal.com/api/v3/files/<hash>
	* save report option using *choice*
```
## Dependencies
* Windows Registry entries from *setup.reg*
* certutil
* VirusTotal API key
## DEMO
**Target**: EICAR test file

[DEMO](https://github.com/DragosRadut/ThreatHub/assets/95036874/a1706731-54b9-4317-a3b9-e1796d36bb0d)

