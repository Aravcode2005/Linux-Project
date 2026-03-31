

---

 What This Repo Contains

Five shell scripts for the Open Source Audit capstone project. Each script is standalone and runs on Ubuntu/Debian Linux.

---

 Scripts

| File | What it does |
|---|---|
| `script1_system_identity.sh` | Shows kernel, user, uptime, distro and license info |
| `script2_package_inspector.sh` | Checks if python3 is installed and shows package details |
| `script3_disk_auditor.sh` | Audits permissions and size of key system directories |
| `script4_log_analyzer.sh` | Reads a log file and counts keyword matches |
| `script5_manifesto.sh` | Interactive tool that generates your open source manifesto |

---

 How to Run

 Step 1 — Clone the repo
```bash
cd oss-audit-[rollnumber]
```

### Step 2 — Make scripts executable
```bash
chmod +x *.sh
```

### Step 3 — Run each script

**Script 1:**
```bash
./script1_system_identity.sh
```

**Script 2:**
```bash
./script2_package_inspector.sh
```

**Script 3:**
```bash
./script3_disk_auditor.sh
```

**Script 4** (pass a log file path and optional keyword):
```bash
./script4_log_analyzer.sh /var/log/syslog error
```

**Script 5:**
```bash
./script5_manifesto.sh
```
This one asks three questions interactively.

---

## Dependencies

- Bash (already on every Linux)
- `python3` — needed for scripts 2 and 3: `sudo apt install python3`
- `dpkg` — pre-installed on Ubuntu/Debian

Scripts were tested on Ubuntu. On RHEL/Fedora, change `dpkg` in script 2 to `rpm -q`.
