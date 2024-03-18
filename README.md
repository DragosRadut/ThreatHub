# ThreatHub
## Description
ThreatHub uses the VirusTotal API to detect known threats on a machine by scanning selected files using right click, *Scan with ThreatHub*.
## Implementation
* **setup.reg**: used to add the necessary Windows Registry entries for the *right click -> scan* funtionality;
* **scanner.bat**: the script that performs the call;
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
