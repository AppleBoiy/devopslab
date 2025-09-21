# Requirements

This task involves analyzing an Nginx access log file to extract useful insights.

## Log File Details

The log file contains the following fields:
- **IP address**
- **Date and time**
- **Request method and path**
- **Response status code**
- **Response size**
- **Referrer**
- **User agent**

You can download the sample Nginx access log file from the following link:
[Sample Nginx Access Log](https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log)

---

## Objectives

Create a shell script that reads the log file and provides the following information:
1. **Top 5 IP addresses** with the most requests.
2. **Top 5 most requested paths**.
3. **Top 5 response status codes**.
4. **Top 5 user agents**.

---

## Goal

The goal of this task is to practice log analysis and scripting skills by extracting meaningful data from an Nginx access log file.