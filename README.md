# Bash Practice Exercises

A collection of Bash practice exercises for different skill levels.

---

## **1. Basics: Command Line Practice**

### **1.1 List all files and directories in the current folder**
**Challenge:** List **only directories**.

<details>
<summary>View Answer</summary>

```bash
ls -l
```

To list only directories:

```bash
ls -d */
```

</details>

---

### **1.2 Find all `.txt` files in a folder**
**Challenge:** Modify it to search inside subdirectories.

<details>
<summary>View Answer</summary>

```bash
find . -type f -name "*.txt"
```

To search inside subdirectories:

```bash
find . -type f -name "*.txt"
```

</details>

---

### **1.3 Count how many lines are in a file**
**Challenge:** Find the file with the **most** lines in a folder.

<details>
<summary>View Answer</summary>

```bash
wc -l filename.txt
```

To find the file with the most lines:

```bash
find . -type f -exec wc -l {} + | sort -nr | head -1
```

</details>

---

## **2. Intermediate: Shell Scripting**

### **2.1 Write a script that prints "Hello, [your name]"**
**Challenge:** Modify it to accept the name as a **command-line argument**.

<details>
<summary>View Answer</summary>

```bash
#!/bin/bash
echo "Enter your name:"
read name
echo "Hello, $name!"
```

To accept a name as an argument:

```bash
#!/bin/bash
echo "Hello, $1!"
```

Run it with:

```bash
bash script.sh John
```

</details>

---

### **2.2 Loop through all `.txt` files in a directory and print their names**
**Challenge:** Make it count **the number of lines in each file**.

<details>
<summary>View Answer</summary>

```bash
for file in *.txt; do
    echo "Processing file: $file"
done
```

To count the lines:

```bash
for file in *.txt; do
    echo "$file: $(wc -l < "$file") lines"
done
```

</details>

---

## **3. Advanced: Automation & System Tasks**

### **3.1 Backup all `.log` files in `/var/logs`**
**Challenge:** Make a **script** that **automatically backs up logs daily**.

<details>
<summary>View Answer</summary>

```bash
tar -czf logs_backup.tar.gz /var/log/*.log
```

To automate daily backups, add this to `cron`:

```bash
0 2 * * * tar -czf /backup/logs_$(date +\%F).tar.gz /var/log/*.log
```

</details>

---

### **3.2 Check if a website is online**
**Challenge:** Write a script that checks if a website is **down** and sends an **email alert**.

<details>
<summary>View Answer</summary>

```bash
ping -c 3 google.com
```

To check if a site is down and send an email alert:

```bash
#!/bin/bash
if ! ping -c 3 google.com > /dev/null; then
    echo "Google is down!" | mail -s "Website Down Alert" user@example.com
fi
```

</details>

---

## **4. Real-World Challenge**

### **4.1 Find the most common word in a file (like your Python exercise)**
**Challenge:** Turn this into a script that works for **any text file**.

<details>
<summary>View Answer</summary>

```bash
tr -s ' ' '\n' < filename.txt | sort | uniq -c | sort -nr | head -1
```

To make it work for any file:

```bash
#!/bin/bash
if [ -f "$1" ]; then
    tr -s ' ' '\n' < "$1" | sort | uniq -c | sort -nr | head -1
else
    echo "Usage: bash script.sh filename.txt"
fi
```

Run it with:

```bash
bash script.sh textfile.txt
```

</details>
