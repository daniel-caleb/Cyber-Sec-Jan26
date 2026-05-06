# 🧪 Linux Fundamentals Lab  
## 🔐 Secure Workspace Recovery

---

## 📌 Overview  
In this lab, you will work in a Linux environment that has been intentionally misconfigured. Your task is to investigate, identify issues, and restore the system to a clean and secure state.

You will practice:
- Linux file system navigation  
- File and directory management  
- File editing using `nano` or `vim`  
- File permissions using `chmod`  
- Basic troubleshooting in Linux  

---

## 🎯 Learning Objectives  
By the end of this lab, you should be able to:
- Identify and fix broken directory structures  
- Rename and organize files correctly  
- Modify file permissions appropriately  
- Fix permission-related access issues  
- Verify changes using Linux commands  

---

## 🧩 Scenario  
You are a junior system administrator assigned to a Linux server where a workspace called `secure_lab` has been misconfigured.

The system contains:
- Incorrect directory names  
- Misplaced files  
- Broken or misnamed files  
- Incorrect file permissions that restrict or expose access improperly  

Your job is to **restore order, fix permissions, and secure the environment**.

---

## 📁 Initial Workspace  
You will find a directory named:

secure_lab/


Inside it, the structure is intentionally broken and includes:
- Misnamed folders (e.g. `projcts`, `docs`, `script`)  
- Incorrect file names (e.g. `proj2.tx`, `todoo.txt`)  
- Files with restricted or incorrect permissions  
- A script file that may not execute properly  
- A temporary directory with leftover data  

---

## 🛠️ Tasks  

---

### 🔹 Part 1: Investigation 🔍  
Navigate into the workspace:

```bash
cd secure_lab
```
Then list all files and directories with details:
```
ls -lR
```

Identify and document:

- Incorrect directory names
- Misnamed files
- Files that cannot be accessed
- Permission issues

### 🔹 Part 2: Fix Directory Structure 📁

Rename the following directories:

- projcts → projects
- docs → documents
- script → scripts

Ensure all files remain in their correct locations.

### 🔹 Part 3: Fix File Naming Issues 🏷️

Correct the following file names:

- proj2.tx → project2.txt
- todoo.txt → todo.txt
- note.txt → notes.txt

### 🔹 Part 4: File Permissions 🔐

Using chmod, fix permissions as follows:

#### 📄 Project Files
- Owner: read and write
- Group: read only
- Others: no access
#### 📄 Documents
- All users: read access
- Only owner: write access
#### 📜 Script File (backup.sh)
- Must be executable
- Owner: full permissions
- Group and others: execute only

After fixing permissions, run the script:

`./backup.sh`

Expected output:

`Backup running...`

### 🔹 Part 5: Hidden File Task 👀

Create a hidden file inside secure_lab:

`.secure_note`

Add the following content:

`System restored successfully`

Set permissions so that:

**Only the owner can read and write, 
No access for group or others**
### 🔹 Part 6: Cleanup Task 🧹
Move old_data.txt into a backup/ directory (create it if it does not exist)
Remove the temp/ directory safely
### 🔹 Part 7: Logging Activity 📝

Create a file named:

`activity_log.txt`

Include:

Current working directory
Full directory listing (ls -lR)
Current date and time

Hint:

- `pwd >> activity_log.txt`
- `ls -lR >> activity_log.txt`
- `date >> activity_log.txt`

### 🚨 Important Notes
- Do NOT delete everything and recreate it ❌
- Always verify your changes using ls, cat, or stat
- Pay attention to permission errors
- Work step by step

### 🧠 Reflection Questions
- Which issue was the hardest to detect and fix? Why?
- What command helped you understand permissions best?
- What is the risk of incorrect file permissions in a real system?
- How would you prevent this kind of misconfiguration in production systems?

### 🎯 Expected Outcome

At the end of the lab, the system should be:

- Properly structured
- Correctly named
- Secure in terms of permissions
- Fully functional

### 🎉 Good Luck

Think like a system administrator: observe, verify, fix, and secure.
