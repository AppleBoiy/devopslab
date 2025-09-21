# Requirements

The tool should run from the command line, accept the log directory as an argument, compress the logs, and store them in a new directory.

## Features

1. **Command-line Argument**
   The user should provide the log directory as an argument when running the tool.
   Example:
   ```bash
   log-archive <log-directory>
   ```

2. Log Compression
   The tool should compress the logs into a tar.gz file and store them in a new directory.

3. Archive Logging
   The tool should log the date and time of the archive creation to a file.
   Example:
   ```Shell
   logs_archive_20240816_100648.tar.gz
   ```
   
## Goal

The goal is to create a simple and efficient log archiving tool that automates the process of compressing and organizing log files.