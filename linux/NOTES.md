markdown
Copy code
# Follow WireMock Logs with SSH in Separate Terminal Windows

This script is designed to open multiple terminal windows and dynamically follow the logs of the WireMock service running on different servers via SSH. Each server's logs are displayed in a separate `mate-terminal` window.

## How It Works

The script performs the following steps:

1. **Opens a new `mate-terminal` window** using the `bash -c` command.
2. **SSHs into each specified server** using the provided SSH private key and username.
3. **Runs the log command** (`journalctl -u wiremock -f`) on the remote server to dynamically follow the WireMock logs.
4. **Keeps the terminal open** after executing the log command by using `exec bash`.

## Script Details

- `mate-terminal -- bash -c`: Opens a new `mate-terminal` window and runs the specified command in a bash shell.
- `ssh -i $ssh_key $ssh_user@$server`: This SSHs into each server using your private key and username.
- `'$log_command'`: This runs the log command (in this case, `journalctl -u wiremock -f`) to follow the WireMock logs dynamically.
- `exec bash`: Keeps the terminal window open after the command completes. Without `exec bash`, the terminal window would close as soon as the command finishes.

## Steps to Use the Script

1. **Make the Script Executable**  
   After saving the script as `follow_wiremock_logs.sh`, make it executable by running the following command:

   ```bash
   chmod +x follow_wiremock_logs.sh
Run the Script
Execute the script to open new mate-terminal windows for each server and follow the logs dynamically:

bash
Copy code
./follow_wiremock_logs.sh
What Happens
This script will open a new mate-terminal window for each WireMock server.
Each window will dynamically follow the logs of the WireMock service using journalctl -f.
You will see live logs from each server in separate terminal windows.
Example Output
Terminal Window 1 (server1.example.com):
bash
Copy code
-- Logs begin at Wed 2024-10-23 10:00:00 UTC, end at Wed 2024-10-23 12:00:00 UTC. --
Oct 23 11:55:01 server1 wiremock[12345]: Received request to /api/test
Oct 23 11:55:01 server1 wiremock[12345]: Served response with status 200
Terminal Window 2 (server2.example.com):
bash
Copy code
-- Logs begin at Wed 2024-10-23 10:00:00 UTC, end at Wed 2024-10-23 12:00:00 UTC. --
Oct 23 11:55:05 server2 wiremock[23456]: Received request to /api/user
Oct 23 11:55:05 server2 wiremock[23456]: Served response with status 200
Terminal Window 3 (server3.example.com):
bash
Copy code
-- Logs begin at Wed 2024-10-23 10:00:00 UTC, end at Wed 2024-10-23 12:00:00 UTC. --
Oct 23 11:55:20 server3 wiremock[34567]: Received request to /api/orders
Oct 23 11:55:20 server3 wiremock[34567]: Served response with status 200
Conclusion
You now have a script that uses mate-terminal to open separate windows for each WireMock server, showing live logs dynamically. This should allow you to monitor the logs for each server in real time.
