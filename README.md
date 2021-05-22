# Bludit-3-9-2-bb
2
Bludit 3.9.2 - bruteforce bypass - CVE-2019-17240
3
\
4
\
5
Very simple script based on CVE-2019-17240.
6
\
7
Original POC and explanation: https://github.com/bludit/bludit/pull/1090.  
8
  
9
  
10
```
11
usage: python ./bludit-3-9-2-bb.py -l 'http://sitename.com/admin/login' -u ./usernames_file_list.txt -p ./passwords_file_list.txt
12
​
13
-l : login page (example: http://192.168.1.50/admin/login)
14
-u : file with usernames list (one by line)
15
-p : file with passwords list (one by line)
16
-h : help (optional)
17
-v : verbose (optional, show all tested 'username:password')
18
```
19
​
20
​
21
​
No file chosen
Attach files by dragging & dropping, selecting or pasting them.
@LucaReggiannini
Commit changes
Commit summary
Create README.md
Optional extended description
Add an optional extended description…
 Commit directly to the master branch.
 Create a new branch for this commit and start a pull request. Learn more about pull requests.
 
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
